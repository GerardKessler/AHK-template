# AHK-template
Esta es una plantilla de script pensada para facilitar el proceso de gestión de atajos de teclado del script, así como el manejo de las verbalizaciones de los lectores de pantalla principales como NVDA y Jaws.
Con solo crear un array con la lista de los atajos y sus correspondientes acciones asociadas, e importar los módulos necesarios ya tendrán la ventana con la lista de comandos y las funciones de modificación de los atajos.
En la carpeta podrán encontrar un archivo llamado "ejemplo.ahk", el cual tiene un código base con comentarios para  utilizarlo como guía.
nota:  
Es conveniente tener instalado AutoHotkey en su versión de 32 bits, para no tener problemas con el uso del controlador de NVDA. Si instalamos la versión de 32, este va a funcionar en ambos sistemas. 

## Gestión de hotkeys
El módulo llamado "hotkey.ahk" hubicado dentro de la carpeta hks, inicia con un condicional que verifica la existencia del archivo config.ini dentro de la carpeta hks.  
Si el archivo no existe, lanza la función "fileCreate" que itera entre los elementos del array especificado en el script principal y crea el archivo con esos datos, llamadno al finalizar  a la función "fileRead".  
Si el archivo existe se dispara la función "fileRead", la cual lee el archivo, e itera entre su contenido para activar los atajos de teclado con sus etiquetas o funciones asociadas.  
Cuando llamamos a la función "commands" se realiza otra lectura del archivo ini para crear la ventana gui con la lista de comandos, especificando como descripción el tercer elemento del array hks de cada elemento así como botones para cerrar la ventana y modificar el atajo de teclado.  

## Lectores de pantalla:
Esta plantilla también incluye otro módulo llamado "speak.ahk" dentro de la carpeta tts, el cual contiene 2 funciones; "speak" y "mute". El primero para realizar la lectura de un string, el segundo para callar al sintetizador.
Lo que hace es verificar la existencia del proceso jfw.exe. Si Jaws está activo, cada vez que se llame a la función "speak", esta va a pasarle el texto al objeto com de Jaws para que realice las verbalizaciones recibidas. De lo contrario el texto es enviado a la dll de NVDA.
Esta verificación se realiza una sola vez al comenzar el script para evitar la constante consulta al gestor de procesos del sistema operativo, por lo que si el usuario cambia de lector de pantallas mientras utiliza el script es necesario que se reinicie el mismo para que vuelva a verificar que lector es el activo. 
