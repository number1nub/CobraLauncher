ColorGui() {
	global	
	htmlColors := "Black|Silver|Gray|White|Maroon|Red|Purple|Fuchsia|Green|Lime|Olive|Yellow|Navy|Blue|Teal|Aqua"
	
	if (ColorButton) {
		if (ColorButton = "BackColor" || ColorButton = "TextColor" || ColorButton = "HLBackColor" || ColorButton = "HLTextColor") {
			daButton := ColorButton
			me 		 := "Default"
			StringReplace, htmlColors, htmlColors, % buttonList[me][daButton], % buttonList[me][daButton] = "Aqua" ? buttonList[me][daButton] "||" : buttonList[me][daButton] "|"
		}
		else {
			GuiControlGet, buttonColor, Settings:, %ColorButton%
			StringReplace, htmlColors, htmlColors, % buttonColor, % buttonColor = "Aqua" ? buttonColor "||" : buttonColor "|"
		}
	}
	else {
		daButton := A_ThisMenuItem
		StringReplace, htmlColors, htmlColors, % buttonList[me][daButton], % buttonList[me][daButton] = "Aqua" ? buttonList[me][daButton] "||" : buttonList[me][daButton] "|"
	}
	
	GUI, 1:Destroy	
	GUI, CLR:Margin, 5, 5
	GUI, CLR:Add, Button, x5 y40 w100 h30 gCustom, Custom
	GUI, CLR:Add, Text, x25 y13 w40 h20 +Right, Color:
	GUI, CLR:Add, DropDownList, x75 y10 w120 h20 r16 vdaColor gcolorDrop, % htmlColors
	GUI, CLR:Add, Text, x+10 w40 h20 hwndColorHwnd, 		
	;~ GUI, CLR:Add, Button, x105 y40 w60 h30 gbtnDefault, Default
	GUI, CLR:Add, Button, x165 y40 w100 h30 gokButton Default, OK
	GUI, CLR:Show, h80, c0bra Colors
	
	if (ColorButton <> "" && ColorButton <> "BackColor" && ColorButton <> "TextColor" && ColorButton <> "HLBackColor" && ColorButton <> "HLTextColor")
		CTLCOLORS.Attach(ColorHwnd, buttonColor, buttonColor)
	else
		CTLCOLORS.Attach(ColorHwnd, buttonList[me][daButton], buttonList[me][daButton])
	return
	
	colorDrop:
		GUI, CLR:Submit, nohide
		CTLCOLORS.Change(ColorHwnd, daColor, "White")
		return

	okButton:
		GUI, CLR:Submit
		GUI, CLR:Destroy
		newColor := daColor
		If (aGuiSettings) {
			if (newColor <> "")
				GuiControl, Settings:, %ColorButton%, %newColor%
			aGuiSettings := ""
			ColorButton := ""
			return
		}
		else {
			for key, value in buttons {
				if (value.text = me) {
					buttons[key][A_ThisMenuItem] := newColor
					JSON_Save(buttons, files.user.Buttons)
					GUI, 1:destroy
					GUI, Destroy					
					quickReload("Button Color Updated")		
				}
			}
		}
		return

	Custom:
		GUI, CLR:Submit
		GUI, CLR:Destroy
		newColor := ColorPicker()
		If (aGuiSettings)
		{
			if (newColor <> "")
				GuiControl, Settings:, %ColorButton%, %newColor%

			aGuiSettings :=
			ColorButton :=
			return
		}
		else
		{
			for key, value in buttons
			{
				if (value.text = me)
				{
					buttons[key][A_ThisMenuItem] := newColor
					JSON_Save(buttons, files.user.Buttons)
					
					GUI, 1:destroy
					GUI, Destroy
					
					quickReload("Button Color Updated")		
				}
			}
		}
		return
}