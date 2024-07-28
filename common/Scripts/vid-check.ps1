param (
    [string]$targetDirectory
)

# Check if ffprobe is available
$ffprobePath = "ffprobe"
if (-not (Get-Command $ffprobePath -ErrorAction SilentlyContinue)) {
    Write-Error "ffprobe is not found in the system path. Please install FFmpeg and make sure ffprobe is in your PATH."
    exit 1
}

# Get all video files in the folder (you can add more extensions if needed)
# $videoFiles = Get-ChildItem -Path $targetDirectory -Filter -File *.mp4, *.mkv, *.avi
$videoFiles = Get-ChildItem -recurse -Path $targetDirectory | where {$_.extension -in ".mp4",".mkv", ".avi", ".mov", ".ts"}

foreach ($file in $videoFiles) {
    # Run ffprobe to check if the video file is playable
    $ffprobeOutput = & $ffprobePath -v error -show_format -show_streams -i $file.FullName 2>&1

    # Check if ffprobe returned an error
    if ($ffprobeOutput -like "*Invalid data found when processing input*" -or $LASTEXITCODE -ne 0) {
        # If ffprobe returns an error, delete the file
        Write-Output "[Bad] : $($file.FullName)"
        Remove-Item -Path $file.FullName -Force
    } else {
        Write-Output "[Good] : $($file.FullName)"
    }
}
