;=== Caption (WordPad) ===
;Based on 4*2 Line format, JejuGothic font, 10 size


LButton::   ;Next Caption
    ControlSend, RICHEDIT50W1, {down 2}, ahk_class WordPadClass
return

RButton::   ;Previous Caption
    ControlSend, RICHEDIT50W1, {up 9}{down 7}, ahk_class WordPadClass
return


;=== Script (NotePad) ===
;Based on 20 Line format, JejuGothic font, 12 size

Alt::    ;Next Script
    ControlSend, Edit1, {down 16}, ahk_class Notepad
return

Xbutton1::    ;Previous Script
    ControlSend, Edit1, {up 35}{down 19}, ahk_class Notepad
return


;=== Control this ahk file ===

MButton::    ;Suspend all the scripts in this ahk file.
    Suspend
return


ESC::    ;Exit this ahk file.
    ExitApp
return