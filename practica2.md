# Introducción a los Sistemas Operativos
Práctica 2
## 1. Editor de textos:
### (a) Nombre al menos 3 editores de texto que puede utilizar desde la línea de comandos.
- vi
- nano
- emacs
### (b) ¿En qué se diferencia un editor de texto de los comandos cat, more o less? Enumere los modos de operación que posee el editor de textos vi.
La diferencia esta en que cat, more y less imprimen en pantalla, mientroas que los editores permiten modificar el archivo.
Modos de operacion: Normal, Insertal, Visual.
### (c) Nombre los comandos más comunes que se le pueden enviar al editor de textos vi.
Comandos: :w - write 
:/ - buscar
:q - quit
:x - save and exit
## 2. Proceso de Arranque SystemV (https://github.com/systeminit/si):
### (a) Enumere los pasos del proceso de inicio de un sistema GNU/Linux, desde que se prende la PC hasta que se logra obtener el login en el sistema.
1. Inicio del sistema BIOS/UEFI:
   - La computadora se enciende y entra en el BIOS o UEFI.
   - El usuario puede configurar opciones básicas como orden de arran
que.

2. Carga del sistema operativo:
   - El BIOS/UEFI carga el sistema operativo seleccionado.
   - Se inicializa el kernel Linux.

3. Inicialización de servicios:
   - El initd o systemd inicia los servicios necesarios para el funcionamiento básico del sistema.
   - Esto incluye servicios como networking, cron, etc.

4. Arranque de aplicaciones:
   - Las aplicaciones definidas en /etc/rc.d o /usr/local/etc/rc.d se cargan.
   - Pueden ser scripts shell o programas específicos.

5. Configuración de red:
   - El servicio networking configura la interfaz de red.
   - Se obtiene una dirección IP si es necesario.

6. Configuración de hostname:
   - El nombre del host se establece según las configuraciones de red.

7. Montaje de sistemas de archivos:
   - Los sistemas de archivos montados se cargan según las configuraciones definidas.

8. Configuración de usuarios y grupos:
   - Los usuarios y grupos se inicializan según las configuraciones del sistema.

9. Carga de scripts de inicio:
   - Se ejecutan los scripts definidos en /etc/rc.local o equivalentes.

10. Login de usuario:
    - El sistema solicita al usuario que ingrese su nombre de usuario y contraseña.
    - Si la autenticación es exitosa, se proporciona cceso al shell.

11. Inicialización de sesiones:
    - Dependiendo del entorno de trabajo, se pueden cargar aplicaciones adicionales como X Window System, Wayland, etc.
### (b) Proceso INIT. ¿Quién lo ejecuta? ¿Cuál es su objetivo?
El proceso INIT suele ser iniciado por el bootloader o BIOS del computadora durante el arranque.El objetivo principal del proceso INIT es cargar y configurar los componentes necarios para que el sistema operativo funcione correctamente.Inicializa los servicios críticos, configura las interfaces de red, carga los drivers necesarios, y prepara el entorno para que el sistema operativo pueda tomar el control.
### (c) RunLevels. ¿Qué son? ¿Cuál es su objetivo?
RunLevels son un concepto en sistemas operativos Unix-like que se refieren a los diferentes niveles de ejecución del sistema. Su objetivo principal es controlar y limitar el acceso a ciertos comandos y funciones del sistema operativo.

Los principales objetivos de RunLevels son:

1. Seguridad: Limitan el acceso a comandos sensibles del sistema para evitar accesos no autorizados.

2. Control de servicios: Permiten iniciar o detener automáticamente servicios del sistema según el nivel de ejecución actual.

3. Configuración personalizada: Permiten configurar diferentes conjuntos de servicios para diferentes estados del sistema (arranque, cierre, etc.).

4. Flexibilidad: Facilitan la administración remota del sistema al permitir cambiar entre diferentes niveles de ejecución.

5. Simplicidad: Simplifican la gestión de servicios del sistema al agruparlos en diferentes niveles.
### (d) ¿A qué hace referencia cada nivel de ejecución según el estándar? ¿Dónde se define  qué Runlevel ejecutar al iniciar el sistema operativo? ¿Todas las distribuciones respetan estos estándares?
En los sistemas operativos basados en Unix y Linux, los niveles de ejecución, o *runlevels*, representan diferentes estados de operación del sistema. Cada nivel define qué servicios y procesos están activos. 
Los *runlevels* más comunes según el estándar SysV init son: - **Runlevel 0:** Apagado del sistema. 
- **Runlevel 1:** Modo monousuario, generalmente utilizado para mantenimiento. 
- **Runlevel 2:** Modo multiusuario sin servicios de red. 
- **Runlevel 3:** Modo multiusuario con servicios de red. 
- **Runlevel 4:** No utilizado (reservado para fines específicos en algunas distribuciones). 
- **Runlevel 5:** Modo multiusuario con entorno gráfico. 
- **Runlevel 6:** Reinicio del sistema. 


El *runlevel* que se ejecuta al iniciar el sistema operativo se define en un archivo de configuración específico, generalmente `/etc/inittab` en sistemas que utilizan SysVinit. En este archivo se especifica el *runlevel* predeterminado que el sistema debe alcanzar tras el arranque. 


No todas las distribuciones respetan estrictamente estos estándares. Algunas han adoptado otros sistemas de inicialización como *systemd*, que utiliza *targets* en lugar de *runlevels*. Aunque *systemd* es compatible con los *runlevels* tradicionales, organiza los estados de operación de manera diferente y ofrece más flexibilidad y control sobre los procesos y servicios del sistema.
### (e) Archivo /etc/inittab. ¿Cuál es su finalidad? ¿Qué tipo de información se almacena en el? ¿Cuál es la estructura de la información que en él se almacena?

El archivo `/etc/inittab` es un archivo de configuración fundamental en sistemas operativos que utilizan el sistema de inicialización SysVinit. Su principal función es definir el comportamiento del sistema durante el arranque, especificando el *runlevel* predeterminado y gestionando los procesos que deben iniciarse en cada uno de estos niveles de ejecución.

#### Tipo de información almacenada
En el archivo `/etc/inittab` se almacena información relacionada con la configuración del sistema en diferentes *runlevels*. Esto incluye:

1. **Runlevel predeterminado:** El nivel de ejecución en el que el sistema debe arrancar.
2. **Procesos a iniciar:** Qué procesos o servicios deben ejecutarse en cada *runlevel*.
3. **Acciones específicas:** Comportamientos especiales, como la gestión de consolas virtuales o acciones a realizar cuando el sistema cambia de nivel de ejecución.

#### Estructura de la información
La información en el archivo `/etc/inittab` sigue una estructura de líneas individuales, cada una de las cuales tiene cuatro campos separados por dos puntos (`:`):

1. **Identificador:** Un identificador único para la línea (por ejemplo, `id:5:initdefault:`).
2. **Runlevels:** Los *runlevels* en los que se aplicará la configuración de esa línea.
3. **Acción:** Especifica lo que se debe hacer (por ejemplo, `respawn`, `wait`, `once`).
4. **Proceso:** El comando o script que debe ejecutarse.

