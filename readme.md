﻿# AHK-template

Esta es una plantilla de script pensada para facilitar la gestión de atajos de teclado del script, crear cadenas traducibles, y las verbalizaciones de los lectores de pantalla principales como NVDA y Jaws.
Con solo crear un array con la lista de los atajos y sus correspondientes acciones asociadas, e importar los módulos necesarios ya tendrán la ventana con la lista de comandos y las funciones de modificación de los atajos.
En la carpeta podrán encontrar un archivo llamado "ejemplo.ahk", el cual tiene un código base con comentarios para  utilizarlo como guía.
nota:  
Es conveniente tener instalado AutoHotkey en su versión de 32 bits, para no tener problemas con el uso del controlador de NVDA. Si instalamos la versión de 32, este va a funcionar en ambos sistemas. 
En este repositorio existe otra rama llamada "simple", la cual no contiene el código de las cadenas traducibles, para simplificar el código si no se necesita la traducción.

## Gestión de atajos de teclado

El módulo llamado "hotkeys.ahk" hubicado dentro de la carpeta files, verifica la existencia del archivo config.ini dentro de la carpeta hks.  
Si el archivo no existe, lanza la función "fileCreate" que itera entre los elementos del array especificado en el script principal y crea el archivo con esos datos, llamadno al finalizar  a la función "fileRead".  
Si el archivo existe se dispara la función "fileRead", la cual lee el archivo, e itera entre su contenido para activar los atajos de teclado con sus etiquetas o funciones asociadas.  
Cuando llamamos a la función "commands" se realiza otra lectura del archivo ini para crear la ventana gui con la lista de comandos, especificando como descripción el tercer elemento del array hks de cada elemento así como botones para cerrar la ventana y modificar el atajo de teclado.  

## Lectores de pantalla:

Esta plantilla también incluye otro módulo llamado "speak.ahk" dentro de la carpeta files, el cual contiene 2 funciones; "speak" y "mute". El primero para verbalizar una cadena de texto, el segundo para interrumpir la verbalización del tts.
Lo que hace es verificar la existencia del proceso jfw.exe. Si Jaws está activo, cada vez que se llame a la función "speak", esta va a pasarle el texto al objeto com de Jaws para que realice las verbalizaciones recibidas. De lo contrario el texto es enviado a la dll de NVDA.

## Cadenas traducibles

Este lenguaje no tiene ninguna herramienta automática que nos permita crear un script traducible, por lo que no queda más opción que hacerlo manualmente.  
La idea es bastante simple. Vamos a necesitar 2 archivos ini más. Uno donde guardaremos el idioma con el que va a iniciarse el script, y otro con todas las cadenas del script y sus diferentes traducciones.
En el archivo "strings.ini" tendremos como nombre de sección un texto representativo de la cadena. Como clave, el idioma; ES, para español. EN, para inglés. PT, para portugués. etcétera. Y como valor, la cadena traducida.
Para añadir un nuevo idioma tan solo tendremos que agregar una clave por cada sección con el prefijo del lenguaje, y la cadena traducida. Y finalmente agregar al menú, el nuevo idioma.
