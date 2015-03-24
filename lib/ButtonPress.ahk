ButtonPress() {
	global
	mainBut := A_GuiControl
	if !(WinExist(A_GuiControl))
		GUI, 3:Destroy	; In case another GUI is selected
	GuiControlGet, controlhwnd, Hwnd, %A_GuiControl%
	IfWinActive, c0bra Main GUI
	{
		if (controlhwnd = go || !A_GuiControl) {
			if SEARCH {
				GUI, Submit
				if instr(A_ThisHotkey, "^") {
					Run, % "chrome.exe " GSEARCH (urlPos:=GSEARCH~="i)\.(.{1,4})$" ? SubStr(GSEARCH,1,urlPos-1) : ".com")
					GUI, Destroy
					return
				}				
				Google(GSEARCH) ; regular google search
				GUI, Destroy
				return
			}
		}
	}	
	GUI, Submit, NoHide
	Execute("[" buttonList[A_GuiControl].Cmd.Type "] " buttonlist[A_GuiControl].Cmd.Arg, buttonlist[A_GuiControl].Text)
}