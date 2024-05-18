; ---- This is 100% autohotkey v2 script with the help of ChatGPT

; ---- auto-reload the script ---- v2

SetTimer(UPDATEDSCRIPT, 1000)

UPDATEDSCRIPT() {
    attribs := FileGetAttrib(A_ScriptFullPath)
    if (InStr(attribs, "A")) {
        FileSetAttrib("-A", A_ScriptFullPath)
        Reload()
    }
}
; --------------------    Real-time Editing   ---------------------------------

#y::EditCurrentScript()

EditCurrentScript() {
    wtpath := "wt"
    powershellpath := "powershell"
    nvimPath := "nvim"
    ; Run(wtpath " " powershellpath " " nvimPath " " A_ScriptFullPath)
    Run(nvimPath " " A_ScriptFullPath)
}

; ----------------------------------------------------------------------------

#q::Send("!{F4}")
#w::Send("^w")
#i::Run("ms-settings:bluetooth")
; empty recycle bin
^+d:: FileRecycleEmpty ; 清空回收站
<#z::Send("{Volume_mute}") ; with gui prompt

#h::MinimizeActiveWindow()

#m::MinimizeActiveWindow() ; A more elegant way to minimize window

MinimizeActiveWindow() {
    if WinActive("ahk_class WorkerW") { 
        WinActivate("ahk_class Shell_TrayWnd")
    } else {
        WinMinimize("A")
    } ; "A" stands for the active window
}



#f::ToggleWindowSize()

ToggleWindowSize() {
    ;size := WinGetMinMax("A")
    ;MsgBox(size)
    if (WinGetMinMax("A")=0) {
        WinMaximize("A")
    } else {
        WinRestore("A")
    }
}


; ----------------------------------------------------------------------------

#Enter::ToggleWindowsTerminal()

ToggleWindowsTerminal() {
    if WinExist("ahk_exe WindowsTerminal.exe") {
        WinActivate
        ;WinMaximize
        ;ToggleWindowSize()
    } else {
        Run("wt")
        WinWait("Administrator: PowerShell")
        ;WinActivate
        ;WinMaximize
    }
}


/*
#b::ToggleThorium()

ToggleThorium() {
    ; Define the path to thorium using the A_UserName variable
    thoriumPath := "C:\Users\" A_UserName "\scoop\apps\thorium\current\BIN\thorium.exe"

    if WinExist("ahk_exe thorium.exe") {
        WinActivate
    } else {
        Run(thoriumPath)
    }
}
*/

#b::ToggleEdge()

ToggleEdge() {
    ; Define the path to thorium using the A_UserName variable
    edgePath := "C:\Users\" A_UserName "\scoop\apps\edge\current\msedge.exe"

    if WinExist("ahk_exe msedge.exe") {
        WinActivate
    } else {
        Run('msedge')
        ; Run(edgePath)
    }
}


/*
#o::ToggleFireFoxAria2()

ToggleFireFoxAria2() {
    ; Define the path to Firefox using the A_UserName variable
    firefoxPath := "C:\Users\" A_UserName "\scoop\apps\firefox-nightly\current\firefox.exe"
    aria2ManPath := "moz-extension://d1b0427c-3c20-44fd-a490-cc12ffd7a04f/ui/ariang/index.html#!/downloading"

    Run(firefoxPath " " aria2ManPath)
}
*/

#o::ToggleAriaGui()

ToggleAriaGui(){
    ariaGuiPath := "C:\Users\" A_UserName "\scoop\apps\ariang-native\current\AriaNg Native.exe"

    if WinExist("ahk_exe AriaNg Native.exe") {
        WinActivate
    } else {
        Run(ariaGuiPath)
    }
}

/*
#o::TogglethoriumAria2()

TogglethoriumAria2() {
    ; Define the path to thorium using the A_UserName variable
    thoriumPath := "C:\Users\" A_UserName "\scoop\apps\thorium\current\BIN\thorium.exe"
    aria2ManPath := "chrome-extension://mpkodccbngfoacfalldjimigbofkhgjn/ui/ariang/index.html#!/downloading"

    Run(thoriumPath " " aria2ManPath)
}
*/

/*
ToggleNeatDM(){
    neatDMPath := "C:\Users\" A_UserName "\scoop\apps\neatdownloadmanager\current\NeatDM.exe"
    if WinExist("ahk_exe NeatDM.exe") {
            WinActivate
    } else {
        Run(neatDMPath)
    }

*/

#n::EditTodayNotes()

