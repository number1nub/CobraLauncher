totalCommander() {
	TMM:=A_TitleMatchMode, DHW:=A_DetectHiddenWindows
	DetectHiddenWindows, On
	SetTitleMatchMode, 3
	try {
		Run, C:\TotalCMD\TOTALCMD64.EXE
		WinWait, ahk_class TNASTYNAGSCREEN
		WinActivate
		WinWaitActive
		ControlGetText, pressBtn, Window4
		ControlFocus, &%pressBtn%
		ControlSend, &%pressBtn%, {Enter}
	}
	catch e
		m("Error!",e.extra,e.message,e.what,"ico:!")
	SetTitleMatchMode, %TMM%
	DetectHiddenWindows, %DHW%
}