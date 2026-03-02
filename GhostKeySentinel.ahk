#Requires AutoHotkey v2.0
#SingleInstance force

;__________ TYPING SPEED LIMIT __ MODIFY _______________________________

; You can test in a range from 20ms to 1000ms
; First set it high to see if the keys really are affected
; then find the right spot

; Edit, Save and Run

global DebounceTime := "100" ; time in milliseconds

;__________ CORE LOGIC __ DO NOT MODIFY ________________________________

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

;__________ HOTKEYS ASSIGNEMENT __ MODIFY ______________________________
KeyArray := [

; -> Check the AHK syntax for each key just below if missing ask ChatGPT
; -> Separate each key/combination by commas
;       "youKey", "yourKey", "yourKey", so on and so forth

;   List of keys to constrain :
        "+1", "1", "&"

]
;__________ AHK Syntax _________________________________________________
; Here is a quick list of all the keys you might want to add to make
; sure you write them correctly so you don't waste time

;___ Combination ________ AHK Syntax ___________________________________
;   Shit + C         |  "+c"
;   LeftShift + C    |  "<+c"      
;   LeftShift + C    |  ">+c"
;   Alt + C          |  "!c"
;   AltGr + C        |  ">!c"
;____________________|__________________________________________________

; Caps is handled automatically for each key added

;___ Alphanumeric keys _________________________________________________
; "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
; "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
; "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",

;___ Alphanumeric keys German __________________________________________
; "ö", "ä", "ü",

;___ Alphanumeric keys French __________________________________________
; "&", "é", "è", "ç", "à", "=",

;___ Common functional keys ____________________________________________
; "Space", "Enter", "Backspace", "Delete",

;___ Punctuation _______________________________________________________
; ".", ",", "-", "_", "+", "*", "#", "'",

;___ Example of other keys _____________________________________________
; "LControl", "RControl", "LShift", "RShift", "Up", "Down", "Left", "Right"

;_______________________________________________________________________




;__________ END OF CORE LOGIC __ DO NOT MODIFY _________________________
for key in KeyArray
{
    Hotkey "*" . key, Debounce.Bind(key)
}
