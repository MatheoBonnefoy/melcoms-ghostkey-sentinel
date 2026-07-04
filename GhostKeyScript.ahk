#Requires AutoHotkey v2.0
#SingleInstance force

;________|  TYPING SPEED LIMIT  |_______________________________| MODIFY |
; You can test in a range from 20ms to 1000ms
; First set it high to see if the keys really are affected
; then find the right spot suited for your need

;           /!\ You need to install AutoHotKey V2.0 First /!\
;To Execute (Run) the Script you just double click it (GhostKeyScript.ahk) 

;_______|  Delay  |____↓↓↓↓↓________________ Edit, Save and Run ↺
global DebounceTime := "100" ; (time is in milliseconds)

;________/  CORE LOGIC  \________________________________/ DO NOT MODIFY \
Debounce(KeyName, *) {
    static LastKey := ""
    static LastKeyTime := 0

    Caps := GetKeyState("CapsLock", "T")

    if (KeyName == LastKey && A_TickCount - LastKeyTime < DebounceTime)
        return
    LastKey := KeyName
    LastKeyTime := A_TickCount

    if Caps {
        Send("{Blind}{" KeyName "}")
        return
    }
    Send("{Blind}{" KeyName "}")
}

;________|  HOTKEYS ASSIGNEMENT  |________________________________| MODIFY |
KeyArray := [
; -> Check the AHK syntax for each key just below ↓ 
; if you're missing some keys ask any Ai Chat bot to get a quicker answer

;↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓____|   Keys To Handle   |____↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        "+1", "1", "&", "t", "e", "n"


; Separate each key with commas e.g. "yourkey", "yoursecondkey", 
; But do not put a comma at the very end of the chain 

]

;↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓____/  AutoHotKey (.ahk) Key Syntax  \____↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

;__/ Combination \_______/ AHK Syntax \_________________________________/!\
;   Shit + H         :  "+h"            //Includes both sides
;   LeftShift + H    :  "<+h"           //Only Left Shift
;   LeftShift + H    :  ">+h"           //Only Right Shift
;   Alt + H          :  "!h"            //Only Left Alt
;   AltGr + H        :  ">!h"           //Only Right Alt


; >> Caps is handled automatically for each key added, But  >>
; >> shift is not considered being the same key as CapsLock <<

;____/  Alphanumeric keys  \_______________________________________________
; "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
; "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
; "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",

;____/ Alphanumeric keys German \__________________________________________
; "ö", "ä", "ü",

;____/ Alphanumeric keys French \__________________________________________
; "&", "é", "è", "ç", "à", "=",

;____/ Common functional keys \____________________________________________
; "Space", "Enter", "Backspace", "Delete",

;____/ Punctuation \_______________________________________________________
; ".", ",", "-", "_", "+", "*", "#", "'",

;____/ Example of other keys \_____________________________________________
; "LControl", "RControl", "LShift", "RShift", "Up", "Down", "Left", "Right"

;##########################################################################



;_______/  END OF CORE LOGIC  \___________________________/ DO NOT MODIFY \
for key in KeyArray
{
    Hotkey "*" . key, Debounce.Bind(key)
}

