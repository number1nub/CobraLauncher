Gui_settings() {
	global
	
	Gui, 1:Destroy
	Gui, 2:Destroy
	
	;{```` Create CSV button lists ````}
	Buttons    := JSON_Load(files.user.Buttons)
	ButtonList := []
	
	For key, value in Buttons
	{
		tempButton := value.text
		ButtonList.Insert(value.text, value)
	}
	;}
	
	Gui, settings:Margin, 2, 10
	Gui, settings:Font, s11 cBlack w700, Times New Roman	
	Gui, settings:Add, Tab2, x2 y2 w675 h315 Wrap, Hotkeys|Gui Appearance|Colors / Add-ons|The Closer
	
	
	;{````  Hotkeys Tab Controls  ````}
	Gui, settings:Tab, Hotkeys
	
	Gui, settings:Add, GroupBox, x5 y35 w330 h280 Center, TRIGGER HOTKEYS
	Gui, settings:Add, Text, xp+5 yp+30 w140 h30 Section, Main Trigger
	Gui, settings:Add, Text, xp y+5 wp hp, Hold Trigger Action
	Gui, settings:Add, Edit, x+5 ys-5 w175 hp vmainTrigger, % settings.mainHotkey.mainHotkey
	Gui, settings:Add, Edit, xp y+5 wp hp vmainHoldTrigger, % settings.mainHotkey.holdAction
	Gui, settings:Add, Text, xs y+10 w320 hp Center, Main trigger is disabled for the below items:
	
	aList :=
	for key, value in settings.mainHotkey.disableIfActive
		aList := (aList = "" ? "" : aList "|") value
	Gui, settings:Add, ListBox, xp y+5 w320 h110 vdisableIfActive hwndHdisableIfActive, %aList%
	Gui, settings:Add, Button, xs+45 y+5 w100 h30 gaddTriggerDisable, Add
	Gui, settings:Add, Button, x+25 yp wp hp gremTriggerDisable, Remove
	
	Gui, settings:Add, GroupBox, x340 y35 w330 h280 Center, USER HOTKEYS
	Gui, settings:Add, Text, xp+5 yp+30 w320 h30 Center Section, Manage any personal hotkeys below:
	
	bList :=
	for key, value in settings.userHotkeys
		bList := (bList = "" ? "" : bList "|") key "`t" value
	Gui, settings:Add, ListBox, xp y+7 wp h190 vuserHotkeys hwndHuserHotkeys, %bList%
	Gui, settings:Add, Button, xs+45 y+5 w100 h30 gaddUserHotkey, Add
	Gui, settings:Add, Button, x+25 yp w100 hp gremUserHotkey, Remove
	;}
	
	;{````  Appearance Tab Controls  ````}
	Gui, settings:Tab, Gui Appearance
		
	Gui, settings:Add, Text, x+5 y+40 w160 h30 Section, Button Height (pixels)
	Gui, settings:Add, Text, xp y+5 wp hp, Button Width (pixels)
	Gui, settings:Add, Text, xp y+5 wp hp, Button Spacing (pixels)
	Gui, settings:Add, Text, xp y+5 wp hp, Button Text Font
	Gui, settings:Add, Text, xp y+5 wp hp, Button Text Boldness
	Gui, settings:Add, Text, xp y+5 wp hp, Button Text Size
	Gui, settings:Add, Text, xp y+5 wp hp, Background Color
	
	Gui, settings:Add, GroupBox, x+10 y35 w160 h275 center, MAIN GUI
	Gui, settings:Add, Edit, xp+5 ys-5 w150 h30 Center vbHeight, % settings.mainGui.buttonHeight
	Gui, settings:Add, Edit, xp y+5 wp hp Center vbWidth, % settings.mainGui.buttonWidth
	Gui, settings:Add, Edit, xp y+5 wp hp Center vbSpacing, % settings.mainGui.buttonSpacing
	
	Gui, settings:Add, ComboBox, xp y+10 wp hp r6 0x100 Center vtFont, % GetFontList(settings.mainGui.textFont)
	Gui, settings:Add, ComboBox, xp y+10 wp hp r2 0x100 Center vtBold, 400|700
		GuiControl, settings:ChooseString, tBold, % settings.mainGui.textBold
	Gui, settings:Add, Edit, xp y+10 wp hp Center vtSize, % settings.mainGui.textSize
	Gui, settings:Add, Button, xp y+5 wp h30 Center vguiColor gGuiColor, % settings.mainGui.guiBackColor
	
	Gui, settings:Add, GroupBox, x+10 y35 w160 h275 center, SIDE GUI
	Gui, settings:Add, Edit, xp+5 ys-5 w150 h30 Center vsbHeight, % settings.sideGui.buttonHeight
	Gui, settings:Add, Edit, xp y+5 wp hp Center vsbWidth, % settings.sideGui.buttonWidth
	Gui, settings:Add, Edit, xp y+5 wp hp Center vsbSpacing, % settings.sideGui.buttonSpacing
	Gui, settings:Add, ComboBox, xp y+10 wp hp r6 0x100 Center vstFont, % GetFontList(settings.sideGui.textFont)
	Gui, settings:Add, ComboBox, xp y+10 wp hp r2 0x100 Center vstBold, 400|700
		GuiControl, settings:ChooseString, stBold, % settings.sideGui.textBold
	Gui, settings:Add, Edit, xp y+10 wp hp Center vstSize, % settings.sideGui.textSize
	Gui, settings:Add, Button, xp y+5 wp h30 Center vsguiColor gGuiColor, % settings.sideGui.guiBackColor
	
	Gui, settings:Add, GroupBox, x+10 y35 w160 h275 center, SLR GUI
	Gui, settings:Add, Edit, xp+5 ys-5 w150 h30 Center vslrbHeight, % settings.SLRGui.buttonHeight
	Gui, settings:Add, Edit, xp y+5 wp hp Center vslrbWidth, % settings.SLRGui.buttonWidth
	Gui, settings:Add, Edit, xp y+5 wp hp Center vslrbSpacing, % settings.SLRGui.buttonSpacing
	Gui, settings:Add, ComboBox, xp y+10 wp hp r6 0x100 Center vslrtFont, % GetFontList(settings.SLRGui.textFont)
	Gui, settings:Add, ComboBox, xp y+10 wp hp r2 0x100 Center vslrtBold, 400|700
		GuiControl, settings:ChooseString, slrtBold, % settings.SLRGui.textBold
	Gui, settings:Add, Edit, xp y+10 wp hp Center vslrtSize, % settings.SLRGui.textSize
	Gui, settings:Add, Button, xp y+5 wp h30 Center vslrguiColor gGuiColor, % settings.SLRGui.guiBackColor
	;}
	
	;{```` Colors / Add-ons Tab Controls  ````}
	Gui, settings:Tab, Colors / Add-ons
	Gui, settings:Add, GroupBox, x5 y35 w335 h200 Center, DEFAULT BUTTON COLORS
	Gui, settings:Add, Text, xp+5 yp+30 w160 h30 Section, Back Color
	Gui, settings:Add, Text, xp y+5 wp hp, Text Color
	Gui, settings:Add, Text, xp y+5 wp hp, Highlight Back Color
	Gui, settings:Add, Text, xp y+5 wp hp, Highlight Text Color
	Gui, settings:Add, Button, x+15 ys-5 w150 h30 Center vBackColor gGuiColor, % ButtonList.Default.BackColor
	Gui, settings:Add, Button, xp y+5 wp h30 Center vTextColor gGuiColor,  % ButtonList.Default.TextColor
	Gui, settings:Add, Button, xp y+5 wp h30 Center vHLBackColor gGuiColor,  % ButtonList.Default.HLBackColor
	Gui, settings:Add, Button, xp y+5 wp h30 Center vHLTextColor gGuiColor,  % ButtonList.Default.HLTextColor
	Gui, settings:Add, CheckBox, xs+5 y+5 w310 hp vChangeDefaults, Update all buttons to default colors now?
	
	Gui, settings:Add, GroupBox, x+20 y35 w325 h230 Center, MAIN GUI ADD-ONS
	Gui, settings:Add, CheckBox, xp+5 yp+25 w310 h30 Section vmainSearch, Show Search Bar on Main Gui?
		GuiControl, settings:, mainSearch, % settings.search.search ? 1 : 0
	Gui, settings:Add, Text, xp y+10 w125 h30, Search Bar Text:
	Gui, settings:Add, Edit, x+5 yp-5 w185 h30 Center vmainSearchText, % settings.search.backText
	Gui, settings:Add, Text, xs y+10 h30, Search Bar Height:
	Gui, settings:Add, Edit, x+5 yp-5 w50 h30 vmainSearchHeight, % settings.search.height
	Gui, settings:Add, Text, xs y+10 h30 w125, Go Button Width:
	Gui, settings:Add, Edit, x+5 yp-5 w50 h30 vmainSearchGoWidth, % settings.search.goWidth
	Gui, settings:Add, CheckBox, xs y+10 w310 hp vmainFooter, Show Footer on Main Gui?
		GuiControl, settings:, mainFooter, % settings.footer.footer ? 1 : 0
	;}
	
	;{````  The Closer Tab Controls  ````}
	Gui, settings:Tab, The Closer
	
	Gui, settings:Add, Text, x10 y45 w100 h30 Section, Closer Hotkey
	Gui, settings:Add, Edit, x+5 ys-5 w215 hp vcloserHotkey, % settings.theCloser.hotkey
	Gui, settings:Add, GroupBox, x5 y+6 w330 h240 Center, DISABLE THE CLOSER
	Gui, settings:Add, Text, xp+5 yp+25 w320 h30 Center, The Closer is disabled for the following items:
	
	cList :=
	for key, value in settings.theCloser.disableIfActive
		cList := (cList = "" ? "" : cList "|") value
	Gui, settings:Add, ListBox, xp y+5 w320 h150 vcloserDisable hwndHcloserDisable, %cList%
	Gui, settings:Add, Button, xs+45 y+5 w100 h30 gaddCloserDisable, Add
	Gui, settings:Add, Button, x+25 yp wp hp gremCloserDisable, Remove
	
	Gui, settings:Add, GroupBox, x340 y35 w330 h280 Center, TAB CLOSER
	Gui, settings:Add, Text, xp+5 yp+25 w320 h35 Wrap Center Section, The Closer will close a tab instead of the window for the following items:
	
	dList :=
	for key, value in settings.theCloser.closeTabIfActive
		dList := (dList = "" ? "" : dList "|") value
	Gui, settings:Add, ListBox, xp y+7 wp h190 vCloserTabs hwndHcloserTabs, %dList%
	Gui, settings:Add, Button, xs+45 y+5 w100 h30 gaddCloserTabs, Add
	Gui, settings:Add, Button, x+25 yp w100 hp gremCloserTabs, Remove
	;}
	
	;{````  Main GUI Controls  ````}
	Gui, settings:Tab
	
	Gui, settings:Add, Button, x210 y325 w100 h30 gallSet Default, ALL SET
	Gui, settings:Add, Button, x+50 yp wp hp gsettingsCancel, CANCEL
	;}
	
	Gui, settings:Show, Center, c0bra settings
	Return
}

