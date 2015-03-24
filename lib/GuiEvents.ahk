GuiSize:
2GuiSize:
3GuiSize:
4GuiSize:
5GuiSize:
6GuiSize:
7GuiSize:
8GuiSize:
9GuiSize:
10GuiSize:
CLRGuiSize:
   If (A_EventInfo != 1) {
	  GUI, %A_Gui%:+LastFound
	  WinSet, ReDraw
   }   
return


CLRGuiClose:
CLRGuiEscape:
10GuiClose:
10GuiEscape:
9GuiClose:
9GuiEscape:
8GuiClose:
8GuiEscape:
7GuiClose:
7GuiEscape:
6GuiClose:
6GuiEscape:
5GuiClose:
5GuiEscape:
4GuiClose:
4GuiEscape:
3GuiClose:
3GuiEscape:
2GuiClose:
2GuiEscape:
GuiClose:
GuiEscape:
	CTLCOLORS.free()
	Loop 10
		GUI, %A_index%:Destroy
	ColorButton := ""
	GUI, CLR:Destroy
return


GuiContextMenu:
2GuiContextMenu:
3GuiContextMenu:
4GuiContextMenu:
5GuiContextMenu:
6GuiContextMenu:
7GuiContextMenu:
8GuiContextMenu:
9GuiContextMenu:
10GuiContextMenu:
	MouseGetPos, XPOS, YPOS	
	
	; Get button name 
	me := A_GuiControl
	meDisp := RegExReplace(me, "i)(.+)s$", "$1(s)")
	meAdd  := RegExReplace(me, "i)(.+)s$", "$1")
	
	; No context menu for a button in Bookmarks GUI
	if !(buttonList[me])
		return

	for key, value in settings.buttonTypes
		buttonTypes .= (buttonTypes ? "|" : "") value

	; Common top of menu
	Menu, Title, Add
	Menu, Title, DeleteAll		
	menu, title, add, Cancel, cancelMenuItem
	menu, title, default, cancel
	Menu, Title, Add
	

	; Add Main Button sub menu
	If !(buttonList[me].Level)
	{
		Menu, SubAdd, Add
		Menu, SubAdd, DeleteAll
		Menu, SubAdd, Add, main Sub-Menu Button, QuickEditMenu
		Menu, SubAdd, Add
		
		loop, parse, buttonTypes, |
		{
			Menu, SubAdd, Add, main %A_LoopField%, QuickEditMenu
			if (instr(allButtons,"Bookmarks") && A_LoopField = "Bookmarks")
				Menu, SubAdd, Disable, main %A_LoopField%
		}
		
		Menu, Title, Add, Add Main Button, :SubAdd
	}
	
	
	; Add button menus
	if (buttonList[me].Children && me != "GO" && me != "Bookmarks")
	{
		Menu, SubAdd1, Add
		Menu, SubAdd1, DeleteAll
		loop, parse, buttonTypes, |
		{
			if (A_LoopField <> "Bookmarks")
			Menu, SubAdd1, Add, %A_LoopField%, QuickEditMenu
		}
		
		Menu, Title, Add, Add to <%me%>, :SubAdd1
	}

	; Color button menus
	Menu, colorAdd, Add
	Menu, colorAdd, DeleteAll
	Menu, colorAdd, Add, % "BackColor", QuickEditMenu
	Menu, colorAdd, Add, % "TextColor", QuickEditMenu
	Menu, colorAdd, Add, % "HlBackColor", QuickEditMenu
	Menu, colorAdd, Add, % "HlTextColor", QuickEditMenu
	Menu, Title, Add, <%me%> Colors, :colorAdd

	; Edit and Delete button menus
	if (me != "GO")
	{
		if (me != "Bookmarks")
			Menu, Title, Add, Edit <%me%>, QuickEditMenu
		
		Menu, Title, Add, Delete <%me%>, QuickEditMenu		
	}
	
	Menu, Title, Add
	Menu, Title, Add, Options, Gui_settings
	
	Menu, Title, Show, x%XPOS% y%YPOS%
return