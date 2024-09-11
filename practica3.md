# Practica 3
## 1. Qué es el Shell Scripting? ¿A qué tipos de tareas están orientados los script? ¿Los scripts deben compilarse? ¿Por qué? 

El Shell Scripting es escribir y ejecutar comandos en un archivo para automatizar tareas en un sistema operativo a través de la shell (como bash o zsh).
¿A qué tareas están orientados los scripts?

Los scripts se usan para:

- Automatizar tareas repetitivas.
- Administrar el sistema (copias de seguridad, manejo de usuarios).
- Manipular archivos y datos.
- Configurar entornos.

¿Deben compilarse los scripts? ¿Por qué?

No, los scripts no se compilan, son interpretados directamente por la shell, lo que permite su ejecución inmediata y sencilla sin necesidad de un compilador.


## 2. Investigar la funcionalidad de los comandos echo y read.
El comando echo se puede imprimir en pantalla.

```bash
echo "Hola, mundo"
```
El comando read permite capturar la entrada del usuario desde la terminal

```bash
read input
echo $input

```
### (a) ¿Como se indican los comentarios dentro de un script?
Los comentarios se indican con #
### (b) ¿Cómo se declaran y se hace referencia a variables dentro de un script?
Se declaran con un = sin espacios, y para referenciarlos es con $

```bash
variable="hola"
echo "$variable mundo"
```

## 3.Crear dentro del directorio personal del usuario logueado un directorio llamado practica-shell-script y dentro de él un archivo llamado mostrar.sh cuyo contenido sea el siguiente:

```bash
#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Fecha y hora actual:"
date
echo "Su apellido y nombre es:
echo "$apellido $nombre"
echo "Su usuario es: `whoami`"
echo "Su directorio actual es:"
```

### (a) Asignar al archivo creado los permisos necesarios de manera que pueda ejecutarlo
```
chmod +x ~/practica-shell-script/mostrar.sh
```
### (b) Ejecutar el archivo creado de la siguiente manera: ./mostrar

### (c) ¿Qué resultado visualiza?
Me da error ya que no esta cerrado el string de la linea 9.
### (d) Las backquotes (`) entre el comando whoami ilustran el uso de la sustitución de comandos. ¿Qué significa esto?
En shell scripting, el uso de comando (comillas invertidas) o $(comando) se emplea para ejecutar un comando y utilizar su salida como parte de otro comando o asignarla a una variable.
### (e) Realizar modificaciones al script anteriormente creado de manera de poder mostrar distintos resultados (cuál es su directorio personal, el contenido de un directorio en particular, el espacio libre en disco, etc.). Pida que se introduzcan por teclado (entrada estándar) otros datos.
```bash
#!/bin/bash
# Comentarios acerca de lo que hace el script
# Siempre comento mis scripts, si no hoy lo hago
# y mañana ya no me acuerdo de lo que quise hacer
echo "Introduzca su nombre y apellido:"
read nombre apellido
echo "Introduzca su dni:"
read dni
echo "Fecha y hora actual:"
date
echo "Su apellido,nombre,dni es:"
echo "$apellido $nombre $dni"
echo "Su usuario es: $(whoami)"
echo "Su directorio actual es: $(pwd)"
echo "Su directorio personal es: $HOME"
echo "Introduzca un directorio que este en su /home"
read directorio
ls ~/$directorio
```

## 4. Parametrización: ¿Cómo se acceden a los parámetros enviados al script al momento de su invocación? ¿Qué información contienen las variables $#, $*, $? Y $HOME dentro de un script?

## 4. Parametrización en Shell Scripting

### ¿Cómo se accede a los parámetros enviados al script al momento de su invocación?
Los parámetros enviados a un script se acceden mediante variables especiales:
- `$1`, `$2`, etc.: Representan los parámetros en el orden en que fueron pasados. `$1` es el primer parámetro, `$2` el segundo, y así sucesivamente.
- `$0`: El nombre del script.

### Información contenida en las variables:
- `$#`: El número de parámetros pasados al script.
- `$*`: Todos los parámetros pasados al script como una sola cadena.
- `$?`: El código de salida del último comando ejecutado (0 indica éxito).
- `$HOME`: La ruta del directorio personal del usuario que ejecuta el script.

## 5. ¿Cual es la funcionalidad de comando exit? ¿Qué valores recibe como parámetro y cual es su significado?

El comando `exit` se utiliza para **terminar** la ejecución de un script o salir de un proceso en **shell scripting**.

### Valores que recibe como parámetro:
- **Código de salida** (opcional): `exit` puede recibir un número entero como parámetro que representa el **código de salida** del script o proceso.
- **0**: Indica que el script o proceso terminó con éxito.
- **Cualquier otro número**: Indica que ocurrió un **error** o una terminación anormal.

