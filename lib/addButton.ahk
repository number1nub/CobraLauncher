addButton(aText, CMD="", typeCmd="", argsCmd="", aColor="", Children=0, aParent=0) {
	global buttons
	buttonKey := buttons.maxindex() + 1
	buttons[buttonKey] := {}
	buttons[buttonKey].Text	:= aText
	if (CMD) {
		buttons[buttonKey].Cmd		:= {}
		buttons[buttonKey].Cmd.Type:= typeCmd
		buttons[buttonKey].Cmd.Arg	:= argsCmd
	}	
	buttons[buttonKey].BackColor 	:= aColor[1]
	buttons[buttonKey].TextColor 	:= aColor[2]
	buttons[buttonKey].HlBackColor := aColor[3]
	buttons[buttonKey].HlTextColor := aColor[4]	
	if (Children)
		buttons[buttonKey].Children := []		
	if (aParent) {
		buttons[buttonKey].Level := 1		
		for parentKey, value in buttons
			if (value.text = aParent)
				buttons[parentKey].Children.Insert(aText)
	}	
	JSON_Save(buttons, files.user.Buttons)
}