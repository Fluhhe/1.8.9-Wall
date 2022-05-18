; v0.3.6
; General settings
global rows := 3 ; Number of row on the wall scene
global cols := 3 ; Number of columns on the wall scene
global performanceMethod := "N" ; F = Instance Freezing, N = Nothing (Changing Render doesn't really make sense for this version)
global affinity := True ; A funky performance addition, enable for minor performance boost

; Extra features
global fullscreen := False 
global disableTTS := False
global wideResets := True ; Make windows wide on reset to maximize visibility
global resetSounds := False ; Make a sound when you reset an instance 
global lockSounds := True ; Make a sound when you lock an instance
global countAttempts := True ; Makes a text file to count resets
global coop := False ; Automatically opens to LAN when you load in a world
global useObsWebsocket := False ; Allows for > 9 instances (Additional setup required)
global useSingleSceneOBS := False ; Allows for simple OBS setup & Tinder. Requires furture setup video
global audioGui := False ; A simple GUI so the OBS application audio plugin can capture sounds
global wallBypass := False ; If you have at least one locked instance, it will skip the wall and go to it
global multiMode := False ; Never send you back to the wall unless there are no playable instances

global renderDistance := 10

; Delays
global resumeDelay := 50 ; increase if instance isnt resetting (or have to press reset twice)
global maxLoops := 50 ; increase if instance isnt resetting (or have to press reset twice)
global beforeFreezeDelay := 200 ; should be fine, increase if it doesn't pause
global beforePauseDelay := 500 ; increase if worlds don't load in time (good seeds usually load fast though)
global fullScreenDelay := 270 ; increse if fullscreening issues
global restartDelay := 1000 ; increase if saying missing instanceNumber in .minecraft (and you ran setup)
global scriptBootDelay := 6000 ; increase if instance freezes before world gen
global obsDelay := 100 ; increase if not changing scenes in obs
global lowBitmaskMultiplier := 0.75 ; for affinity, find a happy medium, max=1.0
global tinderCheckBuffer := 5 ; When all instances cant reset, how often it checks for an instance in seconds

; Added Options
global version := "1.8.9" ; not tested in other versions, no guarantees
global guiDelay := 200 ; increase if settings changes are inconsistent
global preSettingsDelay := 200 ; increase if settings aren't changing
global postSettingsDelay := 1500 ; increase if not resetting after settings change
global changedKeyBinds := 4 ; how many "reset" buttons are there in the control menu
global borderless := True 
global setup := True ; sets RD, caps FPS and launches the first world on running the macro
global FPScap := 255 ; set to a multiple of 5 to cap your FPScap (260 = 'Unlimited')
global launchDelay = 1000 ; Adjust based on how quickly instances launch on your PC (minimum 1000 recommended)
global respondingDelay = 100 ; milliseconds to wait before deciding it is not responding