Ejemplo de una línea en `/etc/inittab`:
```
id:5:initdefault:
```
En este caso, `id` es el identificador, `5` es el *runlevel* predeterminado, `initdefault` es la acción que define el *runlevel* de arranque.


### (f) Suponga que se encuentra en el runlevel <X>. Indique qué comando(s) ejecutaría para cambiar al runlevel <Y>. ¿Este cambio es permanente? ¿Por qué?
### Cambio de *Runlevel* en Sistemas Basados en SysVinit

Para cambiar de un *runlevel* <X> a un *runlevel* <Y> en un sistema basado en SysVinit, puedes utilizar el siguiente comando:

```bash
init Y
```

Donde `Y` es el número del *runlevel* al que deseas cambiar. Por ejemplo, para cambiar al *runlevel* 3:

```bash
init 3
```

#### ¿Es este cambio permanente?

No, este cambio no es permanente. La razón es que el comando `init` solo afecta al *runlevel* actual del sistema hasta el próximo reinicio. El *runlevel* predeterminado, que se utiliza cada vez que el sistema arranca, está definido en el archivo `/etc/inittab` (para sistemas que usan SysVinit). 

Para hacer un cambio de *runlevel* permanente, debes editar el archivo `/etc/inittab` y configurar el *runlevel* predeterminado (generalmente en la línea con la acción `initdefault`).

Por ejemplo, para hacer permanente el cambio al *runlevel* 3, modificarías la línea correspondiente en `/etc/inittab`:

```bash
id:3:initdefault:
```

Esto asegurará que el sistema arranque siempre en el *runlevel* 3 a menos que se indique lo contrario.

### (g) Scripts RC. ¿Cuál es su finalidad? ¿Dónde se almacenan? Cuando un sistema GNU/Linux arranca o se detiene se ejecutan scripts, indique cómo determina qué script ejecutar ante cada acción. ¿Existe un orden para llamarlos? Justifique.

Los scripts RC (*run commands*) son scripts de shell utilizados por los sistemas GNU/Linux durante el proceso de arranque y apagado. Su finalidad es iniciar, detener o gestionar servicios y procesos específicos asociados a cada *runlevel* del sistema.

Estos scripts suelen estar almacenados en directorios específicos dentro de `/etc`. Las rutas más comunes incluyen:

- **/etc/init.d/**: Contiene los scripts principales que gestionan los servicios.
- **/etc/rc.d/** o **/etc/rcX.d/**: Contienen enlaces simbólicos a los scripts de `/etc/init.d/`, organizados según los diferentes *runlevels* (donde `X` es el número del *runlevel*).

Por ejemplo, `/etc/rc3.d/` contiene los scripts que se ejecutan en el *runlevel* 3.

#### Determinación de qué script ejecutar
Cuando el sistema GNU/Linux arranca o cambia de *runlevel*, el sistema de inicialización (como SysVinit) consulta los directorios correspondientes a cada *runlevel* (por ejemplo, `/etc/rc3.d/` para el *runlevel* 3). Dentro de estos directorios, se encuentran enlaces simbólicos a los scripts de `/etc/init.d/`, con nombres que comienzan con `S` (para iniciar servicios) o `K` (para detener servicios), seguidos de un número que determina el orden de ejecución.

#### Orden de ejecución de los scripts
Sí, existe un orden específico para ejecutar estos scripts. El orden se determina por el número que sigue a las letras `S` o `K` en el nombre del enlace simbólico. Por ejemplo:

- `S20apache2`: Iniciará el servicio Apache con prioridad 20.
- `K10mysql`: Detendrá el servicio MySQL con prioridad 10.

El sistema ejecuta primero los scripts `K` (para detener servicios), en orden numérico ascendente, y luego los scripts `S` (para iniciar servicios), también en orden numérico ascendente. Este orden garantiza que los servicios se detengan y se inicien de manera controlada, evitando conflictos o dependencias no resueltas entre los servicios.

#### Justificación del orden
El orden de ejecución es crucial para asegurar la correcta gestión de los servicios del sistema. Por ejemplo, un servicio de base de datos debería iniciarse antes de una aplicación que depende de él. Al definir un orden numérico, el sistema garantiza que las dependencias entre servicios se respeten y que el arranque o apagado del sistema ocurra de manera ordenada y eficiente.

## 3. SystemD(https://github.com/systemd/systemd):
### (a) ¿Qué es systemd?
Systemd es un sistema de inicialización y gestor de servicios en Linux que reemplaza a SysVinit, proporcionando arranque paralelo, gestión de procesos y servicios, y un control más eficiente del sistema.

### (b) ¿A qué hace referencia el concepto de Unit en Systemd?
Una *Unit* en Systemd es una configuración que define cómo se gestiona un recurso del sistema, como un servicio, un dispositivo, un punto de montaje o un socket.

### (c) ¿Para qué sirve el comando `systemctl` en Systemd?
El comando `systemctl` se utiliza para gestionar y controlar los *units* en Systemd, permitiendo iniciar, detener, habilitar o deshabilitar servicios, así como consultar el estado del sistema.

### (d) ¿A qué hace referencia el concepto de target en SystemD?
Un *target* en Systemd es un grupo de *units* que define un estado o nivel de operación del sistema, similar a los *runlevels* en SysVinit. Se utiliza para organizar y coordinar la activación de servicios y recursos según el estado deseado del sistema, como el arranque en modo gráfico o multiusuario.
### (e) Ejecute el comando pstree. ¿Qué es lo que se puede observar a partir de la ejecución de este comando?
Se observa un arbol de ejecucion donde estan relacionados los procesos, con sus paadres.

## 4. Usuarios:
### (a) ¿Qué archivos son utilizados en un sistema GNU/Linux para guardar la información de los usuarios?

En un sistema GNU/Linux, la información de los usuarios se guarda principalmente en dos archivos:

1. **/etc/passwd**: Contiene la información básica de cada usuario, como su nombre de usuario, UID (User ID), GID (Group ID), y el directorio home asociado.
  
2. **/etc/shadow**: Almacena las contraseñas encriptadas de los usuarios y otra información relacionada con la expiración y la seguridad de las contraseñas. 

Ambos archivos son esenciales para la gestión de cuentas de usuario en el sistema.

### (b) ¿A qué hacen referencia las siglas UID y GID? ¿Pueden coexistir UIDs iguales en un sistema GNU/Linux? Justifique.

- **UID (User Identifier):** Es un número único asignado a cada usuario en el sistema para identificarlo de manera exclusiva.
  
- **GID (Group Identifier):** Es un número único asignado a cada grupo en el sistema para identificarlo de manera exclusiva.

No, los UIDs iguales no pueden coexistir en un sistema GNU/Linux. Cada UID debe ser único para cada usuario para garantizar la correcta gestión de permisos y la seguridad del sistema. Si dos usuarios tuvieran el mismo UID, el sistema no podría distinguir entre ellos, lo que podría causar problemas de seguridad y permisos.

### (c) ¿Qué es el usuario root? ¿Puede existir más de un usuario con este perfil en GNU/Linux? ¿Cuál es la UID del root?.

