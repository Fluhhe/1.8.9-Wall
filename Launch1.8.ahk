; Multi Instance Launching/Auto-Starting Script
; Author: Ravalle (Joe) / ported to 1.8.9 by Fluhhe

#NoEnv
#Include %A_ScriptDir%\settings.ahk

global obsReminder := false ; Set to false to remove the OBS auto start feature).
; To use the auto start, bind F7 to start streaming/recording/etc in OBS hotkeys. You can change the key pressed in this script if you want to.

; Path names are self explanatory - all should use backslashes, including one at the end.
; Minecraft Instance auto-launch depends on MultiMC (WILL NOT WORK WITH VANILLA LAUNCHER).
global multiMCLocation = "C:\Users\Matas\Desktop\MultiMC\"
global obsLocation = "C:\Program Files\obs-studio\bin\64bit\"
global calcLocation = "C:\Users\Matas\Desktop\contariacalcv1.1.7.jar"
global numInstances = 9
global nameFormat = "18_X" ; You can edit this to support your instance name formats (CASE SENSITIVE, beware)
global wallDelay = 7000 ; Increase if wall macro launches before all of the instances load into the main menu

; Don't configure this
global noObs := false

SetTitleMatchMode, RegEx

if (!WinExist("OBS.*")) {
  Run obs64.exe, %obsLocation%
  noObs = true
}

if (!WinExist("ContariaCalc.*")) {
  Run, %calcLocation%
}

Loop, %numInstances% {
  SetTitleMatchMode, 1
  mcTitle = Minecraft %version% - Instance %A_Index%
  if (WinExist(mcTitle)) { ; Checks for crashed instances
    NR_temp = 0 ; init
    WinGet, pid, PID, mcTitle ; retrieves the PID of an instance to check
    Responding := DllCall("SendMessageTimeout", "UInt", pid, "UInt", 0x0000, "Int", 0, "Int", 0, "UInt", 0x0002, "UInt", respondingDelay, "UInt *", NR_temp)
    if Responding = 0 { ; 1 = Responding, 0 = Not Responding
      Process, Close, PID
      Sleep, launchDelay
    }
  }
  if (!WinExist(mcTitle)) {
    inst := StrReplace(nameFormat, "X", A_Index)
    Run %multiMCLocation%MultiMC.exe -l %inst%
    Sleep, launchDelay 
  }
}

if (noObs and obsReminder) {
  MsgBox, 4096, , Press OK to start streaming/recording (presses F7)
  Send {Numpad1}
  Send {F7 down}
  Sleep, 50
  Send {F7 up}
}

Sleep, wallDelay
Run TheWall.ahk

