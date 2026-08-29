; ---- 自动重载 ----
SetTimer(UPDATEDSCRIPT, 1000)
UPDATEDSCRIPT() {
    attribs := FileGetAttrib(A_ScriptFullPath)
    if InStr(attribs, "A") {
        FileSetAttrib("-A", A_ScriptFullPath)
        Reload()
    }
}

; ---- 路径管理 ----
UserDir := "C:\Users\" A_UserName "\"
ScoopDir := UserDir "scoop\apps\"

appPaths := Map(
    "chrome",      ScoopDir "googlechrome\current\chrome.exe",
    "psysonic",    UserDir "AppData\Local\Programs\Psysonic\psysonic.exe",
    "goldendict",  ScoopDir "goldendict\current\GoldenDict.exe",
    "potplayer",   ScoopDir "potplayer\current\PotPlayer64.exe",
    "qalculate",   ScoopDir "qalculate\current\qalculate-qt.exe",
    "ariaGui",     ScoopDir "ariang-native\current\AriaNg Native.exe",
    "everything",  "C:\Program Files\EverythingToolbar\EverythingToolbar.Launcher.exe",
    "sumatra",     UserDir "AppData\Local\SumatraPdf\SumatraPDF.exe",
    "tdxw",        "C:\Program Files (x86)\zd_zsone\TdxW.exe"
)

; ---- 通用切换函数 ----
ToggleApp(exeName, path, winClass := "", waitTimeout := 3) {
    if WinExist(winClass ? "ahk_class " winClass : "ahk_exe " exeName) {
        WinActivate
    } else {
        Run(path)
        if waitTimeout
            WinWait(winClass ? "ahk_class " winClass : "ahk_exe " exeName, , waitTimeout)
    }
}

; ---- 窗口操作 ----
#h::MinimizeActiveWindow()
#m::MinimizeActiveWindow()

MinimizeActiveWindow() {
    if WinActive("ahk_class WorkerW")
        WinActivate("ahk_class Shell_TrayWnd")
    else
        WinMinimize("A")
}

#f::ToggleWindowSize()

ToggleWindowSize() {
    if WinGetMinMax("A") = 0
        WinMaximize("A")
    else
        WinRestore("A")
}

; ---- 快捷键绑定 ----
#y::Run("nvim " A_ScriptFullPath " " UserDir ".glzr\glazewm\config.yaml")
#q::Send("!{F4}")
#w::Send("^w")
#i::Run("ms-settings:bluetooth")
^+d::FileRecycleEmpty
<#z::Send("{Volume_mute}")

#Enter::ToggleApp("", "wt", "CASCADIA_HOSTING_WINDOW_CLASS")
#b::ToggleApp("chrome.exe", appPaths["chrome"])
#t::ToggleApp("", appPaths["psysonic"], "Tauri Window")
#s::ToggleApp("EverythingToolbar.Launcher.exe", appPaths["everything"])
#u::ToggleApp("GoldenDict.exe", appPaths["goldendict"])
#p::ToggleApp("PotPlayer64.exe", appPaths["potplayer"], "PotPlayer64")
#g::ToggleApp("SumatraPDF.exe", appPaths["sumatra"], "SUMATRA_PDF_FRAME")
#j::ToggleApp("qalculate.exe", appPaths["qalculate"])
#o::ToggleApp("AriaNg Native.exe", appPaths["ariaGui"])
#x::ToggleApp("Taskmgr.exe", "taskmgr.exe", , 2)
#k::ToggleApp("TdxW.exe", appPaths["tdxw"], "TdxW_MainFrame_Class")

#n::Run("python C:\Scripts\new-template-note.py")

#e::launchOrSwitchDownloads()
launchOrSwitchDownloads() {
    WinExist("ahk_class CabinetWClass") ? WinActivate : Run("explorer shell:::{374DE290-123F-4565-9164-39C4925E467B}")
}

; ---- 剪贴板处理 ----
#c:: {
    ClipSaved := ClipboardAll()
    A_Clipboard := Trim(A_Clipboard, "`n`r`b`t`s`v`a`f")
    SendInput("^v")
    Sleep(50)
    A_Clipboard := ClipSaved
    ClipSaved := ""
}
