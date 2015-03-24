ToggleCase(toCase = "U") {
	BLB := A_BatchLines, KDB := A_KeyDelay, CBB := Clipboard
	SetKeyDelay, -1
	SetBatchLines, -1
	Clipboard := ""
	sleep 50
	Send, {Blind}^c
	ClipWait, 2
	If (ErrorLevel)	{
		TrayTip, C0bra Launcher, Could't get selected text., 1500
		return
	}	
	if (toCase = "L")
		StringLower, v, Clipboard
	else if (toCase = "T")
		StringUpper, v, Clipboard, T
	else (toCase = "U")
		StringUpper, v, Clipboard
	PasteVal(v), Clipboard := CBB
	SetKeyDelay, %KDB%
	SetBatchLines, %BLB%	
}