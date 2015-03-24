ColorPicker() {	
	theColor := RegExReplace(ColorChooser(), "i)0x")
	if (theColor = "0" || theColor <> "")
	{
		if ((theLen := StrLen(theColor)) < 6)
		{
			if (theLen = 5)
				theColor := "0" theColor
			else if (theLen = 4)
				theColor := "00" theColor
			else if (theLen = 3)
				theColor := "000" theColor
			else if (theLen = 2)
				theColor := "0000" theColor
			else if (theLen = 1)
				theColor := "00000" theColor
		}

		SetFormat, integer, d
		return % theColor
	}
}