El usuario root es el superusuario en GNU/Linux, con permisos totales y sin restricciones en el sistema. Tiene control completo sobre todos los archivos, procesos y configuraciones del sistema.

**¿Puede existir más de un usuario con este perfil?:** No, en GNU/Linux solo puede haber un único usuario con el nombre `root`, aunque es posible que otros usuarios tengan permisos equivalentes mediante el uso de `sudo` o configuraciones similares. Sin embargo, el UID del root debe ser único.

- **UID del root:** El UID del root es `0`.
### (d) Agregue un nuevo usuario llamado iso2017 a su instalación de GNU/Linux, especifique que su home sea creada en /home/iso_2017, y hágalo miembro del grupo catedra (si no existe, deberá crearlo). Luego, sin iniciar sesión como este usuario cree un archivo en su home personal que le pertenezca. Luego de todo esto, borre el usuario y verifique que no queden registros de él en los archivos de información de los usuarios y grupos.
        
        sudo adduser iso2017
        sudo adduser iso2017 --home /home/iso_2017
        sudo groupadd catedra     
        sudo usermod -aG catedra iso2017
        su 
        cd /home/iso_2017
        touch example
        exit
        sudo userdel -r iso2017 
        cat /etc/passwd
        sudo groupdel catedra 

### (e) Investigue la funcionalidad y parámetros de los siguientes comandos: 
- **`useradd` o `adduser`**
  - **Funcionalidad:** Crea una nueva cuenta de usuario en el sistema.
  - **Parámetros comunes:**
    - `-m`: Crea un directorio home para el usuario.
    - `-s /bin/bash`: Especifica el shell predeterminado del usuario.
    - `-G <grupo>`: Agrega el usuario a un grupo adicional.
    - **Nota:** `adduser` es un front-end más amigable y fácil de usar que `useradd`, y puede no estar disponible en todas las distribuciones.

- **`usermod`**
  - **Funcionalidad:** Modifica una cuenta de usuario existente.
  - **Parámetros comunes:**
    - `-aG <grupo>`: Agrega el usuario a un grupo.
    - `-s /bin/bash`: Cambia el shell del usuario.
    - `-L`: Bloquea la cuenta del usuario.

- **`userdel`**
  - **Funcionalidad:** Elimina una cuenta de usuario.
  - **Parámetros comunes:**
    - `-r`: Elimina el directorio home del usuario y su correo.

- **`su`**
  - **Funcionalidad:** Cambia al usuario especificado o a root.
  - **Parámetros comunes:**
    - `-`: Inicia una nueva sesión del usuario con su entorno completo.
    - `-c <comando>`: Ejecuta un comando como el usuario especificado.

- **`groupadd`**
  - **Funcionalidad:** Crea un nuevo grupo en el sistema.
  - **Parámetros comunes:**
    - `-g <GID>`: Especifica el GID del nuevo grupo.

- **`who`**
  - **Funcionalidad:** Muestra información sobre los usuarios actualmente conectados al sistema.
  - **Parámetros comunes:**
    - `-a`: Muestra toda la información disponible.

- **`groupdel`**
  - **Funcionalidad:** Elimina un grupo del sistema.
  - **Parámetros comunes:** No tiene parámetros adicionales obligatorios, pero la eliminación del grupo fallará si hay usuarios asignados al grupo que no se han reasignado o eliminado.

## 5. FileSystem:
### (a) ¿Cómo son definidos los permisos sobre archivos en un sistema GNU/Linux?
En GNU/Linux, los permisos sobre archivos y directorios se definen mediante tres tipos de permisos (lectura, escritura, y ejecución) aplicados a tres categorías de usuarios:

1. **Tipos de permisos:**
   - **r (read):** Permite leer el contenido de un archivo o listar el contenido de un directorio.
   - **w (write):** Permite modificar el contenido de un archivo o agregar, modificar y eliminar archivos en un directorio.
   - **x (execute):** Permite ejecutar un archivo como un programa o acceder a un directorio.

2. **Categorías de usuarios:**
   - **Usuario (owner):** El propietario del archivo.
   - **Grupo:** El grupo al que pertenece el archivo.
   - **Otros:** Todos los demás usuarios.

Los permisos se visualizan con el comando `ls -l`, donde se muestra una cadena de 10 caracteres (por ejemplo, `-rwxr-xr--`). Los primeros tres caracteres definen los permisos del propietario, los siguientes tres del grupo, y los últimos tres de otros usuarios.
### (b) Funcionalidad y parámetros de comandos relacionados con permisos en GNU/Linux

- **`chmod`**
  - **Funcionalidad:** Cambia los permisos de un archivo o directorio.
  - **Parámetros comunes:**
    - `u/g/o/a`: Especifica permisos para usuario, grupo, otros, o todos.
    - `+/-/=`: Agrega, quita o establece permisos.
    - **Ejemplo:** `chmod 755 archivo` (establece permisos `rwxr-xr-x`).

- **`chown`**
  - **Funcionalidad:** Cambia el propietario y/o el grupo de un archivo o directorio.
  - **Parámetros comunes:**
    - `usuario`: Cambia el propietario.
    - `usuario:grupo`: Cambia propietario y grupo.
    - `-R`: Aplica cambios recursivamente.
    - **Ejemplo:** `chown usuario:grupo archivo`.

- **`chgrp`**
  - **Funcionalidad:** Cambia el grupo propietario de un archivo o directorio.
  - **Parámetros comunes:**
    - `grupo`: Especifica el nuevo grupo.
    - `-R`: Cambia el grupo recursivamente.
    - **Ejemplo:** `chgrp grupo archivo`.

### (c) Al utilizar el comando chmod generalmente se utiliza una notación octal asociada para definir permisos. ¿Qué significa esto? ¿A qué hace referencia cada valor?

La notación octal en `chmod` utiliza un número de 3 o 4 dígitos para definir permisos, donde cada dígito representa los permisos de usuario, grupo y otros, respectivamente.

- **3 dígitos comunes:**
  - **4 (r):** Lectura.   100
  - **2 (w):** Escritura. 010
  - **1 (x):** Ejecución. 001

Cada dígito es la suma de los valores correspondientes:

- **7 (rwx):** Lectura + Escritura + Ejecución.
- **6 (rw-):** Lectura + Escritura.
- **5 (r-x):** Lectura + Ejecución.
- **4 (r--):** Solo lectura.

**Ejemplo:** `chmod 755 archivo` otorga `rwx` al usuario, `r-x` al grupo, y `r-x` a otros.

### (d) ¿Existe la posibilidad de que algún usuario del sistema pueda acceder a determinado archivo para el cual no posee permisos? Nombrelo, y realice las pruebas correspondientes.
Sí, es posible que un usuario acceda a un archivo sin tener permisos directos utilizando ciertas herramientas o mecanismos, como:
- **Comando `sudo`:** Permite a un usuario ejecutar comandos como superusuario o con permisos de otro usuario, si está configurado en el archivo `/etc/sudoers`.
- **Acceso a través de un grupo:** Si el usuario pertenece a un grupo que tiene permisos sobre el archivo, podría acceder a él indirectamente.

