;;;;;;;;;; Quick Find00000000000
/*
; Keys in AutoHotKey
LCtrl LShift LAlt Win  Vk19  SC1F1
<^    <+     <!   <#   한자  한자

; My Custom Settings
F13 (G604 Mouse) -
F14 (G604 Mouse) -
F15 (G604 Mouse) -

F16 (G604 Mouse) -
F17 (G604 Mouse) -
F18 (G604 Mouse) -

F19 (G604 Mouse) - AutoHotKey Related
F20 (G604 Mouse) -


; WARNING about Limitation
ALL KEYMAPS WERE MAPPED BASED ON 'MicroSoft Ergonomic Keyboard' LAYOUT

LCtrl Win LAlt 한자     Space     한/영 RAlt Context RCtrl
 */



;;;;;;;;;; Global Vars and Funcs
terminal := "ahk_exe WindowsTerminal.exe"
ide := "ahk_exe pycharm64.exe"

prev_win_pid := ""
active_win_pid := ""
set_prev_win_pid() {
	WinGet, prev_win_pid, PID, A
}
set_active_win_pid() {
	WinGet, active_win_pid, PID, A
}



;;;;;;;;;; Custom KeyMaps
CapsLock::LCtrl

<^>^Left::		Send, {Ctrl Up}{Home}
<^>^Right::		Send, {Ctrl Up}{End}
<^>^Up::		Send, {Ctrl Up}{PgUp}
<^>^Down::		Send, {Ctrl Up}{PgDn}
<^+>^Left::		Send, {Ctrl Up}{Shift Down}{Home}{Shift Up}
<^+>^Right::	Send, {Ctrl Up}{Shift Down}{End}{Shift Up}
<^+>^Up::		Send, {Ctrl Up}{Shift Down}{PgUp}{Shift Up}
<^+>^Down::		Send, {Ctrl Up}{Shift Down}{PgDn}{Shift Up}

sc1F1::Space  ; sc1F1: 한자키 (Up event 없음 = Modifier키로 remap 불가능)
sc121::AppsKey  ; SC121: 'Calculator' Key on MicroSoft Ergonomic Keyboard

AppsKey::RAlt
>!Left::		Send, {Alt Up}{Home}
>!Right::		Send, {Alt Up}{End}
>!Up::			Send, {Alt Up}{PgUp}
>!Down::		Send, {Alt Up}{PgDn}
+>!Left::		Send, {Alt Up}{Shift Down}{Home}{Shift Up}
+>!Right::		Send, {Alt Up}{Shift Down}{End}{Shift Up}
+>!Up::			Send, {Alt Up}{Shift Down}{PgUp}{Shift Up}
+>!Down::		Send, {Alt Up}{Shift Down}{PgDn}{Shift Up}

>!sc1F2::CapsLock  ; sc1F2: 한영키 (Up event 없음 = Modifier키로 remap 불가능)
<#w::			Send, {Win Up}{Alt Down}{F4}{Alt Up}

<+Backspace::	Send, {Shift Up}{Backspace Up}{Del}
<^<+Backspace::	Send, {Shift Up}{Backspace Up}{Ctrl Down}{Del}{Ctrl Up}
; <^<+<!Backspace:: 'Ctrl+Alt+Del' can't be used!
; Use 'CamelHumps' feature with 'Ctrl+Shift+Alt+BackSpace' on IDE


; a & b::c  ;Custom Combination (Custom Modifier): When holding 'a', If you push 'b', Type 'c' )



;;;;;;;;;; Custom snippets
:*:``dt1::  ; This hotstring replaces "`dt1" with the current date and time via the commands below.
	FormatTime, CurrentDateTime,, yyyy/MM/dd hh:mm:ss
	SendInput %CurrentDateTime%
return
:*:``dt2::
	FormatTime, CurrentDateTime,, yyyy/MM/dd
	SendInput %CurrentDateTime%
return

:*:``lh::127.0.0.1:8000/

