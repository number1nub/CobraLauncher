ColorPicker() {
	theColor := RegExReplace(ColorChooser(), "i)0x")
	if (theColor = "0" || theColor <> "") {
		loop % (6 - StrLen(theColor))
			zeros .= "0"
		theColor := zeros theColor		
		SetFormat, integer, d
		return % theColor
	}
}