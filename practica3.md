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

## 6. El comando expr permite la evaluación de expresiones. Su sintaxis es: expr arg1 op arg2, donde arg1 y arg2 representan argumentos y op la operación de la expresión. Investigar que tipo de operaciones se pueden utilizar.


El comando `expr` permite evaluar expresiones en Shell. Las operaciones que se pueden realizar incluyen:

### 1. **Operaciones aritméticas**:
   - **Suma**: `+`
   - **Resta**: `-`
   - **Multiplicación**: `\*` (se debe escapar con `\`)
   - **División**: `/`
   - **Módulo**: `%`

### 2. **Operaciones de comparación**:
   - Igual a: `=`
   - No igual a: `!=`
   - Menor que: `<`
   - Menor o igual que: `<=`
   - Mayor que: `>`
   - Mayor o igual que: `>=`

### 3. **Operaciones de cadena**:
   - **Concatenación**: `arg1 arg2`
   - **Longitud de cadena**: `length`
   - **Subcadena**: `substr`

### 4. **Operaciones lógicas**:
   - **AND**: `&`
   - **OR**: `|`


## 7. El comando “test expresión” permite evaluar expresiones y generar un valor de retorno, true o false. Este comando puede ser reemplazado por el uso de corchetes de la siguiente manera `[` expresión ]. Investigar que tipo de expresiones pueden ser usadas con el comando test. Tenga en cuenta operaciones para: evaluación de archivos, evaluación de cadenas de caracteres y evaluaciones numéricas.

*Evaluación de archivos*:
- **-e archivo**: Verifica si el archivo existe.
- **-f archivo**: Verifica si es un archivo regular.
- **-d archivo**: Verifica si es un directorio.
- **-r archivo**: Verifica si el archivo tiene permisos de lectura.
- **-w archivo**: Verifica si el archivo tiene permisos de escritura.
- **-x archivo**: Verifica si el archivo tiene permisos de ejecución.

**Ejemplo:**
```bash
if [ -f archivo.txt ]; then
  echo "El archivo existe"
fi
```
*Evaluación de cadenas de caracteres*:
- **-z cadena**: Verifica si la cadena tiene longitud cero (vacía).
- **-n cadena**: Verifica si la cadena no está vacía.
- **cadena1 = cadena2**: Verifica si dos cadenas son iguales.
- **cadena1 != cadena2**: Verifica si dos cadenas no son iguales.

*Evaluaciones numéricas*:
- **num1 -eq num2**: Verifica si dos números son iguales.
- **num1 -ne num2**: Verifica si dos números no son iguales.
- **num1 -gt num2**: Verifica si num1 es mayor que num2.
- **num1 -lt num2**: Verifica si num1 es menor que num2.
- **num1 -ge num2**: Verifica si num1 es mayor o igual a num2.
- **num1 -le num2**: Verifica si num1 es menor o igual a num2.


## 8. Estructuras de control. Investigue la sintaxis de las siguientes estructuras de control incluidas en shell scripting:

### if
La estructura `if` se utiliza para evaluar una condición y ejecutar un bloque de código si dicha condición es verdadera.
```bash
if [ condición ]; then
  # bloque de código
elif [ otra_condición ]; then
  # otro bloque de código
else
  # bloque alternativo
fi
```
### case
La estructura case permite comparar un valor con múltiples patrones y ejecutar un bloque de código según el patrón que coincida.
```bash
case $variable in
  patrón1)
    # bloque de código
    ;;
  patrón2)
    # otro bloque de código
    ;;
  *)
    # bloque predeterminado
    ;;
esac
```
### while
La estructura while ejecuta repetidamente un bloque de código mientras la condición sea verdadera.
```bash
while [ condición ]; do
  # bloque de código
done
```
### for
La estructura for itera sobre una lista de elementos o un rango, ejecutando un bloque de código para cada uno de ellos.
```bash
for variable in lista; do
  # bloque de código
