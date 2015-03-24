UpdateVer(newVal) {
	settings.Version := newVal
	JSON_Save(settings, files.user.settings)
	QuickReload("Cobra is running...","Cobra Version " newVal)
}