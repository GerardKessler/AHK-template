jaws := ComObjCreate("FreedomSci.JawsApi")
sapi := ComObjCreate("Sapi.SpVoice")

Speak(Str) {
	global jfw, sapi
	Process, Exist, jfw.exe
	if (ErrorLevel) {
		Jaws.SayString(Str)
		return
	}
	process, exist, nvda.exe
	if (ErrorLevel) {
		return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_speakText", "wstr", Str)
		return
	}
	sapi.speak(str)
}

mute() {
	global jfw
	Jaws := ComObjCreate("FreedomSci.JawsApi")
	Jaws.RunFunction("speechoff")
	return DllCall("files\nvdaControllerClient" A_PtrSize*8 ".dll\nvdaController_cancelSpeech")
}
