totalCommander() {
	TMM:=A_TitleMatchMode, DHW:=A_DetectHiddenWindows
	DetectHiddenWindows, On
	SetTitleMatchMode, 2
	try {
		Run, C:\TotalCMD\TOTALCMD64.EXE
		WinWait, ahk_class TNASTYNAGSCREEN
		WinActivate
		ControlGetText, pressBtn, Window4	
		ControlClick, &%pressBtn%
	}
	catch e
		 m("Error!",e.extra,e.message,e.what,"ico:!")
	SetTitleMatchMode, %TMM%, DetectHiddenWindows, %DHW%
}