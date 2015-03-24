MainTriggerPressed() {
	If (WinExist("c0bra Main GUI")) {
		if WinActive("c0bra Main GUI")
			SLR_GUI()
		else {
			GUI, Destroy
			ShowGui()
		}
	}
	else {
		IfWinExist SLR
		{
			IfWinActive SLR
				ShowGui()
			else
				WinActivate SLR
		}
		else
			ShowGui()
	}
}