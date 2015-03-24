CopyToRun() {
	try Selection := GetSelection()
	catch e {
		m(e, "ico:!")
		return
	}
	TTM := A_TitleMatchMode
	SetTitleMatchMode, 3
	Send, {Blind}#r
	WinWait, Run,,1.5
	If (ErrorLevel) {
		m("Unable to open/find Run prompt.","ico:!")
		return
	}
	Send, {Blind}^v
	SetTitleMatchMode, %TTM%
}