EditTodayNotes() {
    wtpath := "wt"
    powershellpath := "powershell"
    nvimPath := "nvim"
    ; Format the date as "YYYY-MM-DD"
    today := A_YYYY "-" A_MM "-" A_DD
    ; Construct the full path with the dynamic date in the filename
    todaynotesPath := "C:\Users\" A_UserName "\Downloads\Quicknotes\Raw\" today "_quicknotes.md"
    ; Run nvim with the file path
    ; Run(wtpath " " powershellpath " " nvimPath " " todaynotesPath)
    Run(nvimPath " " todaynotesPath)
}


#p::TogglePotplayer()

TogglePotplayer() {
    potplayerPath := "C:\Users\" A_UserName "\scoop\apps\potplayer\current\PotPlayer64.exe"
    if WinExist("ahk_exe PotPlayer64.exe") {
        WinActivate
        WinMaximize
    } else {
        Run(potplayerPath)
        WinWait("PotPlayer", ,5) ;Wait max 5s for potplayer to show up
        WinMaximize
    }
}


#g::ToggleSumatrapdf()

ToggleSumatrapdf() {
    sumatrapdfPath := "C:\Users\" A_UserName "\scoop\apps\sumatrapdf\current\sumatrapdf.exe"
    if WinExist("ahk_exe SumatraPDF.exe") {
        WinActivate("ahk_class SUMATRA_PDF_FRAME", "", "bottom")
    } else {
        Run(sumatrapdfPath)
    }
}

/*
#g::ToggleCalibre()

ToggleCalibre() {
    calibrePath := "C:\Users\" A_UserName "\scoop\apps\calibre\current\calibre-portable.exe"
    if WinExist("ahk_exe calibre.exe") {
        WinActivate("ahk_class Qt653QWindowIcon", "", "bottom")
    } else {
        Run(calibrePath)
    }
}
*/


/*
#t::ToggleFoobar2K()

ToggleFoobar2K() {
    ; Define the path to foobar2000 using the A_UserName variable
    foobar2000Path := "C:\Users\" A_UserName "\scoop\apps\foobar2000\current\foobar2000.exe"

    if WinExist("ahk_exe foobar2000.exe") {
        WinActivate
    } else {
        Run(foobar2000Path)
    }
}
*/

#t::ToggleSpotify()

ToggleSpotify() {
    ; Define the path to spotify using the A_UserName variable
    spotifyPath := "C:\Users\" A_UserName "\scoop\apps\spotify\current\spotify.exe"

    if WinExist("ahk_exe spotify.exe") {
        WinActivate
    } else {
        Run(spotifyPath)
    }
}

#s::ToggleEverything()

ToggleEverything() {
    ; Define the path to everything using the A_UserName variable
    everythingPath := "C:\Users\" A_UserName "\scoop\apps\everything-alpha\current\Everything.exe"

    if WinExist("ahk_exe everything.exe") {
        WinActivate
    } else {
        Run(everythingPath)
    }
}

#j::ToggleQalculate()

ToggleQalculate() {
    ; Define the path to qalculate using the A_UserName variable
    qalculatePath := "C:\Users\" A_UserName "\scoop\apps\Qalculate\current\qalculate-gtk.exe"

    if WinExist("ahk_exe qalculate.exe") {
        WinActivate
    } else {
        Run(qalculatePath)
    }
}

; using python + pandas instead

; 启动或切换到招商证券
#k::launchOrSwitchTdxW()
launchOrSwitchTdxW(){
    TdxWPath := "C:\Program Files (x86)\zd_zsone\TdxW.exe"
    if WinExist("ahk_class TdxW_MainFrame_Class") {
        WinActivate("ahk_class TdxW_MainFrame_Class", "", "bottom")
    } else {
        Sleep 1000
        Run(TdxWPath)
    }
}


; 启动或切换到下载目录
; win+e
#e::launchOrSwitchDownloads()

; Start or switch to Downloads directory
launchOrSwitchDownloads() {
    /*
    Run("explorer shell:::{374DE290-123F-4565-9164-39C4925E467B}")
    WinWait("Downloads")
    WinActivate
    WinMaxiMize
    */
    if WinExist("ahk_class CabinetWClass") {
            WinActivate("ahk_class CabinetWClass")
        } else {
            Run("explorer shell:::{374DE290-123F-4565-9164-39C4925E467B}")
            WinWait("Downloads")
            WinActivate
            WinMaxiMize
        }
}


; Toggle Task Manager with Win+X
#x::toggleTaskMan()

; Function to launch or switch to Task Manager
toggleTaskMan() {
    if WinExist("ahk_exe Taskmgr.exe") {
        ; WinActivate("ahk_exe Taskmgr.exe")
        ;WinWait("TaskManager", ,2)
        WinActivate
        WinMaximize
    } else {
        Run("taskmgr.exe")
        WinWait("Task Manager", ,2)
        WinMaximize
    }
}


