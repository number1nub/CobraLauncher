editMe() {
	if (A_IsCompiled) {
		m("Option only valid for uncompiled AHK script!", "ico:!")
		return
	}
	run, edit %A_ScriptFullPath%
}