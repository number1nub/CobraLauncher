ProFile() {
	exe:="ProfileWinClient.exe", name:="PRO.FILE V8"
	hw:=A_DetectHiddenWindows, tmm:=A_TitleMatchMode
	DetectHiddenWindows, On
	SetTitleMatchMode, 2
	
	if (WinExist("ahk_exe " exe))
		Run, %exe%
	else {
		Run, %exe%
		WinWait %name%
		WinActivate
		WinWaitActive
		SendInput, {Blind}rameen.bakhtiary{Tab}p4s5w0rd{!}{Enter}
	}
	DetectHiddenWindows, %hw%
	SetTitleMatchMode, %tmm%
}