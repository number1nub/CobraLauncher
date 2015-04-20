Execute(command, Txt="") {
	If (!command)
		return
	command := RegExReplace(command, "\s+", " ")
	RegExMatch(command, ";\K.+?$", Description)	; Get comment/description from in-line comment
	command := RegExReplace(command, ";" Description "$")
	command := Trimmer((Description && ReturnDescription) ? Description : command)
	Transform, command, Deref, % command

	;[F] FUNCTION AS ACTION
	If (RegExMatch(command, "i)^\[F\]\s(?P<Func>\w+)(\(\s*(?P<Params>.+?)\s*\))?", m) && IsFunc(mFunc)) {
		If mParams {
			Loop, Parse, mParams, CSV
				param%A_Index% := Trimmer(A_LoopField)
		}			
		Gui, 1:Destroy
		%mFunc%(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	}
	
	;[L] LABEL AS ACTION
	else If (RegExMatch(command, "i)^\[L\]\s\K.+", Label) && IsLabel(Label)) {
		Gui, 1:Destroy
		Gosub, %LABEL%
	}

	;[S] SEND AS ACTION
	else If RegExMatch(Command, "i)^\[S\]\s*\K.+", macro) {
		Gui, Destroy
		Gui, 1:Destroy
		SendInput, {Blind}%macro%
	}

	; [R] RUN AS ACTION
	else if RegExMatch(command, "i)^\[R\]\s*\K.+", runPath) {
		Gui, 1:Destroy
		try
			Run, % ExpandEnv(runPath)
		catch e
			m("Error with this command!", ExpandEnv(runPath), e.message, "ico:x")
	}
	
	;[P] PROGRAM AS ACTION
	else if RegExMatch(command, "i)^\[P\]\s*\K.+", theProgram) {
		Gui, 1:Destroy
		TMM := A_TitleMatchMode
		SetTitleMatchMode, 2
		SplitPath, theProgram, programName,,,programNameNoExt
			
		Process, Exist, % programName ".exe"
		if (!ErrorLevel)
			Process, Exist, % programName " *32.exe"

		If (WinExist(programNameNoExt) || ErrorLevel) {
			WinShow, %programNameNoExt% ahk_pid %ErrorLevel%
			WinActivate, %programNameNoExt% ahk_pid %ErrorLevel%
			WinRestore, %programNameNoExt% ahk_pid %ErrorLevel%
		}
		else {
			try
				Run, % ExpandEnv(theProgram)
			catch e
				m("Error with this command!", ExpandEnv(theProgram), e.message, "ico:x")
		}

		SetTitleMatchMode, %TMM%
	}
		
	; SIDE GUI AS ACTION
	else
		SIDE_GUI()
}