allSet:
	Gui, settings:Submit
	
	settings.mainHotkey.mainHotkey := mainTrigger
	settings.mainHotkey.holdAction := mainHoldTrigger
	
	ControlGet, disableTriggerList, List,,, ahk_id %HdisableIfActive%
	settings.mainHotkey.disableIfActive := [] 
	Loop, Parse, disableTriggerList, `n
		settings.mainHotkey.disableIfActive[A_Index] := A_LoopField
	
	ControlGet, userHotkeysList, List,,, ahk_id %HuserHotkeys%
	settings.userHotkeys := []
	Loop, Parse, userHotkeysList, `n
	{
		Loop, Parse, A_LoopField, `t
		{
			if (A_Index = 1)
				aKey := A_LoopField
			else
				aValue := A_LoopField
		}
		settings.userHotkeys[aKey] := aValue
	}
	
	settings.mainGui.buttonHeight := bHeight
	settings.mainGui.buttonSpacing := bSpacing
	settings.mainGui.buttonWidth := bWidth
	GuiControlGet, aGuiColor, settings:, guiColor
	settings.mainGui.guiBackColor := aGuiColor
	settings.mainGui.textBold := tBold
	settings.mainGui.textFont := tFont
	settings.mainGui.textSize := tSize
	
	settings.search.Height := bHeight
	settings.search.textBold := tBold
	settings.search.textFont := tFont
	;;~ settings.search.textSize := tSize
	
	settings.sideGui.buttonHeight := sbHeight
	settings.sideGui.buttonSpacing := sbSpacing
	settings.sideGui.buttonWidth := sbWidth
	GuiControlGet, aSGuiColor, settings:, sguiColor
		settings.sideGui.guiBackColor := aSGuiColor
	settings.sideGui.textBold := stBold
	settings.sideGui.textFont := stFont
	settings.sideGui.textSize := stSize
	
	settings.SLRGui.buttonHeight := slrbHeight
	settings.SLRGui.buttonSpacing := slrbSpacing
	settings.SLRGui.buttonWidth := slrbWidth
	GuiControlGet, aSLRGuiColor, settings:, slrguiColor
	settings.SLRGui.guiBackColor := aSLRGuiColor
	settings.SLRGui.textBold := slrtBold
	settings.SLRGui.textFont := slrtFont
	settings.SLRGui.textSize := slrtSize
	
	GuiControlGet, BackColorText, settings:, BackColor
		Buttons.Defaults.BackColor := BackColorText
	GuiControlGet, TextColorText, settings:, TextColor
		Buttons.Defaults.TextColor := TextColorText
	GuiControlGet, HLBackColorText, settings:, HLBackColor
		Buttons.Defaults.HLBackColor := HLBackColorText
	GuiControlGet, HLTextColorText, settings:, HLTextColor
		Buttons.Defaults.HLTextColor := HLTextColorText
	
	if (ChangeDefaults)
	{				
		for key, value in buttons
		{
			tempButton := value.text
			ButtonList.Insert(value.text, value)
			
			GuiControlGet, BackColorText, settings:, BackColor
				buttons[key].BackColor := BackColorText
			GuiControlGet, TextColorText, settings:, TextColor
				buttons[key].TextColor := TextColorText
			GuiControlGet, HLBackColorText, settings:, HLBackColor
				buttons[key].HLBackColor := HLBackColorText
			GuiControlGet, HLTextColorText, settings:, HLTextColor
				buttons[key].HLTextColor := HLTextColorText
		}
	}
	
	settings.search.search := mainSearch ? 1 : 0
	settings.search.backText := mainSearchText
	settings.search.height := mainSearchHeight
	settings.search.goWidth := mainSearchGoWidth
	settings.footer.footer := mainFooter ? 1 : 0
	
	settings.theCloser.hotkey := closerHotkey
	
	ControlGet, disableCloserList, List,,, ahk_id %HcloserDisable%
	settings.theCloser.disableIfActive := []
	Loop, Parse, disableCloserList, `n
		settings.theCloser.disableIfActive[A_Index] := A_LoopField
	
	ControlGet, closerTabList, List,,, ahk_id %HcloserTabs%
	settings.theCloser.closeTabIfActive := []
	Loop, Parse, closerTabList, `n
		settings.theCloser.closeTabIfActive[A_Index] := A_LoopField
	
	ButtonList := []
	JSON_Save(buttons, files.user.Buttons)
	JSON_save(settings, files.user.settings)
	Buttons := []
	
	Gui, settings:Destroy
	quickReload("GUI settings Updated...")
return



settingsGuiClose:
settingsGuiEscape:
settingsCancel:
	Gui, settings:Destroy
	Buttons := []
return



addTriggerDisable:
	Gui settings: +OwnDialogs
	
	InputBox, aTriggerDisable, c0bra Disable Trigger, Type or paste the window title or program that will disable c0bra from opening.`n`nExample: ahk_exe chrome.exe`n- If Chrome was active`, the main trigger would be disabled.
	if (ErrorLevel)
		return
	if (aTriggerDisable = "")
	{
		MsgBox, 4112, c0bra Disable Trigger, No window or class input was found.  Please try again.
		return
	}
	;TODO - figure out if this disable if active already exists
	 
	 GuiControl, settings:, disableIfActive, % aTriggerDisable
return



remTriggerDisable:
	Gui settings: +OwnDialogs
	
	GuiControl, settings:+AltSubmit, disableIfActive
	GuiControlGet, aDisableRemovePos, settings:, disableIfActive
	if (Errorlevel)
		return
	if (aDisableRemovePos = "")
	{
		MsgBox, 4144, c0bra Disable Trigger, No window or class was selected.`n`nPlease select an item to remove from the Disable If Active list and try again.
		return
	}
	
	GuiControl, settings:-AltSubmit, disableIfActive
	GuiControlGet, aDisableRemove, settings:, disableIfActive
	
	MsgBox, 4129, c0bra Disable Trigger, Are you sure you want to remove `"%aDisableRemove%`" from the Disable If Active List?
	IfMsgBox Cancel
		return
	
	Control, Delete, %aDisableRemovePos%,, ahk_id %HdisableIfActive%
return



addUserHotkey:
	Gui settings: +OwnDialogs
	
	InputBox, anewHotkey, c0bra User Hotkeys, What is the new Hotkey?`n`nExample: ^+1`n-This hotkey would be ctrl + shift + 1
	if (ErrorLevel)
		return
	if (anewHotkey = "")
	{
		MsgBox, 4112, c0bra User Hotkeys, No hotkey was entered.  Please try again.
		return
	}
	;TODO - figure out if this user hotkey already exists
	
	InputBox, anewHotkeyAction, c0bra User Hotkeys, What will the %anewHotkey% hotkey do?`n`nExample: [F] quickReload`n-This would find the function `"quickReload`" and run it.
	if (ErrorLevel)
		return
	if (anewHotkeyAction = "")
	{
		MsgBox, 4112, c0bra User Hotkeys, No hotkey action was entered.  Please try again.
		return
	}
	
	GuiControl, settings:, userHotkeys, % anewHotkey "`t" anewHotkeyAction
return



remUserHotkey:
	Gui settings: +OwnDialogs
	
	GuiControl, settings:+AltSubmit, userHotkeys
	GuiControlGet, aHotkeyRemovePos, settings:, userHotkeys
	if (Errorlevel)
		return
	if (aHotkeyRemovePos = "")
	{
		MsgBox, 4144, c0bra User Hotkeys, No user hotkey was selected.`n`nPlease select an item to remove from the User Hotkeys list and try again.
		return
	}
	
	GuiControl, settings:-AltSubmit, userHotkeys
	GuiControlGet, aHotkeyRemove, settings:, userHotkeys
	
	MsgBox, 4129, c0bra User Hotkeys, Are you sure you want to remove `"%aHotkeyRemove%`" from the User Hotkeys List?
	IfMsgBox Cancel
		return
	
	Control, Delete, %aHotkeyRemovePos%,, ahk_id %HuserHotkeys%
return



addCloserDisable:
	Gui settings: +OwnDialogs
	
	InputBox, aCloserDisable, c0bra Disable Closer, Type or paste the window title or program that will disable c0bra's closer from running.`n`nExample: ahk_exe chrome.exe`n- If Chrome was active`, the closer would be disabled.
	if (ErrorLevel)
		return
	if (aCloserDisable = "")
	{
		MsgBox, 4112, c0bra Disable Closer, No window or class input was found.  Please try again.
		return
	}
	;TODO - figure out if this disable if active already exists
	 
	 GuiControl, settings:, closerDisable, % aCloserDisable
return



remCloserDisable:
	Gui settings: +OwnDialogs
	
	GuiControl, settings:+AltSubmit, closerDisable
	GuiControlGet, aCloserRemPos, settings:, closerDisable
	if (Errorlevel)
		return
	if (aCloserRemPos = "")
	{
		MsgBox, 4144, c0bra Disable Closer, No window or class was selected.`n`nPlease select an item to remove from the Disable Closer list and try again.
		return
	}
	
	GuiControl, settings:-AltSubmit, closerDisable
	GuiControlGet, aCloserRem, settings:, closerDisable
	
	MsgBox, 4129, c0bra Disable Closer, Are you sure you want to remove `"%aCloserRem%`" from the Disable Closer List?
	IfMsgBox Cancel
		return
	
	Control, Delete, %aCloserRemPos%,, ahk_id %HcloserDisable%
return



addCloserTabs:
	Gui settings: +OwnDialogs
	
	InputBox, aCloserTabs, c0bra Closer Tabs, Type or paste the window title or program that c0bra's closer will close tabs instead of windows.`n`nExample: ahk_exe chrome.exe`n- If Chrome was active`, the closer would close the active tab.
	if (ErrorLevel)
		return
	if (aCloserTabs = "")
	{
		MsgBox, 4112, c0bra Closer Tabs, No window or class input was found.  Please try again.
		return
	}
	;TODO - figure out if this disable if active already exists
	 GuiControl, settings:, closerTabs, % aCloserTabs
return



remCloserTabs:
	Gui settings: +OwnDialogs
	GuiControl, settings:+AltSubmit, closerTabs
	GuiControlGet, aCloserTabRemPos, settings:, closerTabs
	if (Errorlevel)
		return
	if (aCloserTabRemPos = "")
	{
		MsgBox, 4144, c0bra Closer Tabs, No window or class was selected.`n`nPlease select an item to remove from the Closer Tabs list and try again.
		return
	}	
	GuiControl, settings:-AltSubmit, closerTabs
	GuiControlGet, aCloserTabs, settings:, closerTabs
	MsgBox, 4129, c0bra Closer Tabs, Are you sure you want to remove `"%aCloserTabs%`" from the Closer Tabs List?
	IfMsgBox Cancel
		return
	Control, Delete, %aCloserTabRemPos%,, ahk_id %HcloserTabs%
return



guiColor:
	aGuisettings := 1
	ColorButton := A_GuiControl
	ColorGui()
return
