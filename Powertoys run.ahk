; Adjust this threshold (in ms) to taste:
threshold := 300

; Stores the time of the last Left-Win press
global lastWinPress := 0

*LWin::
    current := A_TickCount
    if (current - lastWinPress < threshold) {
        ; Double-tap detected → cancel single-tap timer and open Start Menu
        SetTimer, SingleTapAction, Off
        lastWinPress := 0
        Send {LWin}
    } else {
        ; First tap → schedule single-tap action
        lastWinPress := current
        SetTimer, SingleTapAction, -%threshold%
    }
return

; Keep Win+D intact
LWin & d::
    ; Cancel the scheduled single-tap action
    SetTimer, SingleTapAction, Off
    lastWinPress := 0
    Send #d
return

SingleTapAction:
    ; Timer fired → it was a single tap
    lastWinPress := 0
    Send !{Space}  ; PowerToys Run
return
