MenuSetup() {
	Menu, Tray, NoStandard
	Menu, SubMenu_About, Add
	Menu, SubMenu_About, DeleteAll
	Menu, SubMenu_About, Add, Creators - Nugh && Shugh, cancelMenuItem
	Menu, SubMenu_About, Disable, Creators - Nugh && Shugh
	Menu, SubMenu_About, Add
	Menu, SubMenu_About, Add, % "Version " settings.version, cancelMenuItem
	Menu, SubMenu_About, Disable, % "Version " settings.version
	
	Menu, Tray, Add, About, :SubMenu_About
	Menu, Tray, Add
	Menu, Tray, Add, Options, Gui_settings
	Menu, Tray, Add, Open Config Dir, openConfigDir
	Menu, Tray, Add
	Menu, Tray, Add, Reload, reloadMe
	if (!A_IsCompiled)
		Menu, Tray, Add, Edit Script, editMe
	Menu, Tray, Add
	Menu, Tray, Add, Exit
	Menu, Tray, Default, Reload
	Menu, Tray, tip, c0bra!
	if (A_IsCompiled)
		Menu, Tray, Icon, % A_ScriptFullPath, -159
	else
		Menu, Tray, Icon, % FileExist(tIco := (A_ScriptDir "\res\c0bra.ico")) ? tIco : ""
}