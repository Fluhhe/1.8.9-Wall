#NoEnv
SetKeyDelay, 0
; v0.3.6

PixelColorSimple(pc_x, pc_y, pc_wID) {
  if pc_wID {
    pc_hDC := DllCall("GetDC", "UInt", pc_wID)
    pc_fmtI := A_FormatInteger
    SetFormat, IntegerFast, Hex
    pc_c := DllCall("GetPixel", "UInt", pc_hDC, "Int", pc_x, "Int", pc_y, "UInt")
    pc_c := pc_c >> 16 & 0xff | pc_c & 0xff00 | (pc_c & 0xff) << 16
    pc_c .= ""
    SetFormat, IntegerFast, %pc_fmtI%
    DllCall("ReleaseDC", "UInt", pc_wID, "UInt", pc_hDC)
    return pc_c
  }
}

getHwndForPid(pid) {
  pidStr := "ahk_pid " . pid
  WinGet, hWnd, ID, %pidStr%
  return hWnd
}

if (%7%)
  SoundPlay, A_ScriptDir\..\sounds\reset.wav
  
ControlSend, ahk_parent, {Blind}{Tab}{Enter}, ahk_pid %1%

while (True) {
  p := PixelColorSimple(0, 0, getHwndForPid(A_Args[1]))
  if(p == 0x2E2117) {
    break
  }
}
while (True) {
  p := PixelColorSimple(0, 0, getHwndForPid(A_Args[1]))
  if (p != 0x2E2117) {
    break
  }
}
sleep, 500
while (True) {
  p := PixelColorSimple(0, 0, getHwndForPid(A_Args[1]))
  if (p != 0x2E2117) {
    break
  }
}

while (True) {
  numLines := 0
  Loop, Read, %2%
  {
    numLines += 1
  }
  saved := False
  Loop, Read, %2%
  {
    if ((numLines - A_Index) < 5)
    {
      if (InStr(A_LoopReadLine, "Loaded 0") || (InStr(A_LoopReadLine, "Saving chunks for level 'ServerLevel") && InStr(A_LoopReadLine, "minecraft:the_end"))) {
        saved := True
        break
      }
    }
  }
  if (saved || A_Index > %3%)
    break
}
sleep, %6%
ControlSend, ahk_parent, {Blind}{Esc}, ahk_pid %1%
sleep, 50
ControlSend, ahk_parent, {Blind}{1}, ahk_pid %1%
sleep, %4%
FileAppend,, %5%
ExitApp
