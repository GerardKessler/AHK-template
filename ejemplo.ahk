;Agregamos los idiomas. La clave es el nombre del MenuItem, y el valor el prefijo del idioma
lang_list := {}
lang_list["Spanish"] := "ES"
lang_list["English"] := "EN"
lang_list["French"] := "FR"

;Creamos el array asociativo con todas las cadenas del archivo strings.ini
lang := {}
IniRead, lang_ini_content, files\strings.ini
IniRead, lang_value, files\settings.ini, language, value
for i, key in StrSplit(lang_ini_content, "`n")
{
	IniRead, string, files\strings.ini,% key,% lang_value
	lang[key] := string
}

; especificamos el atajo, la etiqueta o función asociada, y la descripción del comando  en un array simple con los elementos entre comillas y separados por comas
hks := Array()
hks[1] := ["^+q", "exit", lang["close_script"]]
hks[2] := ["^+n", "notepad", lang["notepad"]]
hks[3] := ["^+r", "reaper", lang["gera.ar"]]
hks[4] := ["^+s", "suspend", lang["suspend"]]
hks[5] := ["^+f1", "commands", lang["command_list"]]

; variable opcional para verbalizar algo al inicio
main := lang["script_open"]

; Menú de la bandeja de sistemas con los idiomas y los elementos a gusto
Menu, Tray, NoStandard    ;Quitamos los botones por defecto del menú
Menu, Tray, Tip, AHK_Template    ;colocamos un nombre para el ícono

Menu, idioma, Add, Spanish, setLanguage
Menu, idioma, Add, English, setLanguage
Menu, idioma, Add, French, setLanguage
Menu, Tray, Add, Language, :idioma

Menu, Tray, Add,% lang["close_script"], exit

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
speak((t:=!t)? lang["script_disabled"] : lang["script_enabled"])
return

exit:
speak(lang["script_close"])
sleep 1000
exitApp