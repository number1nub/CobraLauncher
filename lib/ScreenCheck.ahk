ScreenCheck(ByRef MouseX, ByRef MouseY, GuiWidth, GuiHeight) {
	SysGet, NumMon, MonitorCount
	loop, %NumMon%
	{
		SysGet, Mon%A_Index%, Monitor, %A_Index%
		if (MouseX >= Mon%A_Index%Left && MouseX <= Mon%A_Index%Right) ; which screen
		{
			aScreen := A_Index
			if (MouseX >= Mon%A_Index%Right - GuiWidth)
				MouseX := Mon%A_Index%Right - GuiWidth
			if (MouseY >= Mon%A_Index%Bottom - GuiHeight)
				MouseY := Mon%A_Index%Bottom - GuiHeight
		}			
	}
	return
}