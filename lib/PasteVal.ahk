PasteVal(sendTxt) {
	WinGetClass, wClass, A
	BLBU := A_BatchLines, KDBU := A_KeyDelay, CBBU := Clipboard
	Clipboard := ""
	SetKeyDelay, -1
	SetBatchLines, -1
	sleep 20
	Clipboard := ExpandEnv(sendTxt)
	ClipWait, 1
	If (!ErrorLevel) {
		sleep 20
		if (wClass = "ConsoleWindowClass") {
			SendInput, {Blind}!{Space}
			SendInput, {Blind}ep
		}		
		else		
			SendInput, {Blind}^v
	}
	sleep 150
	Clipboard := CBBU
	SetKeyDelay, %KDBU%
	SetBatchLines, %BLBU%
}