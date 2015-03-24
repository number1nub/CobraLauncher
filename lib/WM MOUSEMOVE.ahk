WM_MOUSEMOVE(wp, lp, msg, id) {
	global
	BBU:=A_BatchLines
	SetBatchLines, -1
	MouseGetPos,,,, controlName
	ControlGetText, controlText,, ahk_id %id%
	WinGetTitle, thisWin, % "ahk_id " WinExist()
	if (InStr(thisWin, "c0bra"))
		if !(instr(thisWin, "Main") || instr(thisWin, "SLR"))
			return
	if (PREV_HWND = id) {
		SetBatchLines, % BBU
		return
	}	
	if (thisWin!="c0bra SLR" && controlText) {
		if controlText not in %allButtons%
			controlText := "Bookmarks"
	}
	if (prevWin!="c0bra SLR" && prevText) {
		if prevText not in %allButtons%
			prevText := "Bookmarks"
	}
	
	prevBColor := prevWin = "c0bra SLR" ? slrList[PrevText].BackColor : ButtonList[PrevText].BackColor
	prevTColor := prevWin = "c0bra SLR" ? slrList[PrevText].TextColor : ButtonList[PrevText].TextColor
	curHlBColor := thisWin = "c0bra SLR" ? slrList[controlText].HlBackColor : ButtonList[controlText].HlBackColor
	curHlTColor := thisWin = "c0bra SLR" ? slrList[controlText].HlTextColor : ButtonList[controlText].HlTextColor
	
	if (!id || !controlText || !InStr(controlName, "static")) {
		CTLCOLORS.Change(PREV_HWND, prevBColor, prevTColor)
		PREV_HWND := ""
		SetBatchLines, % BBU
		return
	}
	CTLCOLORS.Change(PREV_HWND, prevBColor, prevTColor)
	CTLCOLORS.Change(id, curHlBColor, curHlTColor)
	PREV_HWND := id
	PrevText := controltext
	prevWin := thisWin
	SetBatchLines, % BBU
}