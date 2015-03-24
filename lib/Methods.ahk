theCloser:
	MouseGetPos,,, win
	WinGetTitle, winTitle, ahk_id %win%
	WinGetClass, winClass, ahk_id %win%
	for i, val in settings.theCloser.closeTabIfActive
		closeTabWindows .= (closeTabWindows ? "," : "") val  
	if winTitle contains %closeTabWindows%
		SendInput, {Blind}^{F4}
	else if winClass contains %closeTabWindows%
		SendInput, {Blind}^{F4}
	else
		WinClose, ahk_id %win%
return



CopyTo:
	GetKeyState, keyState, Alt, P
	if (keyState = "D")	{
		try CopyToRun()
		catch e	{
			msgbox % e
			return
		}
	}
	else {
		try copyToNotepad()
		catch e	{
			MsgBox % e
			return
		}
	}
return

MeasurePixels:
	On := (On = 1) ? 0 : 1
	If On
	{
		MouseGetPos, GetPixX, GetPixY
		SetTimer, GetPixels, 50
	}
	Else
	{
		SetTimer, GetPixels, Off
		ToolTip
	}
return



GetPixels:	
	MouseGetPos, GetPixX2, GetPixY2
	Loop,2
	{
		var := (A_Index = 1) ? "GetPixX" : "GetPixY"
		%var%2 := %var%2 - %var%
		If !%var%2
			dir%var% := ""
		else
			dir%var% := (%var%2 > 0) ? (A_Index = 1 ? "Right" : "Down") : (A_Index = 1 ? "Left" : "Up")
		%var%2 := Abs(%var%2)
	}
	ToolTip, % "X: " GetPixX2 A_Tab dirX "`nY: " GetPixY2 A_Tab dirY
return


TToff:
	settimer, TToff, off
	tooltip
	traytip
return

