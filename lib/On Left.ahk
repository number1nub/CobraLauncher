On_Left(CONTROL_POSX) {
	global
	MIDPOINT := ((2 * buttonWidth) + (3 * buttonSpacing)) / 2
	return (CONTROL_POSX < MIDPOINT) ? 1 : 0
}