**Prueba sugerida:**
1. **Crear un archivo con permisos restrictivos:** `touch archivo; chmod 600 archivo`.
2. **Intentar leer el archivo con otro usuario:** `su - otro_usuario; cat archivo` (debería fallar).
3. **Leer el archivo usando `sudo`:** `sudo cat archivo` (si está configurado, debería funcionar).

### (e) Explique los conceptos de “full path name” y “relative path name”. De ejemplos claros de cada uno de ellos.

- **Full Path Name (Ruta absoluta):** Es la ruta completa desde la raíz (`/`) hasta el archivo o directorio. No depende de la ubicación actual del usuario.
  - **Ejemplo:** `/home/usuario/documentos/archivo.txt`.
  
- **Relative Path Name (Ruta relativa):** Es la ruta desde el directorio actual del usuario hasta el archivo o directorio. Depende de la ubicación actual.
  - **Ejemplo:** Si estás en `/home/usuario/`, la ruta relativa para `documentos/archivo.txt` sería `documentos/archivo.txt`.

Las rutas absolutas son útiles para ubicaciones fijas en el sistema, mientras que las rutas relativas son prácticas para navegar desde la ubicación actual.
### (f) ¿Con qué comando puede determinar en qué directorio se encuentra actualmente? ¿Existe alguna forma de ingresar a su directorio personal sin necesidad de escribir todo el path completo? ¿Podría utilizar la misma idea para acceder a otros directorios? ¿Cómo? Explique con un ejemplo.

- **Comando para determinar el directorio actual:**
  - **`pwd` (print working directory):** Muestra la ruta completa del directorio en el que te encuentras actualmente.

- **Ingresar al directorio personal sin escribir el path completo:**
  - **`cd ~` o simplemente `cd`:** Lleva directamente al directorio personal del usuario (por ejemplo, `/home/usuario`).

- **Acceder a otros directorios usando rutas relativas:**
  - Puedes usar la misma idea de rutas relativas para acceder a otros directorios sin escribir la ruta completa.
  - **Ejemplo:**
    - Si estás en `/home/usuario/`, y quieres ir al subdirectorio `documentos`, puedes usar `cd documentos`.
    - Para subir un nivel y entrar en otro directorio, puedes usar `cd ../otro_directorio`.

### (g) Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el uso del FileSystem:
- **`cd`**
  - **Funcionalidad:** Cambia el directorio actual.
  - **Parámetros comunes:**
    - `cd <directorio>`: Cambia al directorio especificado.
    - `cd ~`: Va al directorio personal.
    - `cd -`: Regresa al último directorio visitado.

- **`mount`**
  - **Funcionalidad:** Monta un sistema de archivos o dispositivo en un directorio.
  - **Parámetros comunes:**
    - `mount <dispositivo> <punto_de_montaje>`: Monta el dispositivo en el punto especificado.
    - `-o remount`: Remonta un sistema de archivos con opciones diferentes.

- **`mkdir`**
  - **Funcionalidad:** Crea un nuevo directorio.
  - **Parámetros comunes:**
    - `-p`: Crea directorios padres si no existen.
    - **Ejemplo:** `mkdir -p /ruta/nueva/carpeta`.

- **`du`**
  - **Funcionalidad:** Muestra el uso de espacio en disco por archivos y directorios.
  - **Parámetros comunes:**
    - `-h`: Muestra los tamaños en formato legible (KB, MB, etc.).
    - `-s`: Muestra el total usado por un directorio.

- **`rmdir`**
  - **Funcionalidad:** Elimina un directorio vacío.
  - **Parámetros comunes:**
    - **Ejemplo:** `rmdir carpeta` (elimina la carpeta si está vacía).

- **`df`**
  - **Funcionalidad:** Muestra información del espacio libre en los sistemas de archivos montados.
  - **Parámetros comunes:**
    - `-h`: Muestra la información en un formato legible (KB, MB, etc.).

- **`ln`**
  - **Funcionalidad:** Crea enlaces (links) a archivos.
  - **Parámetros comunes:**
    - `ln <archivo> <enlace>`: Crea un enlace duro.
    - `ln -s <archivo> <enlace>`: Crea un enlace simbólico.

- **`ls`**
  - **Funcionalidad:** Lista el contenido de un directorio.
  - **Parámetros comunes:**
    - `-l`: Muestra la lista en formato largo con detalles.
    - `-a`: Incluye archivos ocultos.

- **`pwd`**
  - **Funcionalidad:** Muestra la ruta completa del directorio actual.

- **`cp`**
  - **Funcionalidad:** Copia archivos o directorios.
  - **Parámetros comunes:**
    - `-r`: Copia recursivamente directorios.
    - `-i`: Solicita confirmación antes de sobrescribir.

- **`mv`**
  - **Funcionalidad:** Mueve o renombra archivos o directorios.
  - **Parámetros comunes:**
    - `-i`: Solicita confirmación antes de sobrescribir.
    - **Ejemplo:** `mv archivo.txt /ruta/nueva/` (mueve el archivo a una nueva ruta).


## 6. Procesos:
### (a) ¿Qué es un proceso? ¿A que hacen referencia las siglas PID y PPID? ¿Todos los procesos tienen estos atributos en GNU/Linux? Justifique. Indique qué otros atributos tiene un proceso.

- **Proceso:** Un proceso es una instancia de un programa en ejecución. Representa una unidad básica de trabajo gestionada por el sistema operativo.

- **PID (Process Identifier):** Es un número único asignado a cada proceso en el sistema para identificarlo.

- **PPID (Parent Process Identifier):** Es el PID del proceso padre que creó el proceso actual. Cada proceso, excepto el proceso inicial del sistema (`init` o `systemd`), tiene un PPID que indica de qué proceso fue creado.

- **¿Todos los procesos tienen estos atributos?:** Sí, todos los procesos en GNU/Linux tienen un PID y un PPID. El PID es único para cada proceso, mientras que el PPID identifica al proceso que lo generó.

- **Otros atributos de un proceso:**
  - **UID/GID:** Identificadores de usuario y grupo, que determinan los permisos.
  - **Estado:** Indica si el proceso está en ejecución, esperando, detenido, etc.
  - **Prioridad:** Define la importancia del proceso para la asignación de CPU.
  - **Tiempo de CPU:** La cantidad de tiempo de CPU que el proceso ha consumido.
  - **Espacio de direcciones:** Incluye memoria asignada, como código, datos y pila.
  - **Comando:** El comando o script que se ejecutó para iniciar el proceso.

### (b) Indique qué comandos se podrían utilizar para ver qué procesos están en ejecución en un sistema GNU/Linux.

- **`ps`:** Muestra una lista de procesos en ejecución en la terminal actual.
- **`top`:** Muestra en tiempo real los procesos activos y su uso de recursos.
- **`htop`:** Similar a `top`, pero con una interfaz más interactiva y fácil de usar.
- **`pstree`:** Muestra los procesos en forma de árbol jerárquico.

### (c) ¿Qué significa que un proceso se está ejecutando en Background? ¿Y en Foreground?

