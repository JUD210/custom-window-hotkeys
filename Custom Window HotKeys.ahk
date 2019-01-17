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


hid_windows_pointer := []


; Key: LShift+Win+W
<+<#w:: 
/* 
    Hide focused active window, and save it into hid_windows_pointer.
    
    === WARNING! ===
    It's just imitating close event!
    The Program is just gonna be HIDDEN, NOT CLOSED!

    If you want to CLOSE, use Wih+W

 */
    WinGetClass, class, A

    If class not in ahk_class WorkerW,Shell_TrayWnd,Button,DV2ControlHost,Progman ; excluded windows

        WinGetTitle, Title, A
        WinHide, %Title%
        hid_windows_pointer.Push(Title)

        SetTimer, AutoCloseHidWindow, 20000
return


; Key: Win+`
<#`:: 
; TODO:
/* 
    1. Show hid_windows_pointer list.
    2. Manage windows. (Delete, Restore, ...)
    3. Execute
 */
    msg := ""
    Loop % hid_windows_pointer.Length() {
        msg := msg "`n" A_Index " : " hid_windows_pointer[A_Index] 
    }

    MsgBox % "===== Hid Windows List =====`n" msg

return


; Key: LShift+Win+`
<+<#`::
/* 
    Reopen all of hid windows
 */ 
    SetTimer, AutoCloseHidWindow, Off

    msg := ""
    Loop % hid_windows_pointer.Length() {
        WinShow, % hid_windows_pointer[A_Index]
        WinActivate, % hid_windows_pointer[A_Index]

        msg := msg "`n" A_Index " : " hid_windows_pointer[A_Index] 
    }

    MsgBox % "===== Restored =====`n" msg

    hid_windows_pointer:=[]
return



;;;;;;;;;; Functions


; def
AutoCloseHidWindow:
/* 

 */
    If (hid_windows_pointer.length()=1) ; only one window left to hide. If it's 
        SetTimer, AutoCloseHidWindow, Off

    DetectHiddenWindows, On
    PostMessage, 0x112, 0xF060,,, % hid_windows_pointer.RemoveAt(1) ; hide first window in the hid_windows_pointer
return
