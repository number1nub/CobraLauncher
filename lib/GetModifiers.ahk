GetModifiers() {
	for a, b in {Alt:"!", Ctrl:"^", LWin:"#", Shift:"+"}
		mods .= GetKeyState(a, "P") ? b : ""
	return mods
}