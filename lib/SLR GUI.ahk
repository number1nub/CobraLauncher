SLR_GUI() {
	global	
	GUI, 1:Destroy
	slrSettings:=JSON_Load(files.user.SLRButtons), slrList:=[], slrButtons := ""
	
	For key, value in slrSettings {
		slrButtons .= (slrButtons ? "`n" : "") value.text
		slrList.Insert(value.text, value)
	}
	
	MouseGetPos, MouseX1, MouseY1
	
	SLRbuttonSpacing := settings.SLRGui.buttonSpacing
	SLRbuttonWidth 	 := settings.SLRGui.buttonWidth
	SLRbuttonHeight  := settings.SLRGui.buttonHeight
	SLRguiBackColor	 := settings.SLRGui.guiBackColor
	SLRtextSize 	 := settings.SLRGui.textSize
	SLRtextBold 	 := settings.SLRGui.textBold
	SLRtextFont		 := settings.SLRGui.textFont
	
	GUI, 2:font, s%SLRtextSize% w%SLRtextBold%, %SLRtextFont%
	GUI, 2:+toolwindow -caption
	GUI, 2:Color, % settings.SLRGui.guiBackColor
	GUI, 2:Margin, %SLRbuttonSpacing%, %SLRbuttonSpacing%
	
	Loop, Parse, slrButtons, `n
	{
		if (A_Index = 1)
			GUI, 2:Add, text, x%SLRbuttonSpacing% y%SLRbuttonSpacing% w%SLRbuttonWidth% h%SLRbuttonHeight% hwnd%A_LoopField% 0x200 Center gSLR, %A_LoopField%
		else
			GUI, 2:Add, text, y+%SLRbuttonSpacing% w%SLRbuttonWidth% h%SLRbuttonHeight% hwnd%A_LoopField% 0x200 Center gSLR, %A_LoopField%		
		CTLCOLORS.Attach(%A_LoopField%, slrList[A_LoopField].BackColor, slrList[A_LoopField].TextColor)
	}
	
	SLRHeight := (5 * SLRButtonSpacing) + (ButtonHeight * 4)
	SLRWidth := (2 * ButtonSpacing) + SLRButtonWidth
	ScreenCheck(MouseX1, MouseY1, SLRWidth, SLRHeight)	
	GUI, 2:Show, x%MouseX1% y%MouseY1%, c0bra SLR
	return
	
	SLR:
		GUI, Submit
		if (A_GuiControl != "Cancel") {			
			if (m("SAVE ALL YOUR WORK BEFORE HITTING YES!!",,"Are you sure you want to " A_GuiControl "?", "ico:!", "btn:yn") = "YES") {
				GUI, Destroy
				Shutdown, % A_GuiControl = "Shutdown" ? "13" : A_GuiControl = "Restart" ? "6" : "0"
			}
			Else
				return
		}
		return
}