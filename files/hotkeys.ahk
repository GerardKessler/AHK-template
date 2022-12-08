IfNotExist, files\hotkeys.ini
	fileCreate()
else
	fileRead()

fileCreate() {
	global hks
	for k, value in hks
		iniWrite,% value[1], files\hotkeys.ini,% value[2], hk
	fileRead()
}

fileRead() {
	iniRead, iniContent, files\hotkeys.ini
	for i, key in strSplit(iniContent, "`n")
	{
		iniRead, hk, files\hotkeys.ini,% key, hk
		hotkey,% hk,% key, on
	}
}

commands(row:=1) {
	global hks, lang
	gui, List:Default
	Gui, List:Add, ListView,, Comando|Atajo
	iniRead, file, files\hotkeys.ini
	for i, key in strSplit(file, "`n")
	{
		iniRead, value, files\hotkeys.ini,% key, hk
		value := strReplace(value, "^", "Control, ")
		value := strReplace(value, "#", "Windows, ")
		value := strReplace(value, "+", "shift, ")
		value := strReplace(value, "!", "alt, ")
		value := strReplace(value, "home", "inicio")
		value := strReplace(value, "end", "fin")
		value := strReplace(value, "PgUp", "avance de página")
		value := strReplace(value, "PgDn", "retroceso de página")
		value := strReplace(value, "right", "flecha derecha")
		value := strReplace(value, "left", "flecha izquierda")
		value := strReplace(value, "up", "flecha arriba")
		value := strReplace(value, "down", "flecha abajo")
		LV_Add("", hks[i][3], value)
	}
	LV_Modify(row, "Focus")
	LV_Modify(row, "Select")
	gui, List:add, button, gConfig, Cambiar el atajo
	gui, List:add, button, gClose, Cerrar
	gui, list:show,, Lista de comandos
}

close() {
	gui, list:destroy
}

config() {
	global oldHK, newHK, hks, fila, lang
	fila := lv_getNext()
	iniRead, oldHK, files\hotkeys.ini,% hks[fila][2], hk
	gui, list:destroy
	gui, config:default
	gui, config:add, text,, Nuevo atajo de teclado
	gui, config:add, hotKey, vnewHK,% oldHK
	gui, config:add, button, gSave, Guardar cambios
	gui, config:add, button, gCancel, Cancelar
	gui, config:show,, Configuraciones
}

save() {
	global newHK, oldHK, hks, fila, lang
	gui, config:submit, hide
	if newHK
	{
		iniWrite,% newHK, files\hotkeys.ini,% hks[fila][2], hk
		hotkey,% oldHK,% hks[fila][2], off
		hotkey,% newHK,% hks[fila][2], on
		gui, config:destroy
		fileRead()
		commands(fila)
	} else {
		msgBox, 0, Atención, Este campo no puede quedar vacío, por favor ingrese un atajo.
		gui, show,, Configuración
	}
}

cancel() {
	gui, config:destroy
}

ConfigGuiEscape:
ListGuiEscape:
Gui, Config:Destroy
Gui, List:Destroy
return