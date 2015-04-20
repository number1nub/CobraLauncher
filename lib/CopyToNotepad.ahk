CopyToNotepad() {
	try selText := GetSelection()
	catch e {
		m(e)
		return
	}
	noteFilePath := A_Temp "\CopyToNotepad.txt"
	noteFileObj := FileOpen(noteFilePath, "w")	
	if (!IsObject(noteFileObj)) {
		m("Failed to create temp text file in user's temp folder...", "ico:!")
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