done
```
### select
La estructura select permite generar un menú de opciones y ejecutar un bloque de código según la opción seleccionada.
```bash
select variable in opciones; do
  # bloque de código según la opción seleccionada
done
```
## 9. ¿Qué acciones realizan las sentencias break y continue dentro de un bucle? ¿Qué parámetros reciben?

### `break`
- **Acción**: Termina la ejecución del bucle en el que se encuentra y continúa con el siguiente bloque de código fuera del bucle.
- **Parámetro**: Opción de especificar un número para indicar cuántos niveles de bucles anidados se deben terminar. Por defecto, termina el bucle más interno.

### `continue`
- **Acción**: Interrumpe la iteración actual de un bucle y pasa a la siguiente iteración sin salir del bucle.
- **Parámetro**: Al igual que `break`, puede recibir un número para indicar el nivel de bucle anidado que debe continuar.


## 10. ¿Qué tipo de variables existen? ¿Es shell script fuertemente tipado? ¿Se pueden definir arreglos? ¿Cómo?

- **Tipos de Variables**:
  - **Variables Escalares**: Contienen un solo valor, como cadenas de texto o números.
  - **Variables de Entorno**: Variables predefinidas que almacenan información sobre el entorno del sistema, como `$HOME` o `$PATH`.

- **Tipado**: El shell script no es fuertemente tipado. Las variables no requieren declaración explícita de tipo; pueden contener cualquier tipo de datos y el tipo puede cambiar dinámicamente.

- **Definición de Arreglos**: Sí, se pueden definir arreglos en shell script. Se definen utilizando la sintaxis `nombre_del_array=(valor1 valor2 valor3 ...)`, y los elementos se acceden usando la sintaxis `${nombre_del_array[indice]}`.

**Ejemplo de definición y uso de un arreglo**:
```bash
# Definición de un arreglo
nombres=("Alice" "Bob" "Charlie")

# Acceso a elementos del arreglo
echo ${nombres[0]}  # Imprime "Alice"
echo ${nombres[1]}  # Imprime "Bob"
echo ${nombres[2]}  # Imprime "Charlie"
```
## 11. ¿Pueden definirse funciones dentro de un script? ¿Cómo? ¿Cómo se maneja el pasaje de parámetros de una función a la otra?

Sí, es posible definir funciones dentro de un script en Shell. Las funciones permiten agrupar comandos para su reutilización.

### Cómo definir una función:
```bash
nombre_funcion() {
    # Comandos a ejecutar
}

function nombre_funcion {
    # Comandos a ejecutar
}
```

## 12. Evaluación de expresiones:
### (a) Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard e imprima la multiplicación, suma, resta y cual es el mayor de los números leídos.
```bash
#!/bin/bash

if [ $# != 2 ]; then
  exit 0
fi

num1=$1
num2=$2

if [ $num1 -gt $num2 ]; then
  mayor=$num1
else
  mayor=$num2
fi

echo "Multiplicacion: $num1 * $num2 = $(expr $num1 \* $num2)"
echo "Suma: $num1 + $num2 = $(expr $num1 + $num2)"
echo "Resta: $num1 - $num2 = $(expr $num1 - $num2)"
echo "Mayor entre $num1 y $num2 = $mayor "

```
### (b) Modificar el script creado en el inciso anterior para que los números sean recibidos como parámetros. El script debe controlar que los dos parámetros sean enviados.
```bash
#!/bin/bash

if [ $# != 2 ]; then
  exit 0
fi

num1=$1
num2=$2

if [ $num1 -gt $num2 ]; then
  mayor=$num1
else
  mayor=$num2
fi

echo "Multiplicacion: $num1 * $num2 = $(expr $num1 \* $num2)"
echo "Suma: $num1 + $num2 = $(expr $num1 + $num2)"
echo "Resta: $num1 - $num2 = $(expr $num1 - $num2)"
echo "Mayor entre $num1 y $num2 = $mayor "
```

### (c) Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. Esta calculadora debe funcionar recibiendo la operación y los números como parámetros
```bash
#!/bin/bash

if [ $# != 3 ]; then
  exit 0
fi

function suma {
  echo "$(expr $1 + $2)"
}
function resta {
  echo "$(expr $1 - $2)"
}
function multi {
  echo "$(expr $1 \* $2)"
}
function div {
  echo "$(expr $1 % $2)"
}

case $1 in
"multiplicacion")
  multi $2 $3
  ;;
"suma")
  suma $2 $3
  ;;
"resta")
  resta $2 $3
  ;;
