;;;;;;;;;; HotKeys

; LCtrl LShift LAlt Win W
; <^    <+     <!   <#  w


<#z::
  ; winwait, ahk_exe notepad++.exe

  ; x = 1338
  ; y := 121
  ; MouseMove, 1338, 121
  ; MouseClick, left, 1338, 121, 1
  while GetKeyState("LWin", "P")
  {
    Send, {Shift Down}{End}{Delete}{Shift up}{Delete}
  }
  ; MsgBox,,,success,10!
return


<#w::
/*
    Close focused active window.
    (Can't Reopen)
 */

    WinGetTitle, Title, A
    PostMessage, 0x112, 0xF060,,, %Title%
return


<#<!e::
/*
    Open Double Commander (File Explorer)
*/

;  Run, doublecmd.exe, d:\OneDrive\[Collection]\[[Util]]\Portable\Double CMD\
  Run, doublecmd.exe, C:\Users\judic\OneDrive\[Collection]\[[Util]]\Portable\Double CMD\
return

<#t::
/*
    Open Notepad++
*/

  Run, Notepad++.exe, C:\Program Files (x86)\Notepad++\notepad++.exe

return

<#<!t::
/*
    Open VSCode Portable
*/

;  Run, Code.exe, d:\OneDrive\[Collection]\[[Util]]\Portable\VSCode Portable\
  Run, Code.exe, C:\Users\judic\OneDrive\[Collection]\[[Util]]\Portable\VSCode Portable\

return


; https://superuser.com/questions/33142/ctrlbackspace-inserts-a-small-box-instead-of-erasing/636973
#IfWinActive ahk_class CabinetWClass
/*
    Enable Ctrl+Backspace in File Explorer and Notepad
*/

<^Backspace::
    Send {Ctrl Down}{Shift Down}{Left}{Delete}{Shift Up}{Ctrl Up}
#IfWinActive






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
