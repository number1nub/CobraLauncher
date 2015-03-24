Trimmer(str, omitchars=" `t") {
	If !StrLen(omitchars)
		Return, str
	str := RegExReplace(str, "^[" omitchars "]+") ; Trims from the beginning
	str := RegExReplace(str, "[" omitchars "]+$")	; Trims from the end
	Return, str
}