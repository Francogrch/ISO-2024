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
