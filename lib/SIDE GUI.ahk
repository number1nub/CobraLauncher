SIDE_GUI() {
	global

	sideButtonSpacing 		:= settings.sideGui.buttonSpacing
	sideButtonWidth 		:= settings.sideGui.buttonWidth
	sideButtonHeight 		:= settings.sideGui.buttonHeight
	sideSearch 				:= settings.sideGui.search
	sideTextSize 			:= settings.sideGui.textSize
	sideTextBold 			:= settings.sideGui.textBold
	sideTextFont			:= settings.sideGui.textFont

	currGui := A_Gui
	nextGui := currGui = 1 ? currGui + 2 : currGui + 1
	
	if (!currGui)	; Band-Aid for method being called when using The Closer
		return
	
	SetTitleMatchMode, 3
	IfWinExist, %A_GuiControl%
	{
		GUI, %nextGui%:Destroy
		return
	}
	SetTitleMatchMode, 1
	
	PREV_GUI := A_Gui
	;~ PREV_GUI := currGui
	currGui := nextGui
	
	GUI, Submit, nohide
	GUI, +LastFound
	WinGetPos,x,y,w,h

	GuiControlGet, CONTROL_POS, Pos, %A_GuiControl%
	
	if (PREV_GUI = 1)
		ON_LEFT := ON_LEFT(CONTROL_POSX)
	
	if (A_GuiControl = lastButton)
	{
		XPOS := x + (2 * buttonSpacing)
		YPOS := y + CONTROL_POSY + buttonSpacing + buttonHeight
	}
	else if ON_LEFT
	{
		XPOS := x - (2 * sideButtonSpacing) - sideButtonWidth
		YPOS := y + CONTROL_POSY - buttonSpacing
	}
	else
	{
		XPOS := x + CONTROL_POSX + buttonWidth + buttonSpacing
		YPOS := y + CONTROL_POSY - buttonSpacing
	}
	
	ChildrenList := []
	childrenButtons := ""
	
	For key, value in ButtonList[A_GuiControl].Children
	{
		ChildrenList.Insert(value, ButtonList[value])
		childrenButtons .= (childrenButtons ? "," : "") value
	}
	
	GUI, %currGui%:Color, % settings.sideGui.guiBackColor
	GUI, %currGui%:-caption +ToolWindow +Owner%PREV_GUI%
	GUI, %currGui%:margin, %sideButtonSpacing%, %sideButtonSpacing%
	GUI, %currGui%:Font, s%sideTextSize% w%sideTextBold%, %sideTextFont%
	;
	; Bookmarks
	;
	if (A_GuiControl = "Bookmarks")
	{
		MyFavs := A_MyDocuments "\..\Favorites\Links"
		
		; Loop through favorites folder for key, value, and count
		loop, %MyFavs%\*.url,, 1
		{
			if (A_LoopFileExt = "URL")
			{
				THE_BOOKMARK := RegExReplace(A_LoopFileName, "i)\.[^.]*$")
				THE_BOOKMARK_PATH := A_LoopFileLongPath
				
				A_HWND := "book" A_Index
				
				if (lastButton = "Bookmarks")
				{
					GUI, %currGui%:Add, text, x%sideButtonSpacing% y+%sideButtonSpacing% w%sideLastButWidth% h%sideButtonHeight% 0x200 Center gSideButtonPress hwnd%A_HWND%, % THE_BOOKMARK
						CTLCOLORS.Attach(%A_HWND%, ButtonList.Bookmarks.BackColor, ButtonList.Bookmarks.TextColor)
				}
				else
				{
					GUI, %currGui%:Add, text, y+%sideButtonSpacing% w%sideButtonWidth% h%sideButtonHeight% 0x200 Center gSideButtonPress hwnd%A_HWND%, % THE_BOOKMARK
						CTLCOLORS.Attach(%A_HWND%, ButtonList.Bookmarks.BackColor, ButtonList.Bookmarks.TextColor)
				}
			}
		}
	}
	;
	; Not bookmarks
	;
	else
	{
		Loop, Parse, childrenButtons, `,
		{
			A_HWND := "side" A_Index
			if (lastButton = A_GuiControl)
			{
				GUI, %currGui%:Add, text, x%sideButtonSpacing% y+%sideButtonSpacing% w%sideLastButWidth% h%sideButtonHeight% 0x200 Center gSideButtonPress hwnd%A_HWND%, % A_LoopField
					CTLCOLORS.Attach(%A_HWND%, ChildrenList[A_LoopField].BackColor, ChildrenList[A_LoopField].TextColor)
			}
			else
			{
				GUI, %currGui%:Add, text, y+%sideButtonSpacing% w%sideButtonWidth% h%sideButtonHeight% 0x200 Center gSideButtonPress hwnd%A_HWND%, % A_LoopField
					CTLCOLORS.Attach(%A_HWND%, ChildrenList[A_LoopField].BackColor, ChildrenList[A_LoopField].TextColor)
			}
		}
	}

	;~ SideHeight := ((1 + numChildren)* sideButtonSpacing) + (numChildren * sideButtonHeight)
	;~ SideWidth := (2 * sideButtonSpacing) + sideButtonWidth
	;~ ScreenCheck(XPOS, YPOS, SideWidth, SideHeight)
	
	GUI, %currGui%:Show, x%XPOS% y%YPOS%, %A_GuiControl%
}