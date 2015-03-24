GetFontList(selFont) {
	fList := "", fFound := false
	fontList := [ "Lucida Sans Unicode", "Times New Roman", "Arial", "Veranda", "Calibri", "BankGothic Md Bt" ]
	for c, fnt in fontList
	{
		fList .= (fList ? "|" : "") fnt
		if (fnt = selFont)
		{
			fList .= c = fontList.MaxIndex() ? "||" : "|"
			fFound := true
		}
	}
	if (!fFound)
		fList .= "|" selFont "||"
	return fList
}