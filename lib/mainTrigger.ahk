mainTrigger() {
	HKHoldTime := 475
	sTime := A_TickCount
	loop {
		Sleep, 20
		if ((A_TickCount - sTime) > HKHoldTime) 
			return MainTriggerHold()
		GetKeyState, keyVar, % settings.mainHotkey.mainHotkey, P
		IfEqual, keyVar, U, break
	}
	MainTriggerPressed()
}