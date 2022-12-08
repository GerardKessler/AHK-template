; especificamos el atajo, la etiqueta o función asociada, y la descripción del comando  en un array simple con los elementos entre comillas y separados por comas
hks := Array()
hks[1] := ["^+q", "exit", "Cerrar el script"]
hks[2] := ["^+n", "notepad", "Abrir el bloc de notas"]
hks[3] := ["^+r", "reaper", "Abrir el sitio gera.ar"]
hks[4] := ["^+s", "suspend", "Suspender y reactivar el script"]
hks[5] := ["^+f1", "commands", "Abrir la lista de comandos"]

; variable opcional para verbalizar algo al inicio
main_message:= "Script iniciado"

; Menú de la bandeja de sistemas con los idiomas y los elementos a gusto
Menu, Tray, NoStandard    ;Quitamos los botones por defecto del menú
Menu, Tray, Tip, AHK_Template    ;colocamos un nombre para el ícono

Menu, idioma, Add, Spanish, setLanguage
Menu, idioma, Add, English, setLanguage
Menu, idioma, Add, French, setLanguage
Menu, Tray, Add, Language, :idioma

Menu, Tray, Add, Cerrar el script, exit

; Incluímos los módulos necesarios
#include files\speak.ahk
#include files\hotkeys.ahk
return

;Función que escribe en el archivo settings.ini el idioma seleccionado en el menú
setLanguage(ItemName) {
	global lang_list
	IniWrite,% lang_list[ItemName], files\settings.ini, language, value
	reload
}

;todo el código del script utilizando las etiquetas especificadas en la lista de la variable hks

reaper:
run http://gera.ar
return

notepad:
run notepad
return

suspend:
suspend
speak((t:=!t)?"Script suspendido" : "Script reactivado")
return

exit:
speak("Script finalizado")
sleep 1000
exitApp