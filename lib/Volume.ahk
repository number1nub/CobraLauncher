Volume(dwn = 0) {
	SoundSet, % dwn ? "-5" : "+5"
	SoundGet, curVol
	TrayTip, Volume, % round(curVol), 1
}