- **Background (En segundo plano):** Un proceso en background se ejecuta sin bloquear el terminal. Puedes seguir utilizando el terminal para otros comandos mientras el proceso sigue ejecutándose. Se puede iniciar un proceso en background añadiendo `&` al final del comando. Ejemplo: `./programa &`.

- **Foreground (En primer plano):** Un proceso en foreground ocupa el terminal y bloquea la entrada hasta que el proceso termine. El usuario debe esperar a que el proceso finalice antes de poder ejecutar otros comandos. Ejemplo: `./programa`.

### (d) ¿Cómo puedo hacer para ejecutar un proceso en Background? ¿Como puedo hacer para pasar un proceso de background a foreground y viceversa?

- **Ejecutar un proceso en Background:**
  - Añade un `&` al final del comando al iniciar el proceso. Ejemplo: `./programa &`.

- **Pasar un proceso de Background a Foreground:**
  - Usa el comando `fg` para traer el proceso en background al primer plano. Si hay varios procesos en background, puedes especificar el job ID. Ejemplo: `fg %1` (donde `%1` es el ID del job).

- **Pasar un proceso de Foreground a Background:**
  - Primero, suspende el proceso en primer plano con `Ctrl+Z`. Luego, usa el comando `bg` para continuar su ejecución en background. Ejemplo: `bg %1` (donde `%1` es el ID del job).

### (e) Pipe ( | ). ¿Cuál es su finalidad? Cite ejemplos de su utilización.

**Finalidad:** El pipe (`|`) se utiliza para encadenar la salida de un comando como entrada para otro comando, permitiendo la creación de tuberías de procesamiento de datos.

**Ejemplos de utilización:**
- `ls -l | grep "txt"`: Lista archivos y filtra aquellos con la extensión `.txt`.
- `ps aux | grep "firefox"`: Muestra los procesos en ejecución y filtra los que contienen "firefox".

### (f) Redirección. ¿Qué tipo de redirecciones existen? ¿Cuál es su finalidad? Cite ejemplos de utilización.

**Tipos de redirección:**

1. **Redirección de salida (`>`)**: Envía la salida de un comando a un archivo, sobrescribiendo el contenido existente.
   - **Ejemplo:** `echo "Hola" > archivo.txt` (escribe "Hola" en `archivo.txt`, sobrescribiendo su contenido).

2. **Redirección de salida (append) (`>>`)**: Añade la salida de un comando al final de un archivo sin sobrescribir su contenido.
   - **Ejemplo:** `echo "Adiós" >> archivo.txt` (agrega "Adiós" al final de `archivo.txt`).

3. **Redirección de entrada (`<`)**: Toma la entrada de un comando desde un archivo en lugar de desde el teclado.
   - **Ejemplo:** `sort < archivo.txt` (ordena el contenido de `archivo.txt`).

4. **Redirección de errores (`2>`)**: Envía los mensajes de error a un archivo.
   - **Ejemplo:** `comando_inexistente 2> error.log` (redirige los mensajes de error a `error.log`).

5. **Redirección de salida y errores (`> file 2>&1`)**: Envía tanto la salida estándar como los errores a un mismo archivo.
   - **Ejemplo:** `ls /directorio > salida.txt 2>&1` (redirige tanto la salida como los errores a `salida.txt`).

### (g) Comando kill. ¿Cuál es su funcionalidad? Cite ejemplos.
Mata un proceso con un el PID. 
**Ejemeplo**: kill 234
### (h) Investigue la funcionalidad y parámetros de los siguientes comandos relacionados con el manejo de procesos en GNU/Linux. Además, compárelos entre ellos:
Comandos relacionados con el manejo de procesos en GNU/Linux

- **`ps`**
  - **Funcionalidad:** Muestra información sobre los procesos en ejecución.
  - **Parámetros comunes:**
    - `-e` o `-A`: Muestra todos los procesos.
    - `-f`: Muestra una lista completa con detalles de los procesos.
    - `aux`: Muestra procesos de todos los usuarios con información detallada.
  - **Comparación:** `ps` proporciona una instantánea estática de los procesos en el momento de la ejecución.

- **`kill`**
  - **Funcionalidad:** Envía señales a procesos para terminarlos o modificarlos.
  - **Parámetros comunes:**
    - `-9`: Fuerza la terminación inmediata del proceso (SIGKILL).
    - `-15`: Solicita la terminación del proceso de forma más amigable (SIGTERM).
    - `PID`: Identificador del proceso al que se enviará la señal.
  - **Comparación:** `kill` se utiliza para finalizar o modificar procesos específicos usando su PID.

- **`pstree`**
  - **Funcionalidad:** Muestra los procesos en forma de árbol jerárquico.
  - **Parámetros comunes:**
    - `-p`: Muestra PIDs junto a los nombres de los procesos.
  - **Comparación:** `pstree` proporciona una visualización jerárquica de los procesos, facilitando la comprensión de la relación entre procesos padre e hijo.

- **`killall`**
  - **Funcionalidad:** Envía señales a todos los procesos con un nombre específico.
  - **Parámetros comunes:**
    - `-9`: Fuerza la terminación de todos los procesos con el nombre dado.
    - `-15`: Solicita la terminación de todos los procesos con el nombre dado.
    - `nombre_proceso`: Nombre del proceso al que se enviará la señal.
  - **Comparación:** `killall` es útil para finalizar todos los procesos que coinciden con un nombre específico, mientras que `kill` actúa sobre un PID individual.

- **`top`**
  - **Funcionalidad:** Muestra en tiempo real información sobre los procesos activos y su uso de recursos.
  - **Parámetros comunes:**
    - `-d <segundos>`: Define el intervalo de actualización en segundos.
  - **Comparación:** `top` proporciona una vista dinámica y actualizada de los procesos y su consumo de recursos, a diferencia de `ps` que es estático.

- **`nice`**
  - **Funcionalidad:** Ejecuta un comando con una prioridad de CPU modificada.
  - **Parámetros comunes:**
    - `-n <valor>`: Define el valor de "niceness" (prioridad). Un valor mayor significa menor prioridad.
    - **Ejemplo:** `nice -n 10 comando` (ejecuta `comando` con una prioridad más baja).
  - **Comparación:** `nice` ajusta la prioridad de los procesos en términos de uso de CPU, a diferencia de otros comandos que gestionan procesos de forma más directa.

### Comparación general

- **`ps`** ofrece una instantánea estática de procesos.
- **`kill`** y **`killall`** envían señales para terminar procesos, con `kill` dirigido por PID y `killall` por nombre.
- **`pstree`** muestra una vista jerárquica de procesos.
- **`top`** proporciona una vista en tiempo real de los procesos y su consumo de recursos.
- **`nice`** ajusta la prioridad de un proceso para influir en su asignación de CPU. 

## 7. Otros comandos de Linux (Indique funcionalidad y parámetros):
### (a) ¿A qué hace referencia el concepto de empaquetar archivos en GNU/Linux?

**Empaquetar archivos** en GNU/Linux se refiere al proceso de combinar varios archivos y directorios en un solo archivo. Esto facilita la gestión y transferencia de múltiples archivos como una única entidad.