"division")
  div $2 $3
  ;;
esac

```
## 13. Uso de las estructuras de control:
### (a) Realizar un script que visualice por pantalla los números del 1 al 100 así como sus cuadrados.
```bash

#!/bin/bash
for ((i = 1; i <= 100; i++)); do
  echo $i
  echo "$(expr $i \* $i)"
done
```
### (b) Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y QuienEsta. Según la opción elegida se le debe mostrar:

- Listar: lista el contenido del directoria actual.
- DondeEstoy: muestra el directorio donde me encuentro ubicado.
- QuienEsta: muestra los usuarios conectados al sistema.

```bash
#!/bin/bash
select opcion in "Listar" "DondeEstoy" "QuienEsta" "Salir"; do
  case $opcion in
  "Listar")
    ls -la
    ;;
  "DondeEstoy")
    pwd
    ;;
  "QuienEsta")
    users
    ;;
  "Salir")
    exit 0
    ;;
  esac
done
```
### (c) Crear un script que reciba como parámetro el nombre de un archivo e informe si el mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En caso de que no exista el archivo/directorio cree un directorio con el nombre recibido como parámetro. 
```bash
#!/bin/bash
if [ $# != 1 ]; then
  exit 0
fi

if [ -f $1 ]; then
  if [ -d $1 ]; then
    echo "Directorio"
  else
    echo "Archivo"
  fi
else
  touch $1
fi
```

## 14. Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado como parametro agregandole una CADENA, contemplando las opciones:

- “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del
archivo
- “-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre
del archivo

*Ejemplo*:
Si tengo los siguientes archivos: /tmp/a /tmp/b
Al ejecutar: ./renombra /tmp/ -a EJ
Obtendré como resultado: /tmp/aEJ /tmp/bEJ
Y si ejecuto: ./renombra /tmp/ -b EJ
El resultado será: /tmp/EJa /tmp/EJb


```bash
#!/bin/bash
if [ $# != 3 ]; then
  exit 0
fi

if [ $2 == "-a" ]; then
  for archivo in "$1"/*; do
    mv $archivo "$archivo$3"
  done
fi
if [ $2 == "-b" ]; then
  for archivo in "$1"/*; do
    mv $archivo "$1/$3$(basename "$archivo")"
  done
fi
```

## 15. Comando cut. El comando cut nos permite procesar la líneas de la entrada que reciba (archivo, entrada estándar, resultado de otro comando, etc) y cortar columnas o campos, siendo posible indicar cual es el delimitador de las mismas. Investigue los parámetros que puede recibir este comando y cite ejemplos de uso.

El comando `cut` en Linux se utiliza para extraer secciones de líneas de archivos o de la entrada estándar. Puedes especificar columnas, rangos de caracteres o campos delimitados por algún carácter.

### Parámetros comunes de `cut`:

- **`-f`**: Selecciona uno o más campos específicos.
- **`-d`**: Especifica el delimitador de campos (por defecto, el delimitador es el tabulador).
- **`-b`**: Corta un rango de bytes específicos.
- **`-c`**: Corta un rango de caracteres específicos.

### Ejemplos de uso:

1. **Cortar un campo específico en un archivo delimitado por comas (`-f` y `-d`)**:

   Si tienes un archivo llamado `datos.csv`:
   ```bash
   nombre,apellido,edad
   Juan,Perez,30
   Ana,Gomez,25
   ```

   Para extraer solo el segundo campo (apellido):
   ```bash
   cut -d ',' -f 2 datos.csv
   ```

2. **Cortar por caracteres específicos (`-c`)**:

   Si tienes un archivo `nombres.txt`:
   ```bash
   Juan Perez
   Ana Gomez
   ```

   Para extraer los primeros cuatro caracteres de cada línea:
   ```bash
   cut -c 1-4 nombres.txt
   ```

3. **Cortar por bytes (`-b`)**:

   Si tienes un archivo con contenido en una sola línea:
   ```bash
   echo "abcdef" > archivo.txt
   ```

   Para extraer los bytes 1 a 3:
   ```bash
   cut -b 1-3 archivo.txt
   ```

4. **Uso combinado con otros comandos**:

   Extraer el usuario de la lista de procesos:
   ```bash
   ps aux | cut -d ' ' -f 1
   ```

El comando `cut` es muy útil cuando necesitas trabajar con archivos estructurados y procesar solo partes específicas del contenido.

## 16. Realizar un script que reciba como parámetro una extensión y haga un reporte con 2 columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se debe guardar el resultado en un archivo llamado reporte.txt

```bash
#!/bin/bash

if [ $# != 1 ]; then
  exit 0
fi

cant=$(ls | grep "$1" | wc -l)
echo "$(whoami):$cant" >>reporte.txt
```
## 17. Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de eliminar la letra a (mayúscula o minúscula). Ejemplo, directorio actual:

IsO
pepE
Maria
Si ejecuto: ./ejercicio17

Obtendré como resultado:

iSo
PEPe
mRI

*Ayuda*: Investigar el comando tr
### Comando `tr`

El comando `tr` en Linux es utilizado para **traducir, eliminar o comprimir** caracteres de la entrada estándar. Su funcionamiento se basa en convertir una secuencia de caracteres en otra secuencia según lo que se le indique. Es comúnmente usado en combinación con otros comandos a través de pipes (`|`), para modificar la salida de esos comandos.
#### Principales parámetros y opciones

1. **Sustitución de caracteres**:
   El uso más común de `tr` es reemplazar un conjunto de caracteres por otro. Para ello, se definen dos conjuntos de caracteres: el primero indica los caracteres a buscar y el segundo los caracteres por los que se reemplazarán.
   
   ```bash
   tr 'a' 'A'
   ```

   Este comando reemplaza todas las letras minúsculas "a" por mayúsculas "A" en la entrada estándar.

2. **`-d` (delete)**: Elimina caracteres de la entrada. El conjunto de caracteres especificados se borrará de la entrada.
   
   ```bash
   tr -d 'a'
   ```

   Elimina todas las letras "a" de la entrada.

3. **`-s` (squeeze-repeats)**: Comprime repeticiones de caracteres. Si se repite un carácter en secuencia, se reduce a una sola ocurrencia.

   ```bash
   tr -s ' '
   ```

   Comprime múltiples espacios consecutivos en uno solo.

4. **`-c` (complement)**: Opera sobre el complemento del conjunto de caracteres especificado, es decir, sobre todos los caracteres que **no** están en el conjunto dado.

   ```bash
   tr -c 'a-zA-Z' ' '
   ```

   Esto reemplaza cualquier carácter que no sea una letra (mayúscula o minúscula) con un espacio.

```bash
#!/bin/bash

for archivo in $(ls); do
  echo "$archivo" | tr "a-zA-Z" "A-Za-z" | tr -d 'aA'
done
```

## 18. Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema (el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee, el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

```bash
#!/bin/bash

if [ $# -ne 1 ]; then
  exit 1
fi

function isOn() {
  for user in $(who | awk '{print $1}' | uniq); do
    if [ $1 = $user ]; then
      return 0
    fi
  done
  return 1
}

log=0
while [ $log -eq 0 ]; do
  if isOn $1; then
    log=1
  else
    sleep 10
  fi
done
```


## 19. Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu, el cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú. El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir. Por ejemplo:
MENU DE COMANDOS
03. Ejercicio 3
12. Evaluar Expresiones
13. Probar estructuras de control
...
Ingrese la opción a ejecutar: 03

```bash
#!/bin/bash

select option in "12a" "12b" "12c" "13a" "Salir"; do
  case $option in
  "12a")
    source ./12-a.sh
    ;;
  "12b")
    echo "Primer numero: "
    read p1
    echo "Segundo numero: "
    read p2
    source ./12-b.sh $p1 $p2
    ;;
  "12c")
    echo "Operacion: "
    read p1
    echo "Primer numero: "
    read p2
    echo "Segundo numero: "
    read p3
    source ./12-c-calculadora.sh $p1 $p2 $p3
    ;;
  "13a")
    source ./13-a.sh
    ;;
  "Salir")
    exit 0
    ;;
  esac
done
```

## 20. Realice un script que simule el comportamiento de una estructura de PILA e implemente las siguientes funciones aplicables sobre una estructura global definida en el script:

- push: Recibe un parámetro y lo agrega en la pila
- length: Devuelve la longitud de la pila
- pop: Saca un elemento de la pila
- print: Imprime todos elementos de la pila
```bash
#!/bin/bash
list=()
select option in "push" "lenght" "pop" "print" "salir"; do
  case $option in
  "push")
    read n1
    list+=("$n1")
    ;;
  "lenght")
    echo ${#list[@]}
    ;;
  "pop")
    valor=$(expr ${#list[@]} - 1)
    if [ $valor -gt -1 ]; then
      echo "${list[$valor]}"
      unset 'list[$valor]'
    fi
    ;;
  "print")
    echo ${list[@]}
    ;;
  "salir")
    exit 0
    ;;
  esac
done
```
## 21. Dentro del mismo script y utilizando las funciones implementadas:
- Agregue 10 elementos a la pila
- Saque 3 de ellos
- Imprima la longitud de la cola
- Luego imprima la totalidad de los elementos que en ella se encuentran.

## 22. Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad de elementos del arreglo puede variar). Implemente la función productoria dentro de este script, cuya tarea sea multiplicar todos los números del arreglo


## 23. Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla sólo los números pares y que cuente sólo los números impares y los informe en pantalla al finalizar el recorrido.

## 24. Dada la definición de 2 vectores del mismo tamaño y cuyas longitudes no se conocen.

vector1=( 1 .. N)
vector2=( 7 .. N)

Por ejemplo:
vector1=( 1 80 65 35 2 )

y

vector2=( 5 98 3 41 8 ).

Complete este script de manera tal de implementar la suma elemento a elemento entre ambos vectores y que la misma sea impresa en pantalla de la siguiente manera:

La suma de los elementos de la posición 0 de los vectores es 6
La suma de los elementos de la posición 1 de los vectores es 178
...
La suma de los elementos de la posición 4 de los vectores es 10

## 25. Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
- “-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso contrario, un mensaje de error.
- “-l”: Devuelve la longitud del arreglo
- “-i”: Imprime todos los elementos del arreglo en pantalla

## 26. Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos, y solo para aquellos parámetros que se encuentren en posiciones impares (el primero, el tercero, verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o directorios inexistentes en el sistema.

## 27. Realice un script que implemente a través de la utilización de funciones las operaciones básicas sobre arreglos:
- inicializar: Crea un arreglo llamado array vacío
- agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
- eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la posición recibida como parámetro. Debe validar que se reciba una posición válida
- longitud: Imprime la longitud del arreglo en pantalla
- imprimir: Imprime todos los elementos del arreglo en pantalla
- inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud <parametro1>y en todas las posiciones asigna el valor <parametro2>

## 28. Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que el mismo exista y de no existir causar la terminación del script con código de error 4. Si el directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y tampoco deberán ser tenidos en cuenta para la suma a informar.

## 29. Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan acceder a la estructura creada:

- verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 5

- cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc

- borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archivo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje de error “Archivo no encontrado” y devuelve como valor de retorno 10

## 30. Realice un script que mueva todos los programas del directorio actual (archivos ejecutables) hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado.

