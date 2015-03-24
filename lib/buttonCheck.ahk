buttonCheck(jObject, bName) {
	for key, value in jObject
		if (value.text = bName)
		{
			MsgBox, 4113, c0bra Button Namer, The button %newName% already exists.`n`nChoose another name that does not exist.
			IfMsgBox OK
				return 1
		}
}