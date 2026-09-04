#Requires AutoHotkey v2.0

SetTitleMatchMode('RegEx')

/* Ctrl + Numpad0 : Beep and reload
^Numpad0:: {
    SoundBeep(440, 200)
    Reload
}
;*/

teams_exe     := "ms-teams.exe"
teams_exp     := "^(Conversation|Équipes et canaux|Activité|Contacts|Calendar).* \| Microsoft Teams$ ahk_exe" . teams_exe

; Ctrl + Left Alt + T : run Windows terminal (ignores AltGr + T)
^<!T:: {
    if not ProcessExist("WindowsTerminal.exe") {
        Run("wt.exe")
    }
    WinWait("ahk_exe WindowsTerminal.exe")
    WinActivate("ahk_exe WindowsTerminal.exe")
}

; Win + V : run CopyQ (Ctrl + Alt + Insert) instead of Windows clipboard manager
#V:: Send("^!{Insert}")

; Win + Shift + S : flameshot
#+S:: Run("flameshot-cli.exe gui", , "Hide")

; Win + C : Open teams
#C:: {
    ; this shortcut is for Work computer only
    if (A_ComputerName != "PS-0568") {
        return
    }
    ; if Teams is not running or not visible, run it, and wait for it
    if not ProcessExist(teams_exe) or not WinExist(teams_exp) {
        Run(teams_exe)
        WinWait(teams_exp)
    }

    ; Focus Teams window
    WinActivate(teams_exp)
    ; Maximize it
    WinMaximize(teams_exp)
}

; Alt + ² : Push to talk for Teams
!²:: {
    ; this shortcut is for Work computer only
    if (A_ComputerName != "PS-0568") {
        return
    }
    SoundBeep(600, 200)
    Send("#!{k}")
    KeyWait("²")
    SoundBeep(440, 200)
    Send("#!{k}")
}

; https://www.autohotkey.com/docs/v2/KeyList.htm#multimedia

; Search key : Everything
Browser_Search:: Run("C:\Program Files\Everything\Everything.exe")

; Ctrl+Alt+F1 / Calculator key : Qalculate
^!F1::
Launch_App2:: Run("qalculate-qt.exe")

; Ctrl+Alt+F2 / Media player key : Freetube
^!F2::
Launch_Media:: Run('pwsh.exe -Command "start_freetube"')

; For PL/SL Developer, send F13 when we press Shift+Escape
HotIfWinActive("ahk_exe plsqldev.exe")
Hotkey("+Escape", (_) => Send("{F13}"))

; For PIP (Firefox, Freetube, ...), press Shift+T to toggle always-on-top
toggle_always_on_top(x) {
    SoundBeep(440, 200)
    WinSetAlwaysOnTop -1
}
HotIfWinActive("Picture-in-Picture")
Hotkey("+T", toggle_always_on_top)