:*:``j@g::judicious210@gmail.com
:*:``h@g::hyeogikarp@gmail.com



;;;;;;;;;; Run
<#t::  ; Open Notepad++
	if not WinExist("ahk_exe notepad++.exe") {
		Run, Notepad++.exe, C:\Program Files (x86)\Notepad++\notepad++.exe
	} else if WinActive("ahk_exe notepad++.exe") {
		WinMinimize
	} else {
		WinActivate
	}
return



;;;;;;;;;; AutoHotKey Related
F19::  ; Reload AutoHotKey script
	Msgbox, 0, F19, [Success] Reloaded AutoHotKey script, 0.5
	Reload
return

<^F19::  ; KeyHistory
	if not WinExist("ahk_exe AutoHotkey.exe") {
		KeyHistory
	} else {
		WinActivate, ahk_exe AutoHotkey.exe
		Send, <!{F4}
	}
return

<^<+F19::  ; WindowSpy
	if not WinExist("Window Spy") {
		Run, C:\Program Files\AutoHotkey\WindowSpy.ahk
	} else if WinExist("Window Spy") {
		WinClose
	}
return

<!F19::Suspend
<!<+F19::Pause



;;;;;;;;;; Dev Env (IDE)
<#`::  ; Focus external terminal for IDE
	if WinExist("ahk_exe WindowsTerminal.exe") {
		if WinActive("ahk_exe WindowsTerminal.exe") {
			WinActivate, %ide%
		} else {
			WinActivate, %terminal%
		}
	}
	else {
		if WinExist("ahk_exe pycharm64.exe") {
			WinActivate, %ide%
		}
		Send, `#{``}
	}
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GAVE UP mapping 한자 key as a LCtrl key
;
; #InstallKeybdHook
; SendSuppressedKeyUp(key) {
;     DllCall("keybd_event"
;         , "char", GetKeyVK(key)
;         , "char", GetKeySC(key)
;         , "uint", KEYEVENTF_KEYUP := 0x2
;         , "uptr", KEY_BLOCK_THIS := 0xFFC3D450)
; }

; ; ; Test hotkey:
; ; !SC1F1::MsgBox % A_ThisHotkey

; ; Remap SC1F1 to LCtrl in a way compatible with IME.


; /*
; tttttttt
; ttttttttttttttttttttttttttttt
; tt
; aaaaaaaaaaa
; aaaaaaaaaaaaaaaaaaaaaaaaa
; aaaaaaaaaaa
;  */
; Vk19::
; 	MsgBox, 0, ,prevTime, 0.3
; 	global prevTime := A_TickCount
; 	Loop
; 	{
; 		TimeInterval := A_TickCount - prevTime
; 		if (Timeinterval >= 1000)
; 		{
; 			send a
; 			break
; 		}
; 	}
; return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





; SC1F1::
; 	global
; 	Loop
; 	{
; 		send t
; 		state := "D"
; 		if (state = "D")
; 		{
; 			send a
; 			continue
; 		}
; 		if (state = "U")
; 		{
; 			MsgBox "up"
; 			break
; 		}
; 				GetKeyState, state, Shift

; 	}
; 	; if (state = "D")
; 	; 	MsgBox At least one Shift key is down.
; 	; else
; 	; 	MsgBox Neither Shift key is down.
; 	; if GetKeyState("")
;     ; Send {Blind}{LCtrl DownR}
; 	; Send {LCtrl down}
;     ; SendSuppressedKeyUp("LCtrl")
; return



; SC1F1::
; 	Send {LCtrl down}
; 	SendSuppressedKeyUp("LCtrl")
; 	return

; SC1F1::LCtrl
; SC1F1::
; Send, {RControl down}
; while(not GetKeyState(KeyName [, "P" or "T"]))
; {
; 	Send, a
; }
; Send, {RControl up}

; return

; <#w::
; /*
;     Close focused active window.
;     (Can't Reopen)
;  */

;     WinGetTitle, Title, A
;     PostMessage, 0x112, 0xF060,,, %Title%
; return


; <#<!e::
; /*
;     Open Double Commander (File Explorer)
; */

																	;   Run, doublecmd.exe, d:\OneDrive\[Collection]\[[Util]]\Portable\Double Commander\
; ;  Run, doublecmd.exe, C:\Users\judic\OneDrive\[Collection]\[[Util]]\Portable\Double Commander\
; return



; CapsLock::LCtrl


; >+capslock::
;     SetCapsLockState, % (State:=!State) ? "On" : "Off"
; return


; capslock::
;
; KeyWait,capslock
; if A_TimeSinceThisHotkey >= 200 ; in milliseconds.
; SetCapsLockState, % (State:=!State) ? "On" : "Off"
; else
; Send, {vk15sc1F2}
; return


; Key: LWin + Tab
; ;   -> Win + Ctrl + Shift + Alt + Tab
; <#Tab::
; /*
;     Disable default Win+Tab shortcut to apply a shortcut in 7+ Taskbar Tweaker
;  */

; Send {LWin Down}{Ctrl Down}{Shift Down}{Alt Down}{Tab}{Alt Up}{Shift Up}{Ctrl Up}{LWin Up}
; return



;;;;;;;;;; Useless and Unstable Features
; hidden_windows_ptr := []
;
;
; ; Key: LShift+Win+W
; <+<#w::
; /*
;     Hide focused active window, and save it into hidden_windows_ptr.
;
;     === WARNING! ===
;     It's just imitating close event!
;     The Program is just gonna be HIDDEN, NOT CLOSED!
;
;     If you want to CLOSE, use Win+W
;
;  */
;     WinGetClass, class, A
;
;     If class not in ahk_class WorkerW,Shell_TrayWnd,Button,DV2ControlHost,Progman ; excluded windows
;
;         WinGetTitle, Title, A
;         WinHide, %Title%
;         hidden_windows_ptr.Push(Title)
;
;         SetTimer, AutoCloseHiddenWindow, 20000
; return
;
;
; ; ; Key: LCtrl+LShift+Win+W
; ; <^<+<#w::
;
; ; ; Key: LCtrl+LShift+LAlt+Win+W
; ; <^<+<!<#w::
;
;
; ; Key: Win+`
; <#`::
; /*
;     On progress...
;     1. Show hidden_windows_ptr list.
;     2. Manage windows. (Delete, Restore, ...)
;     3. Execute
;  */
;     msg := ""
;     Loop % hidden_windows_ptr.Length() {
;         msg := msg "`n" A_Index " : " hidden_windows_ptr[A_Index]
;     }
;
;     MsgBox % "===== Hid Windows List =====`n" msg
;
; return
;
;
; ; Key: LShift+Win+`
; <+<#`::
; /*
;     Reopen all of hid windows
;  */
;     SetTimer, AutoCloseHiddenWindow, Off
;
;     msg := ""
;     Loop % hidden_windows_ptr.Length() {
;         WinShow, % hidden_windows_ptr[A_Index]
;         WinActivate, % hidden_windows_ptr[A_Index]
;
;         msg := msg "`n" A_Index " : " hidden_windows_ptr[A_Index]
;     }
;
;     MsgBox % "===== Restored =====`n" msg
;
;     hidden_windows_ptr:=[]
; return
;
;
; ; Key: LCtrl+LShift+Win+`
; <^<+<#`::
; /*
;     On progress...
;     1. CLOSE ALL Hidden Windows
;     2. Empty 'hidden_windows_ptr'
;  */
;
; return
;
;
; ;;;;;;;;;; Functions
;
;
; ; def
; AutoCloseHiddenWindow:
; /*
;
;  */
;     If (hidden_windows_ptr.length()=1) ; only one window left to hide. If it's
;         SetTimer, AutoCloseHiddenWindow, Off
;
;     DetectHiddenWindows, On
;     PostMessage, 0x112, 0xF060,,, % hidden_windows_ptr.RemoveAt(1) ; hide first window in the hidden_windows_ptr
; return
;
