SideButtonPress() {
	global ChildrenList
	Next_Kill := A_GUI + 1
	TMM := A_TitleMatchMode
	SetTitleMatchMode, 3
	if (!WinExist(A_GuiControl))
		GUI, %NEXT_KILL%:Destroy ; kill GUI 2 before in case another GUI is selected
	SetTitleMatchMode, %TMM%
	WinGetActiveTitle, A_TITLE
	if (A_TITLE = "Bookmarks") {
		MyFavs := A_MyDocuments "\..\Favorites\Links"
		Run, % MyFavs "\" A_GuiControl ".url"
		GUI, 1:Destroy
		return
	}
	Execute("[" ChildrenList[A_GuiControl].Cmd.Type "] " childrenList[A_GuiControl].Cmd.Arg, ChildrenList[A_GuiControl].Text)
}