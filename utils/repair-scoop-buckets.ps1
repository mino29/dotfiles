<#
.SYNOPSIS
    Repairs scoop bucket git repositories.

.DESCRIPTION
    Scoop buckets are plain git clones of upstream manifest repos. When a
    network drop interrupts `scoop update`, git can leave an unfinished merge
    behind. Every later `scoop update` then fails with:

        error: Pulling is not possible because you have unmerged files.
        fatal: Exiting because of an unresolved conflict.

    Worse, repeated failed merges can commit conflict markers into the bucket's
    HEAD, leaving `git status` clean while the manifests on disk are corrupt.

    Buckets carry no local work worth keeping, so the fix is to discard local
    state and hard-reset each bucket to origin/<default-branch>.

.PARAMETER Name
    Only repair the named bucket. Repairs all buckets when omitted.

.EXAMPLE
    .\repair-scoop-buckets.ps1
    .\repair-scoop-buckets.ps1 -Name main
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string[]] $Name
)

$ErrorActionPreference = 'Continue'

$scoopRoot = if ($env:SCOOP) { $env:SCOOP } else { "$env:USERPROFILE\scoop" }
$bucketsDir = Join-Path $scoopRoot 'buckets'

if (-not (Test-Path $bucketsDir)) {
    Write-Host "No scoop buckets directory at $bucketsDir" -ForegroundColor Yellow
    return
}

$buckets = Get-ChildItem $bucketsDir -Directory
if ($Name) {
    $buckets = $buckets | Where-Object { $Name -contains $_.Name }
}

if (-not $buckets) {
    Write-Host "No matching buckets to repair." -ForegroundColor Yellow
    return
}

$repaired = 0

foreach ($bucket in $buckets) {
    $dir = $bucket.FullName
    Write-Host "`n==> $($bucket.Name)" -ForegroundColor Cyan

    if (-not (Test-Path (Join-Path $dir '.git'))) {
        Write-Host "    not a git repo, skipping" -ForegroundColor DarkGray
        continue
    }

    # An interrupted merge leaves MERGE_HEAD behind; abort it so pull works again.
    if (Test-Path (Join-Path $dir '.git\MERGE_HEAD')) {
        Write-Host "    unfinished merge found, aborting" -ForegroundColor Yellow
        git -C $dir merge --abort 2>&1 | Out-Null
    }

    # Conflict markers can get committed into HEAD, so a clean `git status`
    # does not prove the manifests are intact. Only '<<<<<<<' is used as the
    # probe: '=======' and '>>>>>>>' also occur in legitimate upstream files
    # (banner comments, cheatsheet tables), which would give false positives.
    $markers = git -C $dir grep -l -e '^<<<<<<<' 2>$null
    if ($markers) {
        Write-Host "    conflict markers committed into HEAD:" -ForegroundColor Red
        $markers | Select-Object -First 5 | ForEach-Object { Write-Host "      $_" -ForegroundColor Red }
    }

    $upstream = git -C $dir symbolic-ref --short refs/remotes/origin/HEAD 2>$null
    if (-not $upstream) {
        # Older clones have no origin/HEAD; fall back to whatever origin tracks.
        $upstream = git -C $dir rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' 2>$null
    }
    if (-not $upstream) { $upstream = 'origin/master' }

    Write-Host "    resetting to $upstream"
    git -C $dir fetch --depth=1 origin 2>&1 | Out-Null
    git -C $dir reset --hard $upstream 2>&1 | Select-Object -Last 1

    $status = git -C $dir status --short 2>$null
    if ($status) {
        Write-Host "    still dirty:" -ForegroundColor Yellow
        $status | Select-Object -First 5 | ForEach-Object { Write-Host "      $_" -ForegroundColor Yellow }
    } else {
        Write-Host "    clean" -ForegroundColor Green
        $repaired++
    }
}

Write-Host "`n$repaired bucket(s) clean." -ForegroundColor Green
Write-Host "Run 'scoop update' to verify." -ForegroundColor DarkGray