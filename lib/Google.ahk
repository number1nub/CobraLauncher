Google(GSEARCH) {
	goUrl := GSEARCH~="i)\.(.{1,4})$" ? GSEARCH : "http://google.com/search?q=" RegExReplace(RegExReplace(RegExReplace(GSEARCH, "#", "%23"), "&", "%26"), "\s", "+")
	Run % "chrome.exe " goUrl
}