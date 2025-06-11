; Use global variable to control timer
global winTapTimerRunning := false

*LWin::
    ; If timer is already running → this is a double tap
    if (winTapTimerRunning) {
        SetTimer, RunPowerToysRun, Off
        winTapTimerRunning := false
        ; Trigger Start Menu
        Send {LWin}
    } else {
        ; First tap → start timer and wait
        winTapTimerRunning := true
        SetTimer, RunPowerToysRun, -300
    }
return

; Keep Windows + D functionality for minimizing windows
LWin & d::
    ; Cancel the single tap timer if it's running
    if (winTapTimerRunning) {
        SetTimer, RunPowerToysRun, Off
        winTapTimerRunning := false
    }
    ; Send the normal Windows + D command
    Send {LWin down}d{LWin up}
return

RunPowerToysRun:
    ; If this function runs, it's a single tap
    winTapTimerRunning := false
    
    ; Option 1: Use PowerToys Run's default hotkey (fastest)
    Send {Alt Down}{Space}{Alt Up}

return
