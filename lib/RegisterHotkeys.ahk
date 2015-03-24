RegisterHotkeys() {
	for i, val in settings.mainHotkey.disableIfActive
		GroupAdd, NoRunGroup, % val
	for i, val in settings.theCloser.disableIfActive
		GroupAdd, NoCloserGroup, % val
	for i, val in settings.userHotkeys
		Hotkey, % i, superShorts

	Hotkey, IfWinNotActive, ahk_group NoRunGroup
	Hotkey, % settings.mainHotkey.mainHotkey, mainTrigger
	
	Hotkey, IfWinNotActive, ahk_group NoCloserGroup
	Hotkey, % settings.theCloser.hotkey, theCloser

	Hotkey, IfWinActive, c0bra Main GUI
	Hotkey, Enter, ButtonPress
	Hotkey, ^Enter, ButtonPress
	Hotkey, IfWinActive
}