if main_message
	speak(main_message)

processExist() {
	Process, Exist, jfw.exe
	If (ErrorLevel) {
		if (!JAWS)
			return ComObjCreate("FreedomSci.JawsApi")
	} else {
		return False
	}
}

Speak(Str) {
	global JAWS := processExist()
	if (JAWS) {
		jaws.SayString(Str)
	} else {
		return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_speakText", "wstr", Str)
	}
}

mute() {
	JAWS := processExist()
	if (JAWS) {
		JAWS.RunFunction("speechoff")
	} else {
		return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_cancelSpeech")
	}
}