### (b) Seleccione 4 archivos dentro de algún directorio al que tenga permiso y sume el tamaño de cada uno de estos archivos. Cree un archivo empaquetado conteniendo estos 4 archivos y compare los tamaños de los mismos. ¿Qué característica nota?
        
        touch f1 f2 f3 f4
        du -sh
        tar -cf comprimir.tar f1  f2 f3 f4
        ls -lha | greo comprimir.tar 
Al empaquetarlos, noto que el archivo comprimir.tar pesa lo mismo que la suma de los archivos f1,f2,f3,f4.  
        
### (c) ¿Qué acciones debe llevar a cabo para comprimir 4 archivos en uno solo? Indique la secuencia de comandos ejecutados.
    mkdir comprimir
    mv f1 f2 f3 f4 /comprimir
    tar -cf comprimir.tar comprimir 

### (d) ¿Pueden comprimirse un conjunto de archivos utilizando un único comando?
    tar -cf comprimir.tar f1 f2 f3 f4

### (e) Invesitgue la funcionalidad los siguientes comandos:

- **`tar`**
  - **Funcionalidad:** Utilizado para crear, modificar y extraer archivos tarball (`.tar`). También se puede combinar con herramientas de compresión para crear archivos comprimidos (`.tar.gz`, `.tar.bz2`).
  - **Parámetros comunes:**
    - `-c`: Crea un nuevo archivo tar.
    - `-x`: Extrae archivos de un archivo tar.
    - `-t`: Lista el contenido del archivo tar.
    - `-f <archivo>`: Especifica el nombre del archivo tar.
    - `-z`: Comprime o descomprime usando gzip (para `.tar.gz`).
    - `-j`: Comprime o descomprime usando bzip2 (para `.tar.bz2`).
    - **Ejemplo:** `tar -cvf archivo.tar carpeta` (empaqueta `carpeta` en `archivo.tar`).

- **`grep`**
  - **Funcionalidad:** Busca patrones dentro de archivos de texto y muestra las líneas que coinciden.
  - **Parámetros comunes:**
    - `-i`: Ignora diferencias entre mayúsculas y minúsculas.
    - `-r` o `-R`: Busca recursivamente en directorios.
    - `-v`: Muestra las líneas que no coinciden con el patrón.
    - **Ejemplo:** `grep "texto" archivo.txt` (busca "texto" en `archivo.txt`).

- **`gzip`**
  - **Funcionalidad:** Comprime archivos individuales en el formato `.gz`. Es comúnmente usado para reducir el tamaño de archivos.
  - **Parámetros comunes:**
    - `-d`: Descomprime un archivo `.gz`.
    - `-c`: Escribe la salida descomprimida en la salida estándar.
    - **Ejemplo:** `gzip archivo.txt` (comprime `archivo.txt` en `archivo.txt.gz`).

- **`zgrep`**
  - **Funcionalidad:** Permite buscar patrones en archivos comprimidos con gzip (`.gz`) como si fueran archivos de texto normales.
  - **Parámetros comunes:**
    - `-i`: Ignora diferencias entre mayúsculas y minúsculas.
    - `-r` o `-R`: Busca recursivamente en archivos comprimidos.
    - **Ejemplo:** `zgrep "texto" archivo.txt.gz` (busca "texto" en `archivo.txt.gz`).

- **`wc`**
  - **Funcionalidad:** Cuenta líneas, palabras y caracteres en archivos de texto.
  - **Parámetros comunes:**
    - `-l`: Muestra solo el número de líneas.
    - `-w`: Muestra solo el número de palabras.
    - `-c`: Muestra solo el número de caracteres.
    - **Ejemplo:** `wc -l archivo.txt` (muestra el número de líneas en `archivo.txt`).

## 8. Indique qué acción realiza cada uno de los comandos indicados a continuación considerando su orden. Suponga que se ejecutan desde un usuario que no es root ni pertenece al grupo de root. (Asuma que se encuentra posicionado en el directorio de trabajo del usuario con el que se logueó). En caso de no poder ejecutarse el comando, indique la razón:


1. **`ls -l > prueba`**  
   - **Acción:** Lista los elementos del directorio actual en formato largo (detallado) y redirige la salida al archivo `prueba`.
   - **Ejecución exitosa:** Sí. El usuario no necesita permisos especiales para listar archivos en su propio directorio y redirigir la salida a un archivo.

2. **`ps > PRUEBA`**  
   - **Acción:** Guarda en el archivo `PRUEBA` una instantánea de los procesos que se encuentran en ejecución en el sistema.
   - **Ejecución exitosa:** Sí. El comando `ps` muestra los procesos del usuario actual y no requiere permisos especiales.

3. **`chmod 710 prueba`**  
   - **Acción:** Modifica los permisos del archivo `prueba`, otorgando permisos de lectura, escritura y ejecución (rwx) al propietario, permisos de ejecución (x) al grupo y sin permisos para otros usuarios.
   - **Ejecución exitosa:** Sí, el usuario que creó el archivo `prueba` tiene permisos para cambiar los permisos del mismo.

4. **`chown root:root PRUEBA`**  
   - **Acción:** Intenta cambiar el propietario y el grupo del archivo `PRUEBA` al usuario y grupo `root`.
   - **Ejecución fallida:** No. Solo el superusuario (root) puede cambiar la propiedad de los archivos. El comando fallará con un error de permisos.

5. **`chmod 777 PRUEBA`**  
   - **Acción:** Modifica los permisos del archivo `PRUEBA`, otorgando permisos de lectura, escritura y ejecución (rwx) al propietario, al grupo y a todos los demás usuarios.
   - **Ejecución exitosa:** Sí, el usuario puede cambiar los permisos del archivo `PRUEBA` ya que es su propietario.

6. **`chmod 700 /etc/passwd`**  
   - **Acción:** Intenta cambiar los permisos del archivo `/etc/passwd`, otorgando permisos de lectura, escritura y ejecución (rwx) solo al propietario (root).
   - **Ejecución fallida:** No. El archivo `/etc/passwd` es propiedad de `root`, por lo que solo el superusuario puede cambiar sus permisos.

7. **`passwd root`**  
   - **Acción:** Intenta cambiar la contraseña del usuario `root`.
   - **Ejecución fallida:** No. Solo el superusuario o alguien con privilegios elevados puede cambiar la contraseña de `root`.

8. **`rm PRUEBA`**  
   - **Acción:** Elimina el archivo `PRUEBA`.
   - **Ejecución exitosa:** Sí, el usuario puede eliminar archivos de los cuales es propietario.

9. **`man /etc/shadow`**  
   - **Acción:** Intenta mostrar el archivo `/etc/shadow` en el formato de la página de manual.
   - **Ejecución fallida:** No. `man` está diseñado para mostrar páginas de manual, no archivos directamente. Además, `/etc/shadow` es un archivo protegido que contiene contraseñas cifradas, por lo que un usuario no root no puede leerlo.

10. **`find / -name "*.conf"`**  
    - **Acción:** Busca archivos con la extensión `.conf` a partir del directorio raíz `/`.
    - **Ejecución parcial:** Sí. El comando `find` comenzará la búsqueda, pero fallará en algunos directorios del sistema debido a la falta de permisos del usuario para acceder a ellos.

