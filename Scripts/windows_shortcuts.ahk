#Requires AutoHotkey v2.0

SetTitleMatchMode('RegEx')

; https://www.autohotkey.com/docs/v2/KeyList.htm#modifier
; https://www.autohotkey.com/docs/v2/KeyList.htm#multimedia

; Ctrl + Numpad0 : Beep and reload
;^Numpad0:: do_reload()

; Ctrl + Left Alt + T : run Windows terminal (ignores AltGr + T)
^<!T:: open_terminal()

; Win + V : run CopyQ (Ctrl + Alt + Insert) instead of Windows clipboard manager
#V:: Send("^!{Insert}")

; Win + Shift + S : flameshot
#+S:: Run("flameshot-cli.exe gui", , "Hide")

; Search key : Everything
Browser_Search:: Run("C:\Program Files\Everything\Everything.exe")

; Ctrl + Alt + F1 / Calculator key : Qalculate
^!F1::
Launch_App2:: Run("qalculate-qt.exe")

; Ctrl + Alt + F2 / Media player key : Freetube
^!F2::
Launch_Media:: Run('pwsh.exe -Command "start_freetube"')

; Win + C : Open teams (work only)
#HotIf A_ComputerName = "PS-0568"
#C:: open_teams()
#HotIf

; Alt + ² : Push to talk for Teams (work only)
#HotIf A_ComputerName = "PS-0568"
!²:: push_to_talk()
#HotIf

; For PL/SL Developer, send F13 when we press Shift+Escape (work only)
#HotIf A_ComputerName = "PS-0568" and WinActive("ahk_exe plsqldev.exe")
+Escape:: Send("{F13}")
#HotIf

; Shift + T : toggle always-on-top for PIP (Firefox, Freetube, ...)
#HotIf WinActive("Picture-in-Picture")
+T:: toggle_stay_on_top()
#HotIf

; Ctrl + Alt + I : toggle PIP in Firefox (needs QWERTY layout as secondary layout)
#HotIf WinActive("ahk_exe firefox.exe")
^!I:: toggle_PIP()
#HotIf

; Win + Numpad / Ctrl + Win + Numpad : MoveActiveWindow (see function documentation)
loop 9 {
    if A_Index != 5 { ; don't initialize for Numpad5
        Hotkey("#Numpad" . A_Index, MoveActiveWindow)
        Hotkey("^#Numpad" . A_Index, MoveActiveWindow)
    }
}

; ------------------------- Functions ------------------------- ;

teams_exe := "ms-teams.exe"
teams_exp := "^(Conversation|Équipes et canaux|Activité|Contacts|Calendar).* \| Microsoft Teams$ ahk_exe" . teams_exe

do_reload() {
    SoundBeep(440, 200)
    Reload
}

open_terminal() {
    if not ProcessExist("WindowsTerminal.exe") {
        Run("wt.exe")
    }
    WinWait("ahk_exe WindowsTerminal.exe")
    WinActivate("ahk_exe WindowsTerminal.exe")
}

open_teams() {
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

push_to_talk() {
    SoundBeep(600, 200)
    Send("#!{k}")
    KeyWait("²")
    SoundBeep(440, 200)
    Send("#!{k}")
}

toggle_stay_on_top() {
    SoundBeep(440, 200)
    WinSetAlwaysOnTop -1
}

toggle_PIP() {
    ; switch to QWERTY keyboard layout
    Send("#{Space}")
    Sleep(75)

    ; Send Ctrl + Shift + ] to toggle PIP
    Send("^+]")
    Sleep(75)

    ; switch back to AZERTY keyboard layout
    Send("#{Space}")
}

; Get active window monitor number. If not found, returns nothing
MonitorGetActive(win) {
    WinGetPos(&win_x, &win_y, &win_width, &win_height, win)

    center_X := win_x + win_width / 2
    center_Y := win_y + win_height / 2

    loop MonitorGetCount() {
        MonitorGet(A_Index, &mon_Left, &mon_Top, &mon_Right, &mon_Bottom)
        ; If the mouse is in monitor rectangle, it is in the monitor (-1 to count it in when on top left corner)
        if center_X >= mon_Left and center_X <= mon_Right
            and center_Y >= mon_Top and center_Y <= mon_Bottom {
            return A_Index
        }
    }
}

/*
Move the active window. If the window is maximized, does nothing.

Win + Numpad : to the side/corner of the screen
Ctrl + Win + Numpad : 1 pixel

Possible directions
  7 8 9
  4   6
  1 2 3
*/
MoveActiveWindow(shortcut) {
    win := WinExist("A")

    ; if the window is maximized, do nothing
    if WinGetMinMax() {
        return
    }

    mon_Active := MonitorGetActive(win)
    MonitorGetWorkArea(mon_Active, &mon_Left, &mon_Top, &mon_Right, &mon_Bottom)
    WinGetPos(&win_x, &win_y, &win_width, &win_height, win)

    new_x := win_x
    new_y := win_y

    if shortcut = "#Numpad1" or shortcut = "#Numpad4" or shortcut = "#Numpad7" {
        new_x := mon_Left
    } else if shortcut = "#Numpad3" or shortcut = "#Numpad6" or shortcut = "#Numpad9" {
        new_x := mon_Right - win_width
    } else if shortcut = "^#Numpad1" or shortcut = "^#Numpad4" or shortcut = "^#Numpad7" {
        new_x--
    } else if shortcut = "^#Numpad3" or shortcut = "^#Numpad6" or shortcut = "^#Numpad9" {
        new_x++
    }

    if shortcut = "#Numpad1" or shortcut = "#Numpad2" or shortcut = "#Numpad3" {
        new_y := mon_Bottom - win_height
    } else if shortcut = "#Numpad7" or shortcut = "#Numpad8" or shortcut = "#Numpad9" {
        new_y := mon_Top
    } else if shortcut = "^#Numpad1" or shortcut = "^#Numpad2" or shortcut = "^#Numpad3" {
        new_y++
    } else if shortcut = "^#Numpad7" or shortcut = "^#Numpad8" or shortcut = "^#Numpad9" {
        new_y--
    }

    WinMove(new_x, new_y, win_width, win_height, win)
}
