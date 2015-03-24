deleteButton(aText) {
	global buttons
	for key, value in buttons	;Del button
		if (value.Text = aText)
		{
			if (value.Children[1])
			{
				MsgBox, 4148, Remove Button, The <%aText%> button has buttons in it.  Deleting the <%aText%> button will remove these buttons as well.`n`nAre you sure you want to delete the <%aText%> button?
				ifmsgbox No
					return
			}
			buttons.Remove(key)
		}
	for key, value in buttons	;Del from parent
		for childKey, childValue in value.Children
			if (childValue = aText)
				value.Children.Remove(childKey)	
	JSON_Save(buttons, files.user.Buttons)
}