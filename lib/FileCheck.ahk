FileCheck() {
	for c, v in files.names {
		files.user[StrSplit(v, ".").1] := files.userDir v
		files.clean[StrSplit(v, ".").1] := files.cleanDir v
		files.count:=A_Index
	}
	if !(FileExist(files.user.Buttons) || FileExist(files.user.settings) || FileExist(files.user.SLRButtons)) {
		if (!FileExist(files.userDir))
			FileCreateDir, % files.userDir
		if (A_IsCompiled && FileExist(files.cleanDir) && FileExist(files.clean.settings)) {
			FileInstall, config\Buttons.c0bra, % files.user.Buttons
			FileInstall, config\settings.c0bra, % files.user.settings
			FileInstall, config\SLRButtons.c0bra, % files.user.SLRButtons
		} else {
			FileCopy, % files.clean.Buttons, % files.user.Buttons
			FileCopy, % files.clean.settings, % files.user.settings
			FileCopy, % files.clean.SLRButtons, % files.user.SLRButtons
		}
		TrayTip, c0bra Launcher, New configuration files copied to user settings directory!, 2, 1
	}
}