ShowGui(oldPos="") {
	global
	GUI, Destroy
	GUI, 1:Destroy
	GUI, 2:Destroy
	if (!oldPos)		
		MouseGetPos, XPOS, YPOS
	
	guiOldPos:
	currGui 	:= 1	
	ButtonList 	:= []
	mainButtons	:= ""
	
	Buttons := JSON_Load(files.user.Buttons)
	
	buttonSpacing 		:= settings.mainGui.buttonSpacing
	buttonWidth 		:= settings.mainGui.buttonWidth
	buttonHeight 		:= settings.mainGui.buttonHeight
	search 				:= settings.search.search
	textSize 			:= settings.mainGui.textSize
	textBold 			:= settings.mainGui.textBold
	textFont			:= settings.mainGui.textFont
	lastButWidth 		:= (buttonWidth * 2) + buttonSpacing
	sideLastButWidth	:= lastButWidth - (4 * buttonSpacing)
	footerColor			:= settings.footer.footerColor
	
	;{````  Create CSV button lists  ````}
	For key, value in Buttons
	{
		tempButton := value.text
		ButtonList.Insert(value.text, value)
		if (ButtonList[tempButton].Level = "")
			mainButtons .= (value.text != "GO" && value.text != "Default") ? ((mainButtons ? "," : "") value.text) : ""
		allButtons .= (allButtons ? "," : "") value.text
	}
	;}
	
	GUI, Color, % settings.mainGui.guiBackColor
	GUI, -caption +ToolWindow +AlwaysOnTop
	GUI, margin, %buttonSpacing%, %buttonSpacing%
	

	;{````  Create Search Bar  ````}
	if (search)
	{
		searchTextSize 	:= settings.search.textSize
		searchHeight    := settings.search.Height
		searchBackText  := settings.search.backText
		goWidth         := settings.search.goWidth
		xGo 			:= (buttonWidth * 2) + (buttonSpacing * 2) - goWidth
		searchWidth 	:= (buttonWidth * 2) - goWidth
		searchTextWidth := searchWidth - 8
		;~ searchTextColor := settings.search.textColor
		;~ searchTextFont	:= settings.search.textFont
		searchTextBold  := settings.search.textBold

		GUI, font, s%searchTextSize% w%searchtextBold%, %textFont%
		GUI, Add, Edit, x%buttonSpacing% y%buttonSpacing% w%searchWidth% h%searchHeight% 0x200 -VScroll vGSEARCH,
		GUI, Add, Text, xp yp-2 w%searchTextWidth% h%searchHeight%-2 0x200 Center +BackgroundTrans hwndBackSearch, %searchBackText%
		GUI, font, s%textSize% w%textBold% c%searchTextColor%, %textFont%	
		GUI, Add, text, x%xGo% y%buttonSpacing% w%goWidth% h%searchHeight% 0x200 Center gButtonPress hwndGO, GO
		CTLCOLORS.Attach(GO, ButtonList.GO.BackColor, ButtonList.GO.TextColor)
	}
	;}
	
			
	; Add Main GUI Buttons
	GUI, font, s%textSize% w%textBold%, %textFont%
	
	loop, Parse, mainButtons, `,
		KEY_COUNT := A_Index

	loop, Parse, mainButtons, `,
	{
		A_HWND := "back" A_Index
		
		; first key
		if (A_Index = 1)
		{
			GUI, Add, text, x%buttonSpacing% y+%buttonSpacing% w%buttonWidth% h%buttonHeight% 0x200 Center gButtonPress hwnd%A_HWND%, % A_LoopField
				CTLCOLORS.Attach(%A_HWND%, ButtonList[A_LoopField].BackColor, ButtonList[A_LoopField].TextColor)
			continue
		}
		
		; odd key
		else if (mod(A_Index, 2))
		{
			; last key
			if (A_Index = KEY_COUNT)
			{
				lastButton := A_LoopField
				GUI, Add, text, x%buttonSpacing% y+%buttonSpacing% w%LastButWidth% h%buttonHeight% 0x200 Center gButtonPress hwnd%A_HWND%, % A_LoopField
					CTLCOLORS.Attach(%A_HWND%, ButtonList[A_LoopField].BackColor, ButtonList[A_LoopField].TextColor)
				continue
			}
			GUI, Add, text, x%buttonSpacing% y+%buttonSpacing% w%buttonWidth% h%buttonHeight% 0x200 Center gButtonPress hwnd%A_HWND%, % A_LoopField
				CTLCOLORS.Attach(%A_HWND%, ButtonList[A_LoopField].BackColor, ButtonList[A_LoopField].TextColor)
			continue
		}
		
		; even key
		else 
		{
			GUI, Add, text, x+%buttonSpacing% w%buttonWidth% h%buttonHeight% 0x200 Center gButtonPress hwnd%A_HWND%, % A_LoopField
				CTLCOLORS.Attach(%A_HWND%, ButtonList[A_LoopField].BackColor, ButtonList[A_LoopField].TextColor)
			continue
		}
	}
		
	; Footer call		
	if (settings.footer.footer)
	{
		footerWidth := (buttonWidth * 2) + buttonSpacing
		footerTextSize 	:= settings.footer.textSize
		footerHeight    := settings.footer.Height
		footerTextColor := settings.footer.textColor
		footerTextFont	:= settings.footer.textFont
		footerTextBold  := settings.footer.textBold
		footerColor		:= settings.footer.footerColor
		
		GUI, font, s%footerTextSize% w%footerTextBold% c%footerTextColor%, %footerTextFont%
		GUI, Add, Text, x%buttonSpacing% y+5 w%footerWidth% h%footerHeight% 0x200 Center hwndFOOTER, % "c0bra v" settings.version
			CTLCOLORS.Attach(FOOTER, footerColor, footerTextColor)
	}
		
	;is there a better way to get gui width and height that hasn't been created yet?
	GuiHeight := ((3 + Floor(KEY_COUNT / 2)) * ButtonSpacing) + searchHeight + (ButtonHeight * Ceil(KEY_COUNT / 2))
	GuiWidth := (3 * ButtonSpacing) + (2 * ButtonWidth)
	ScreenCheck(XPOS, YPOS, GuiWidth, GuiHeight)
		
	GUI, Show, x%XPOS% y%YPOS%, c0bra Main GUI
	
	; Insert SLR buttons back into mainButtons variable	
	mainButtons .= ",GO"
	return
}