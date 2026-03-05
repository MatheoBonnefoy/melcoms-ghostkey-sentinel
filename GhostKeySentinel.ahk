#Requires AutoHotkey v2.0
#SingleInstance force

;________/  TYPING SPEED LIMIT  \___________/ MODIFY \___________________
; You can test in a range from 20ms to 1000ms
; First set it high to see if the keys really are affected
; then find the right spot

; Edit, Save and Run :   ↓
global DebounceTime := "100" ; time in milliseconds

;________/  CORE LOGIC  \___________/ DO NOT MODIFY \____________________
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
;________/  HOTKEYS ASSIGNEMENT  \___________/ MODIFY \___________________
KeyArray := [
; -> Check the AHK syntax for each key just below ↓ if missing ask ChatGPT
; -> Separate each key/combination by commas
;       "youKey", "yourKey", "yourKey" 


;_________ List of keys to constrain _____________________________________
        "+1", "1", "&"



]
;__________________/  AHK Syntax  \_______________________________________
; Here is a quick list of all the keys you might want to add to make
; sure you write them correctly so you don't waste time

;__/ Combination \_______/ AHK Syntax \___________________________________
;   Shit + C         :  "+c"
;   LeftShift + C    :  "<+c"      
;   LeftShift + C    :  ">+c"
;   Alt + C          :  "!c"
;   AltGr + C        :  ">!c"
;_________________________________________________________________________

; > Caps is handled automatically for each key added <

;___/  Alphanumeric keys  \_______________________________________________
; "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
; "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
; "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",

;___/ Alphanumeric keys German \__________________________________________
; "ö", "ä", "ü",

;___/ Alphanumeric keys French \__________________________________________
; "&", "é", "è", "ç", "à", "=",

;___/ Common functional keys \____________________________________________
; "Space", "Enter", "Backspace", "Delete",

;___/ Punctuation \_______________________________________________________
; ".", ",", "-", "_", "+", "*", "#", "'",

;___/ Example of other keys \_____________________________________________
; "LControl", "RControl", "LShift", "RShift", "Up", "Down", "Left", "Right"

;>-  --  --  --  --  --  --  --  --  -  --  --  --  --  --  --  --  --  -<



;________/  END OF CORE LOGIC  \___________/ DO NOT MODIFY \______________
for key in KeyArray
{
    Hotkey "*" . key, Debounce.Bind(key)
}

