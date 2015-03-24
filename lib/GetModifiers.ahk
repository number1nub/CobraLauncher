GetModifiers() {
	Modifiers := GetKeyState("Ctrl", "P") ? "^" : ""
	Modifiers .= GetKeyState("Alt", "P") ? "!" : ""
	Modifiers .= GetKeyState("Shift", "P") ? "+" : ""
	Modifiers .= GetKeyState("LWin", "P") ? "#" : ""
	Return, Modifiers
}