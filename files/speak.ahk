if main_message
	speak(main_message)

processExist() {
	Process, Exist, jfw.exe
	If (ErrorLevel) {
		JAWS := ComObjCreate("FreedomSci.JawsApi")
		return JAWS
	} else {
		return False
	}
}

Speak(Str) {
	jaws := processExist()
	if (jaws) {
		jaws.SayString(Str)
	} else {
		return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_speakText", "wstr", Str)
	}
}

mute() {
	jaws := processExist()
	if (jaws) {
		jaws.RunFunction("speechoff")
	} else {
		return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_cancelSpeech")
	}
}
