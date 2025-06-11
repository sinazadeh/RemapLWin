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

RunPowerToysRun:
    ; If this function runs, it's a single tap
    winTapTimerRunning := false
    Send {Alt Down}{Space}{Alt Up}
return
