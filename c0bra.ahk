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


#Include <addButton>
#Include <buttonCheck>
#Include <ButtonPress>
#Include <cancelMenuItem>
#Include <Class_CTLCOLORS>
#Include <ColorChooser>
#Include <ColorGui>
#Include <ColorPicker>
#Include <ContextMenu>
#Include <CopyToNotepad>
#Include <CopyToRun>
#Include <deleteButton>
#Include <editMe>
#Include <Execute>
#Include <Exit>
#Include <ExpandEnv>
#Include <FileCheck>
#Include <GetModifiers>
#Include <GetSelection>
#Include <Google>
#Include <GuiEvents>
#Include <m>
#Include <mainTrigger>
#Include <MainTriggerHold>
#Include <MainTriggerPressed>
#Include <MenuSetup>
#Include <Methods>
#Include <modReplace>
#Include <On Left>
#Include <OpenConfigDir>
#Include <PasteVal>
#Include <QuickReload>
#Include <RegisterHotkeys>
#Include <reloadMe>
#Include <ScreenCheck>
#Include <settings>
#Include <ShowGui>
#Include <SIDE GUI>
#Include <SideButtonPress>
#Include <SLR GUI>
#Include <StrLower>
#Include <StrUpper>
#Include <superShorts>
#Include <ToggleCase>
#Include <totalCommander>
#Include <Trimmer>
#Include <UpdateVer>
#Include <Volume>
#Include <WM MOUSEMOVE>
#Include <GetFontList>
#Include <ProFile>