11. **`usermod root -d /home/newroot -L`**  
    - **Acción:** Intenta cambiar el directorio de inicio del usuario `root` a `/home/newroot` y bloquear su cuenta.
    - **Ejecución fallida:** No. Solo el superusuario (root) puede modificar la cuenta de otro usuario, especialmente la cuenta `root`.

12. **`cd /root`**  
    - **Acción:** Intenta cambiar el directorio de trabajo al directorio `/root`.
    - **Ejecución fallida:** No. El directorio `/root` es el directorio de inicio del superusuario, y solo el superusuario tiene acceso a este directorio.

13. **`rm *`**  
    - **Acción:** Elimina todos los archivos en el directorio actual.
    - **Ejecución exitosa:** Sí, si el usuario tiene permisos sobre los archivos en el directorio actual. Sin embargo, puede ser riesgoso si se ejecuta sin tener en cuenta los archivos que serán eliminados.

14. **`cd /etc`**  
    - **Acción:** Cambia el directorio de trabajo al directorio `/etc`.
    - **Ejecución exitosa:** Sí. El directorio `/etc` tiene permisos de lectura para todos los usuarios, por lo que el cambio de directorio es posible.

15. **`cp * /home -R`**  
    - **Acción:** Copia todos los archivos y directorios del directorio actual (`/etc`) al directorio `/home` de manera recursiva.
    - **Ejecución fallida:** No. El usuario no tiene permisos para copiar archivos de sistema en el directorio `/etc` ni para escribir en el directorio `/home`.

16. **`shutdown`**  
    - **Acción:** Intenta apagar o reiniciar el sistema.
    - **Ejecución fallida:** No. Solo el superusuario (root) puede apagar o reiniciar el sistema.

## 9. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:
### (a) Terminar el proceso con PID 23.
        kill 23
### (b) Terminar el proceso llamado init o systemd. ¿Qué resultados obtuvo?
        killall systemd
Resultado: El sistema se apagará o reiniciará, ya que init o systemd son procesos esenciales del sistema.
### (c) Buscar todos los archivos de usuarios en los que su nombre contiene la cadena “.conf”
        find /home -name "*.conf"

### (d) Guardar una lista de procesos en ejecución el archivo /home/<su nombre de usuario>/procesos
        
        ps aux > ~/procesos

### (e) Cambiar los permisos del archivo /home/<su nombre de usuario>/xxxx a:
- Usuario: Lectura, escritura, ejecución
- Grupo: Lectura, ejecución
- Otros: ejecución
        
        chmod 751 ~\xxxx 

### (f) Cambiar los permisos del archivo /home/<su nombre de usuario>/yyyy a:
- Usuario: Lectura, escritura.
- Grupo: Lectura, ejecución
- Otros: Ninguno
        
        chmod 750 ~/yyyy

