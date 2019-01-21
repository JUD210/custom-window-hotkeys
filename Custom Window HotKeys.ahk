;;;;;;;;;; HotKeys


; Key: Win+W
<#w::
/* 
    Close focused active window.
    (Can't Reopen)
 */

    WinGetTitle, Title, A
    PostMessage, 0x112, 0xF060,,, %Title%
return


hidden_windows_ptr := []


; Key: LShift+Win+W
<+<#w:: 
/* 
    Hide focused active window, and save it into hidden_windows_ptr.
    
    === WARNING! ===
    It's just imitating close event!
    The Program is just gonna be HIDDEN, NOT CLOSED!

    If you want to CLOSE, use Win+W

 */
    WinGetClass, class, A

    If class not in ahk_class WorkerW,Shell_TrayWnd,Button,DV2ControlHost,Progman ; excluded windows

        WinGetTitle, Title, A
        WinHide, %Title%
        hidden_windows_ptr.Push(Title)

        SetTimer, AutoCloseHiddenWindow, 20000
return


; ; Key: LCtrl+LShift+Win+W
; <^<+<#w::

; ; Key: LCtrl+LShift+LAlt+Win+W
; <^<+<!<#w::


; Key: Win+`
<#`:: 
/* 
    TODO:
    1. Show hidden_windows_ptr list.
    2. Manage windows. (Delete, Restore, ...)
    3. Execute
 */
    msg := ""
    Loop % hidden_windows_ptr.Length() {
        msg := msg "`n" A_Index " : " hidden_windows_ptr[A_Index] 
    }

    MsgBox % "===== Hid Windows List =====`n" msg

return


; Key: LShift+Win+`
<+<#`::
/* 
    Reopen all of hid windows
 */ 
    SetTimer, AutoCloseHiddenWindow, Off

    msg := ""
    Loop % hidden_windows_ptr.Length() {
        WinShow, % hidden_windows_ptr[A_Index]
        WinActivate, % hidden_windows_ptr[A_Index]

        msg := msg "`n" A_Index " : " hidden_windows_ptr[A_Index] 
    }

    MsgBox % "===== Restored =====`n" msg

    hidden_windows_ptr:=[]
return


; Key: LCtrl+LShift+Win+`
<^<+<#`::
/*
    TODO:
    1. CLOSE ALL Hidden Windows
    2. Empty 'hidden_windows_ptr'
 */

return


;;;;;;;;;; Functions


; def
AutoCloseHiddenWindow:
/* 

 */
    If (hidden_windows_ptr.length()=1) ; only one window left to hide. If it's 
        SetTimer, AutoCloseHiddenWindow, Off

    DetectHiddenWindows, On
    PostMessage, 0x112, 0xF060,,, % hidden_windows_ptr.RemoveAt(1) ; hide first window in the hidden_windows_ptr
return
