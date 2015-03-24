CopyToNotepad() {
	try selText := GetSelection()
	catch e {
		msgbox % e
		return
	}
	noteFilePath := A_Temp "\CopyToNotepad.txt"
	noteFileObj := FileOpen(noteFilePath, "w")	
	if (!IsObject(noteFileObj)) {
		msgbox Failed to create temp text file in user's temp folder...
		return
	}
	noteFileObj.Write(selText)
	noteFileObj.Close()
	try Run, %noteFilePath%	
	catch {
		m("Failed to run the created text file...", "ico:!")
	}
	noteFileObj := ""
}