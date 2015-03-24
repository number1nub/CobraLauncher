GetSelection(cut="") {
	CBBU:=Clipboard, BLBU:=A_BatchLines, KDBU:=A_KeyDelay
	Clipboard:=""
	SetBatchLines, -1
	SetKeyDelay, -1
	SendInput, % "{Blind}^" (cut ? "x" : "c")
	ClipWait, 1
	sel:=ErrorLevel ? "" : Clipboard, Clipboard:=CBBU
	SetBatchLines, %BLBU%
	SetKeyDelay, %KDBU%
	return sel
}