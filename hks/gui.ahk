listaDeComandos(fila:=1) {
	gui, List:Default
	Gui, List:Add, ListView,, Comando|Atajo: 
	iniRead, file, hks\config.ini
	loop, parse, file, `n`r
		{
		iniRead, content, hks\config.ini,% a_loopField, hk
		content := strReplace(content, "^", "control, ")
		content := strReplace(content, "+", "shift, ")
		content := strReplace(content, "!", "alt, ")
		content := strReplace(content, "home", "inicio")
		content := strReplace(content, "end", "fin")
		content := strReplace(content, "PgUp", "Avance de página")
		content := strReplace(content, "PgDn", "Retroceso de página")
		content := strReplace(content, "right", "Flecha derecha")
		content := strReplace(content, "left", "Flecha izquierda")
		content := strReplace(content, "up", "Flecha arriba")
		content := strReplace(content, "down", "Flecha abajo")
		LV_Add("",a_loopField,content)
		}
	LV_Modify(fila, "Focus")
	LV_Modify(fila, "Select")
	gui, List:add, button, gConfig, Cambiar el atajo de teclado
	gui, List:add, button, gClose, Cerrar
	gui, list:show,, Lista de comandos
	}

close() {
	gui, list:destroy
	}

config() {
	global oldHK, newHK, comando, fila
	fila := lv_getNext()
	lv_getText(comando, fila)
	iniRead, oldHK, hks\config.ini, %comando%, hk
	gui, list:destroy
	gui, config:default
	gui, config:add, text,, Ingresa un nuevo atajo de teclado
	gui, config:add, hotKey, vnewHK, %oldHK%
	gui, config:add, button, gSave, Guardar los cambios
	gui, config:add, button, gCancel, Cancelar
	gui, config:show,, Configuración
	}

save() {
	global newHK, oldHK, comando, fila
	gui, config:submit, hide
	if newHK
		{
		iniWrite, %newHK%, hks\config.ini, %comando%, hk
		hotkey, %oldHK%, %comando%, off
		hotkey, %newHK%, %comando%, on
		gui, config:destroy
		fileRead()
		listaDeComandos(fila)
	} else {
		msgBox, 0, Atención; , Este campo no puede quedar vacío, por favor ingrese un atajo.
		gui, show,, Configuración
		}
	}

cancel() {
	gui, config:destroy
}