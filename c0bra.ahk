#NoEnv
#SingleInstance, Force
#Include %A_ScriptDir%\lib\JSON.ahk
#Escapechar ``
#CommentFlag ;
SetWorkingDir, %A_ScriptDir%
CoordMode, Mouse, Screen
DetectHiddenWindows, On
SetTitleMatchMode, 2


global settings:=[], files:=[], lists:=[], Buttons:=[]

files.userDir := A_AppData "\c0bra\"
files.cleanDir:= A_ScriptDir "\config\"
files.names   := ["Buttons.c0bra","settings.c0bra","SLRButtons.c0bra"]

FileCheck()

try settings := JSON_Load(files.user.settings)
catch e {
	m("There's an error with your config file:", e.file,, e.message, e.extra, "Please correct the issue and reload Cobra", "ico:!")
	ExitApp
}
if (FileExist(files.clean.settings)) {
	serverConfig := JSON_Load(files.clean.settings)
	if (serverConfig.Version != settings.Version) {
		RegExMatch(serverConfig.Version, "(\d+?)\.(\d+?)(?:\.(\d+?)(?:\.(\d+))?)?", sVer)
		RegExMatch(settings.Version, "(\d+?)\.(\d+?)(?:\.(\d+?)(?:\.(\d+))?)?", uVer)
		if (sVer1 > uVer1)
			UpdateVer(serverConfig.Version)
		if (sVer1 = uVer1 && sVer2 > uVer2)
			UpdateVer(serverConfig.Version)
		if (sVer1 = uVer1 && sVer2 = uVer2 && sVer3 > uVer3)
			UpdateVer(serverConfig.Version)
		if (sVer1 = uVer1 && sVer2 = uVer2 && sVer3 = uVer3 && sVer4 > uVer4)
			UpdateVer(serverConfig.Version)
	}
}
if 0 > 0
{
	WinKill, % "ahk_id " %1%
	prompt = %2%
	title = %3%
	title := title ? title : "Cobra Launcher Config"		
	if (prompt || title)
		TrayTip, %title%, %prompt%, 3500, 1
}
RegisterHotkeys()
MenuSetup()
OnMessage(0x200, "WM_MOUSEMOVE")
return


#Include %A_ScriptDir%\lib
#Include addButton.ahk
#Include buttonCheck.ahk
#Include ButtonPress.ahk
#Include cancelMenuItem.ahk
#Include Class_CTLCOLORS.ahk
#Include ColorChooser.ahk
#Include ColorGui.ahk
#Include ColorPicker.ahk
#Include ContextMenu.ahk
#Include CopyToNotepad.ahk
#Include CopyToRun.ahk
#Include deleteButton.ahk
#Include editMe.ahk
#Include Execute.ahk
#Include Exit.ahk
#Include ExpandEnv.ahk
#Include FileCheck.ahk
#Include GetModifiers.ahk
#Include GetSelection.ahk
#Include Google.ahk
#Include GuiEvents.ahk
#Include m.ahk
#Include mainTrigger.ahk
#Include MainTriggerHold.ahk
#Include MainTriggerPressed.ahk
#Include MenuSetup.ahk
#Include Methods.ahk
#Include modReplace.ahk
#Include On Left.ahk
#Include OpenConfigDir.ahk
#Include PasteVal.ahk
#Include QuickReload.ahk
#Include RegisterHotkeys.ahk
#Include reloadMe.ahk
#Include ScreenCheck.ahk
#Include settings.ahk
#Include ShowGui.ahk
#Include SIDE GUI.ahk
#Include SideButtonPress.ahk
#Include SLR GUI.ahk
#Include StrLower.ahk
#Include StrUpper.ahk
#Include superShorts.ahk
#Include ToggleCase.ahk
#Include totalCommander.ahk
#Include Trimmer.ahk
#Include UpdateVer.ahk
#Include Volume.ahk
#Include WM MOUSEMOVE.ahk
#Include GetFontList.ahk