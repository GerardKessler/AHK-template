; especificamos los atajos y las etiquetas o funciones asociadas en un array simple con los elementos separados por comas
hks := ["+q,CerrarElScript"
,"f3,grave"
,"f2,medio"
,"f1,agudo"
,"+f1,AbrirLaListaDeComandos"]

; variable opcional para verbalizar algo al inicio
main = script iniciado

; Incluímos los módulos necesarios
#include hks\hotkeys.ahk
#include hks\gui.ahk
#include tts\speak.ahk
return

;todo el código del script

agudo:
soundBeep, 1760, 15
return

medio:
soundBeep, 880, 15
return

grave:
soundBeep, 440, 15
return

CerrarElScript:
speak("script finalizado")
sleep 1000
exitApp