### (g) Borrar todos los archivos del directorio /tmp
        rm -rf /tmp/*
### (h) Cambiar el propietario del archivo /opt/isodata al usuario iso2010
        chown iso2010 /opt/isodata

### (i) Guardar en el archivo /home/<su nombre de usuario>/donde el directorio donde me encuentro en este momento, en caso de que el archivo exista no se debe eliminar su contenido anterior.

       pwd >> ~/donde 

## 10. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:
### (a) Ingrese al sistema como usuario “root”
        su
### (b) Cree un usuario. Elija como nombre, por convención, la primer letra de su nombre seguida de su apellido. Asígnele una contraseña de acceso.
        adduser fr
### (c) ¿Qué archivos fueron modificados luego de crear el usuario y qué directorios se crearon?
        /etc/passwd 
        /etc/shadow
        /etc/group
        /etc/gshadow
        /home/fr
### (d) Crear un directorio en /tmp llamado cursada2017
        mkdir /tmp/cursada2017
### (e) Copiar todos los archivos de /var/log al directorio antes creado.
        cp /var/log/* /tmp/cursada2017
### (f) Para el directorio antes creado (y los archivos y subdirectorios contenidos en él) cambiar el propietario y grupo al usuario creado y grupo users.
        chown -R fr:users /tmp/cursada2017
### (g) Agregue permiso total al dueño, de escritura al grupo y escritura y ejecución a todos los demás usuarios para todos los archivos dentro de un directorio en forma recursiva.
        chmod 763 /tmp/cursada2017/* 
### (h) Acceda a otra terminal virtual para loguearse con el usuario antes creado.
Ctrl + Alt + F2
login: fr

### (i) Una vez logueado con el usuario antes creado, averigüe cuál es el nombre de su terminal.
        who 
### (j) Verifique la cantidad de procesos activos que hay en el sistema.
        ps -aux | wc -l
### (k) Verifiqué la cantidad de usuarios conectados al sistema.
        who | wc -l
### (l) Vuelva a la terminal del usuario root, y envíele un mensaje al usuario anteriormente creado, avisándole que el sistema va a ser apagado.

        echo "El sistema se apagará pronto" | write fr /dev/pts/2 

### (m) Apague el sistema.
        sudo shutdown -h now

## 11. Indique qué comando sería necesario ejecutar para realizar cada una de las siguientes acciones:
### (a) Cree un directorio cuyo nombre sea su número de legajo e ingrese a él.
        mkdir 222222
### (b) Cree un archivo utilizando el editor de textos vi, e introduzca su información personal: Nombre, Apellido, Número de alumno y dirección de correo electrónico. El archivo debe llamarse "LEAME".
        vi LEAME
### (c) Cambie los permisos del archivo LEAME, de manera que se puedan ver reflejados los siguientes permisos:
- Dueño: ningún permiso
- Grupo: permiso de ejecución
- Otros: todos los permisos
    
        chmod 017 LEAME 
### (d) Vaya al directorio /etc y verifique su contenido. Cree un archivo dentro de su directorio personal cuyo nombre sea leame donde el contenido del mismo sea el listado de todos los archivos y directorios contenidos en /etc. ¿Cuál es la razón por la cuál puede crear este archivo si ya existe un archivo llamado "LEAME.en este directorio?.
        cd /etc
        ls -lah << leame
Se puede porque POSIX es case sensitive
        
### (e) ¿Qué comando utilizaría y de qué manera si tuviera que localizar un archivo dentro del filesystem? ¿Y si tuviera que localizar varios archivos con características similares? Explique el concepto teórico y ejemplifique.

        find / -type f -name "*.extension"

Con el parametro type especifico f (file) y con -name el nombre, acepta * para poder agrupar posibles nombres o extensiones

### (f) Utilizando los conceptos aprendidos en el punto e), busque todos los archivos cuya extensión sea .so y almacene el resultado de esta búsqueda en un archivo dentro del directorio creado en a). El archivo deberá llamarse .ejercicio_f".
        sudo find / -type f -name ".so" >> ~/222222/.ejercicio_f

## 12. Indique qué acción realiza cada uno de los comandos indicados a continuación considerando su orden. Suponga que se ejecutan desde un usuario que no es root ni pertenece al grupo de root. (Asuma que se encuentra posicionado en el directorio de trabajo del usuario con el que se logueó). En caso de no poder ejecutarse el comando, indique la razón.

1. **`mkdir iso`**
   - Crea un directorio llamado `iso` en el directorio actual.

2. **`cd ./iso; ps > f0`**
   - Ingresa al directorio `iso` y redirige la salida del comando `ps` (que lista los procesos en ejecución) al archivo `f0`.

3. **`ls > f1`**
   - Redirige la salida del comando `ls` (que lista el contenido del directorio actual) al archivo `f1`.

4. **`cd /`**
   - Cambia el directorio actual al directorio raíz `/`. **Este comando no requiere permisos de root, por lo que puede ejecutarse.**

5. **`echo $HOME`**
   - Imprime en pantalla el valor de la variable de entorno `$HOME`, que contiene la ruta del directorio de inicio del usuario.

6. **`ls -l $> $HOME/iso/ls`**
   - **Este comando es incorrecto.** La sintaxis `$>` no es válida. Debería ser algo como `ls -l > $HOME/iso/ls` para redirigir la salida.

7. **`cd $HOME/; mkdir f2`**
   - Cambia al directorio almacenado en la variable de entorno `$HOME` (generalmente el directorio de inicio del usuario) y crea un directorio llamado `f2`. **No se necesita ser root para ejecutarlo.**

8. **`ls -ld f2`**
   - Lista los detalles del directorio `f2` (permisos, propietario, etc.) en formato largo.

9. **`chmod 341 f2`**
   - Cambia los permisos del directorio `f2` a `341`, lo que otorga permisos de ejecución y escritura al propietario, permisos de lectura y ejecución al grupo, y permisos de escritura a los demás usuarios.

10. **`touch dir`**
    - Crea un archivo vacío llamado `dir` en el directorio actual.

11. **`cd f2`**
    - Cambia al directorio `f2`.

12. **`cd ~/iso`**
    - Cambia al directorio `iso` ubicado en el directorio de inicio del usuario (indicado por `~`).

13. **`pwd > f3`**
    - Guarda la salida del comando `pwd` (que imprime el directorio actual) en un archivo llamado `f3`.

14. **`ps | grep 'ps' | wc -l >> ../f2/f3`**
    - Busca el proceso `ps` utilizando `grep`, cuenta el número de líneas encontradas con `wc -l`, y redirige la salida al archivo `f3` ubicado en el directorio `f2`. Si el archivo `f3` no existe, lo crea.

15. **`chmod 700 ../f2; cd ..`**
    - Cambia los permisos del directorio `f2` para que solo el propietario tenga permisos de lectura, escritura y ejecución. Luego, cambia al directorio padre del actual.

16. **`find . -name etc/passwd`**
    - Busca en el directorio actual y sus subdirectorios un archivo o directorio llamado `etc/passwd`. **Este comando probablemente no encontrará nada, ya que `/etc/passwd` normalmente está en la raíz.**

17. **`find / -name etc/passwd`**
    - Busca a partir del directorio raíz un archivo o directorio llamado `etc/passwd`. **Este comando requiere permisos de root para acceder a todos los directorios del sistema.**

18. **`mkdir ejercicio5`**
    - Crea un directorio llamado `ejercicio5` en el directorio actual.

### (a) Inicie 2 sesiones utilizando su nombre de usuario y contraseña. En una sesión vaya siguiendo paso a paso las órdenes que se encuentran escritas en el cuadro superior. En la otra sesión, cree utilizando algún editor de textos un archivo que se llame .ejercicio10_explicacion dentro del directorio creado en el ejercicio 9.a) y, para cada una de las órdenes que ejecute en la otra sesión, realice una breve explicación de los resultados obtenidos. (?)

### (b) Complete en el cuadro superior los comandos 19 y 20, de manera tal que realicen la siguiente acción:
- 19: Copiar el directorio iso y todo su contenido al directorio creado en el inciso 9.a).
    **'cp -r ~/iso <directorio>'**
- 20: Copiar el resto de los archivos y directorios que se crearon en este ejercicio al directorio creado en el ejercicio 9.a).
    **'cp -r ~/ejercicio5 <directorio>'**
### (c) Ejecute las órdenes 19 y 20 y comentelas en el archivo creado en el inciso a). 
    (?)
## 13. Cree una estructura desde el directorio /home que incluya varios directorios, subdirectorios y archivos, según el esquema siguiente. Asuma que “usuario” indica cuál es su nombre de usuario. Además deberá tener en cuenta que dirX hace referencia a directorios y fX hace referencia a archivos:

### (a) Utilizando la estructura de directorios anteriormente creada, indique que comandos son necesarios para realizar las siguientes acciones:
- Mueva el archivo "f3.al directorio de trabajo /home/usuario.
 mv dir1/f3 .
- Copie el archivo "f4.en el directorio "dir11".
        cp dir2/f4 dir1/dir11
- Haga los mismo que en el inciso anterior pero el archivo de destino, se debe llamar "f7".
        cp dir2/f4 dir1/dir11/f7
- Cree el directorio copia dentro del directorio usuario y copie en él, el contenido de "dir1".
        mkdir copia
        cp -r dir1/* copia
- Renombre el archivo "f1" por el nombre archivo y vea los permisos del mismo.
        mv f1 archivo
        ls -la | grep archivo
- Cambie los permisos del archivo llamado archivo de manera de reflejar lo siguiente:
• Usuario: Permisos de lectura y escritura
• Grupo: Permisos de ejecución
• Otros: Todos los permisos
        chmod 617
- Renombre los archivos "f3 "f4"de manera que se llamen "f3.exe "f4.exerespectivamente.
    mv f3 f3.exe
    mv dir2/f4 dir2/f4.exe
- Utilizando un único comando cambie los permisos de los dos archivos renombrados en el inciso anterior, de manera de reflejar lo siguiente:
• Usuario: Ningún permiso
• Grupo: Permisos de escritura
• Otros: Permisos de escritura y ejecución
    chmod 045 f3.exe dir2/f4.exe
## 14. Indique qué comando/s es necesario para realizar cada una de las acciones de la siguiente secuencia de pasos (considerando su orden de aparición):
### (a) Cree un directorio llamado logs en el directorio /tmp.
**'mkdir /tmp/logs'**
### (b) Copie todo el contenido del directorio /var/log en el directorio creado en el punto anterior.
**'cp /var/log/* /tmp/logs'**
### (c) Empaquete el directorio creado en 1, el archivo resultante se debe llamar "misLogs.tar".
**'tar -fc misLogs.tar tmp/logs **
### (d) Empaquete y comprima el directorio creado en 1, el archivo resultante se debe llamar "misLogs.tar.gz".
**'tar -fcz misLogs.tar.gz tmp/logs **
### (e) Copie los archivos creados en 3 y 4 al directorio de trabajo de su usuario.
**'cp misLogs.tar.gz misLogs.tar ~/'**
### (f) Elimine el directorio creado en 1, logs.
**'rm -rf /tmp/logs'**
### (g) Desempaquete los archivos creados en 3 y 4 en 2 directorios diferentes.
**'tar -xf misLogs.tar -C misLogsTar'**
**'tar -xfz misLogs.tar.gz -C misLogsTargz'**
