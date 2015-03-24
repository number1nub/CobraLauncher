modReplace(str) {
	StringReplace, v, str, +, Shift+
	StringReplace, v, v, ^, Ctrl+
	StringReplace, v, v, !, Alt+	
	StringReplace, v, v, #, Win+
	return v
}