; especificamos el atajo, la etiqueta o función asociada, y la descripción del comando  en un array simple con los elementos entre comillas y separados por comas
hks := [["^+q", "exit", "Cierra el script"]
,["^+n", "notepad", "Abrir el block de notas"]
,["^+r", "reaper", "Abrir la página de reaper y otras yerbas"]
,["^+s", "suspend", "Suspender y reanudar el script"]
,["^+f1", "commands", "Abrir la lista de comandos"]]

; variable opcional para verbalizar algo al inicio
main = script iniciado

; Incluímos los módulos necesarios
#include hks\hotkeys.ahk
#include hks\gui.ahk
#include tts\speak.ahk
return

;todo el código del script utilizando las etiquetas especificadas en la lista de la variable hks

reaper:
run http://ReaperYOtrasYerbas.com
return

notepad:
run notepad
return

suspend:
suspend
speak((t:=!t)? "Script suspendido" : "Script reanudado")
return

exit:
speak("script finalizado")
sleep 1000
exitApp