# Practica 1 ISO
El objetivo de esta práctica es que el alumno se familiarice con los conceptos básicos del sistema operativo GNU/Linux, así como con su entorno y comandos principales.

## Punto 1: Características de GNU/Linux

### (a) Mencione y explique las características más relevantes de GNU/Linux

1. **Código Abierto y Libre:**
   GNU/Linux es un sistema operativo de código abierto bajo la licencia GPL (General Public License). Esto permite a los usuarios acceder al código fuente, modificarlo y redistribuirlo según sus necesidades, promoviendo la transparencia y colaboración.

2. **Multitarea:**
   GNU/Linux soporta la ejecución simultánea de múltiples procesos. Esto significa que el sistema operativo puede manejar varios programas o tareas al mismo tiempo, gestionando eficientemente los recursos del sistema.

3. **Multiusuario:**
   GNU/Linux es un sistema multiusuario, lo que significa que permite que múltiples usuarios trabajen en la misma máquina, al mismo tiempo o en diferentes momentos, con entornos y permisos de seguridad individualizados.

4. **Compatibilidad y Portabilidad:**
   GNU/Linux es altamente compatible con diversas arquitecturas de hardware y dispositivos. Su diseño modular permite su instalación y funcionamiento en plataformas que van desde servidores hasta dispositivos móviles.

5. **Seguridad:**
   GNU/Linux tiene un enfoque robusto en la seguridad, incluyendo la gestión de permisos y accesos, autenticación de usuarios, y herramientas avanzadas de firewall y cifrado.

6. **Estabilidad y Rendimiento:**
   Conocido por su estabilidad, GNU/Linux puede operar sin reinicios durante largos períodos, lo que lo hace ideal para servidores. Además, su eficiencia en la gestión de recursos lo convierte en una opción ideal para sistemas con limitaciones de hardware.

### (b) Mencione otros sistemas operativos y compárelos con GNU/Linux en cuanto a los puntos mencionados en el inciso a

1. **Windows:**
   - **Código Abierto vs. Privado:** A diferencia de GNU/Linux, Windows es software propietario. Su código fuente no es accesible al público, limitando la capacidad de personalización y modificación.
   - **Multitarea y Multiusuario:** Windows también soporta multitarea y multiusuario, pero a menudo requiere mayores recursos del sistema para funciones básicas comparado con GNU/Linux.
   - **Seguridad:** Aunque ha mejorado, Windows es históricamente más vulnerable a virus y malware debido a su popularidad y diseño.
   - **Estabilidad y Rendimiento:** Los servidores basados en Windows suelen requerir reinicios más frecuentes que los servidores Linux, lo que impacta su estabilidad a largo plazo.

2. **macOS:**
   - **Código Abierto vs. Privado:** macOS es un sistema operativo propietario, aunque está basado en Unix, similar a GNU/Linux en su núcleo, pero con acceso limitado al código fuente.
   - **Multitarea y Multiusuario:** macOS soporta multitarea y es multiusuario, pero está más orientado a usuarios individuales con un enfoque en la interfaz gráfica.
   - **Seguridad:** macOS es considerado seguro, con menos incidencia de malware en comparación con Windows, aunque sigue siendo menos personalizable que GNU/Linux.
   - **Estabilidad y Rendimiento:** macOS es estable, pero su rendimiento está optimizado principalmente para hardware Apple, limitando su portabilidad.

3. **FreeBSD:**
   - **Código Abierto:** Similar a GNU/Linux, FreeBSD es un sistema de código abierto, pero bajo una licencia BSD que permite mayor libertad en el uso del código sin necesidad de compartir modificaciones.
   - **Multitarea y Multiusuario:** FreeBSD también soporta multitarea y multiusuario, con una arquitectura similar a la de GNU/Linux, pero con un enfoque más especializado en redes y servidores.
   - **Seguridad:** Es altamente seguro y se enfoca en la estabilidad de los servidores, similar a GNU/Linux.
   - **Estabilidad y Rendimiento:** FreeBSD es conocido por su rendimiento en redes y servidores, ofreciendo una estabilidad comparable a GNU/Linux.

### (c) ¿Qué es GNU?

GNU es un proyecto iniciado por Richard Stallman en 1983 con el objetivo de desarrollar un sistema operativo completamente libre, similar a Unix pero sin restricciones de software propietario. El acrónimo GNU significa "GNU's Not Unix", reflejando su base en principios similares a Unix, pero con un enfoque en la libertad del software.

### (d) Indique una breve historia sobre la evolución del proyecto GNU

El proyecto GNU comenzó en 1983 con la visión de Richard Stallman de crear un sistema operativo completamente libre. Para lograr esto, se desarrollaron diversos componentes críticos como el compilador GCC (GNU Compiler Collection), el editor Emacs, y el sistema de bibliotecas GNU C Library (glibc). Sin embargo, a principios de los 90, el proyecto carecía de un kernel funcional. Esto cambió cuando Linus Torvalds creó el núcleo Linux en 1991, que fue licenciado bajo la GPL y se integró con los componentes de GNU, dando lugar al sistema GNU/Linux.

### (e) Explique qué es la multitarea, e indique si GNU/Linux hace uso de ella

La multitarea es la capacidad de un sistema operativo para ejecutar múltiples procesos o tareas simultáneamente. GNU/Linux implementa multitarea de manera eficiente mediante el uso de programación concurrente, donde el procesador cambia rápidamente entre tareas, lo que da la impresión de que se ejecutan al mismo tiempo. Además, GNU/Linux soporta la multitarea preemptiva, donde el sistema operativo decide qué proceso debe ejecutarse en un momento dado, mejorando la gestión de los recursos del sistema.

### (f) ¿Qué es POSIX?

POSIX (Portable Operating System Interface) es un estándar definido por IEEE que especifica interfaces de programación y comandos comunes que los sistemas operativos basados en Unix deben seguir para garantizar la compatibilidad y portabilidad entre sistemas. GNU/Linux sigue los estándares POSIX, lo que permite que las aplicaciones desarrolladas para otros sistemas Unix sean ejecutables en GNU/Linux con mínima modificación.


## Punto 2: Distribuciones de GNU/Linux

### (a) ¿Qué es una distribución de GNU/Linux? Nombre al menos 4 distribuciones de GNU/Linux y cite diferencias básicas entre ellas.

Una **distribución de GNU/Linux** (o "distro") es una versión del sistema operativo GNU/Linux que incluye el kernel de Linux junto con una colección de software y utilidades adicionales, generalmente empaquetadas para una experiencia de usuario específica. Las distribuciones pueden diferir en términos de herramientas administrativas, entornos de escritorio, sistemas de gestión de paquetes y objetivos del usuario final, entre otros.

1. **Debian:**
   - **Filosofía:** Debian se enfoca en la estabilidad, el software libre y el soporte a largo plazo.
   - **Sistema de Gestión de Paquetes:** Utiliza el sistema de paquetes `dpkg` y `APT`.
   - **Enfoque:** Ideal para servidores y estaciones de trabajo que requieren estabilidad y fiabilidad.

2. **Ubuntu:**
   - **Basada en:** Debian.
   - **Filosofía:** Ubuntu se centra en la facilidad de uso y tiene versiones regulares (cada 6 meses) y versiones de soporte a largo plazo (LTS).
   - **Enfoque:** Está orientada a usuarios finales, con un enfoque en la accesibilidad y la simplicidad, ideal para principiantes y entornos de escritorio.

3. **Fedora:**
   - **Basada en:** Red Hat.
   - **Filosofía:** Fedora se enfoca en la innovación, integrando las últimas tecnologías y software libre.
   - **Sistema de Gestión de Paquetes:** Utiliza el sistema de paquetes `RPM` con `dnf`.
   - **Enfoque:** Es ideal para desarrolladores y usuarios que buscan estar a la vanguardia de las tecnologías de Linux.

4. **Arch Linux:**
   - **Filosofía:** Arch sigue el principio KISS ("Keep It Simple, Stupid"), brindando una instalación mínima y dejando que el usuario configure su propio sistema según sus necesidades.
   - **Sistema de Gestión de Paquetes:** Usa `pacman`.
   - **Enfoque:** Orientada a usuarios avanzados que desean un control total sobre su sistema, con actualizaciones continuas y documentación exhaustiva.

### (b) ¿En qué se diferencia una distribución de otra?

Las distribuciones de GNU/Linux se diferencian en varios aspectos clave:

1. **Sistema de Gestión de Paquetes:** Las distros utilizan diferentes sistemas para instalar, actualizar y gestionar software. Por ejemplo, Debian y Ubuntu utilizan `APT` y `dpkg`, mientras que Fedora usa `dnf` y `RPM`, y Arch Linux utiliza `pacman`.

2. **Enfoque y Filosofía:** Algunas distribuciones priorizan la estabilidad y el soporte a largo plazo (Debian), mientras que otras se centran en ofrecer lo último en software y tecnología (Fedora). Otras, como Ubuntu, buscan un equilibrio entre usabilidad y funcionalidad para los usuarios finales.

3. **Entornos de Escritorio Predeterminados:** Las distribuciones también se diferencian en los entornos de escritorio que ofrecen por defecto. Por ejemplo, Ubuntu viene con GNOME, mientras que Fedora también ofrece GNOME pero con una configuración ligeramente diferente. Otras distribuciones permiten elegir entre múltiples entornos de escritorio durante la instalación.

4. **Soporte y Comunidad:** Algunas distribuciones están respaldadas por grandes corporaciones (Fedora por Red Hat, Ubuntu por Canonical), mientras que otras son mantenidas principalmente por comunidades voluntarias (Debian, Arch Linux).

5. **Objetivo del Usuario:** Mientras que distribuciones como Ubuntu están diseñadas para principiantes y usuarios de escritorio, distribuciones como Arch Linux están orientadas a usuarios avanzados que buscan personalización.

### (c) ¿Qué es Debian? Acceda al sitio e indique cuáles son los objetivos del proyecto y una breve cronología del mismo.

**Debian** es una distribución de GNU/Linux que se basa en principios de software libre y tiene como objetivo ser una plataforma robusta y estable para servidores y estaciones de trabajo. Fue fundada en 1993 por Ian Murdock y ha crecido hasta convertirse en una de las distribuciones más influyentes y utilizadas en el ecosistema de Linux.

- **Objetivos del Proyecto Debian:**
  - Proporcionar un sistema operativo completamente libre que respete las libertades de los usuarios.
  - Ofrecer estabilidad y fiabilidad a través de un proceso de desarrollo riguroso.
  - Mantener un repositorio amplio de software libre, garantizando que cualquier software pueda ser utilizado sin restricciones legales o éticas.
  - Asegurar que Debian pueda ser utilizado en una amplia variedad de arquitecturas de hardware.

- **Breve Cronología del Proyecto Debian:**
  - **1993:** Ian Murdock anuncia el proyecto Debian, inspirándose en la necesidad de una distribución que sea mantenida abierta y democráticamente.
  - **1994:** Se lanza la primera versión oficial de Debian.
  - **1996:** El proyecto crece y se introduce el "Debian Social Contract", que define los principios y objetivos del proyecto.
  - **1997:** Se publica Debian 1.3, la última versión que incluye el núcleo original de Linux.
  - **2000:** Debian introduce apt-get, que simplifica la gestión de paquetes y actualizaciones.
  - **2015:** Debian lanza Debian 8 "Jessie", que incluye systemd como sistema de inicio predeterminado.
  - **Actualidad:** Debian continúa siendo una distribución fundamental que sirve de base para muchas otras distribuciones, incluidas Ubuntu y Linux Mint.

Para más información sobre Debian, puedes visitar su [sitio oficial](https://www.debian.org/).

## Punto 3: Estructura de GNU/Linux

### (a) Nombre cuáles son los 3 componentes fundamentales de GNU/Linux

1. **Kernel (Núcleo):**
   Es el corazón del sistema operativo, responsable de gestionar el hardware, los recursos del sistema y la comunicación entre el hardware y el software. El kernel de Linux controla procesos, memoria, dispositivos de almacenamiento y periféricos, asegurando que las aplicaciones puedan interactuar con el hardware de manera eficiente y segura.

2. **Shell (Intérprete de Comandos):**
   Es la interfaz que permite a los usuarios interactuar con el sistema operativo. El shell toma comandos del usuario y los envía al kernel para que sean ejecutados. Puede ser una interfaz de línea de comandos (CLI), como `bash`, `zsh` o `sh`, o una interfaz gráfica de usuario (GUI), dependiendo de la distribución y la configuración.

3. **Sistema de Archivos (File System):**
   GNU/Linux organiza y almacena los datos en una estructura jerárquica de directorios. El sistema de archivos es esencial para la gestión y el acceso a los datos. Los diferentes tipos de sistemas de archivos, como ext4, XFS, o Btrfs, ofrecen características específicas en cuanto a rendimiento, seguridad y capacidad de recuperación de datos.

### (b) Mencione y explique la estructura básica del Sistema Operativo GNU/Linux

La estructura básica de GNU/Linux se puede dividir en capas, cada una de las cuales interactúa con la capa adyacente para proporcionar una funcionalidad completa del sistema operativo:

1. **Hardware:**
   La capa más baja de la estructura incluye todos los componentes físicos de la computadora: CPU, memoria, dispositivos de almacenamiento, redes y periféricos. Esta capa es la base sobre la que se ejecuta el sistema operativo.

2. **Kernel (Núcleo):**
   Encima del hardware se encuentra el kernel de Linux. El kernel es responsable de la comunicación directa con el hardware, gestionando recursos como la CPU, la memoria y los dispositivos de entrada/salida (I/O). También maneja las interrupciones y proporciona abstracciones que permiten a las aplicaciones acceder a los recursos del sistema sin necesidad de interactuar directamente con el hardware.

3. **Capa de Interfaz de Sistema y Bibliotecas:**
   Esta capa incluye las bibliotecas del sistema (como la `glibc`) y las llamadas al sistema, que permiten que las aplicaciones interactúen con el kernel. Las bibliotecas proporcionan funciones reutilizables que facilitan la creación de software sin necesidad de interactuar directamente con el kernel.

4. **Shell e Intérpretes de Comandos:**
   La capa de shell proporciona una interfaz para que los usuarios y scripts interactúen con el sistema operativo. Los shells permiten que los usuarios ejecuten comandos, manipulen archivos y procesos, y configuren el sistema. Los shells también ofrecen scripting, lo que permite la automatización de tareas.

5. **Aplicaciones y Entorno de Usuario:**
   En la capa superior se encuentran las aplicaciones que los usuarios ejecutan en el sistema, desde editores de texto como Vim o Emacs, hasta navegadores web o entornos gráficos de escritorio como GNOME o KDE. Estas aplicaciones dependen de las bibliotecas del sistema y el kernel para funcionar correctamente.

### Resumen de la estructura básica de GNU/Linux:
- **Hardware**: Capa física.
- **Kernel**: Gestión de recursos y comunicación con el hardware.
- **Bibliotecas del sistema y llamadas al sistema**: Soporte para la interacción de las aplicaciones con el kernel.
- **Shell**: Interfaz de usuario para interactuar con el sistema.
- **Aplicaciones**: Software que se ejecuta en el entorno del usuario.

Esta estructura jerárquica permite que el sistema operativo GNU/Linux sea modular, estable y eficiente.


## Punto 4: Kernel

### (a) ¿Qué es? Indique una breve reseña histórica acerca de la evolución del Kernel de GNU/Linux.

El **kernel** es el núcleo del sistema operativo GNU/Linux. Es responsable de la gestión de recursos del sistema, como la CPU, la memoria y los dispositivos de entrada/salida. Actúa como un intermediario entre el hardware y las aplicaciones, proporcionando una interfaz que permite a los programas interactuar con los componentes físicos de la máquina sin necesidad de gestionar directamente el hardware.

#### Breve Reseña Histórica:
- **1991:** Linus Torvalds, un estudiante de la Universidad de Helsinki, comienza a trabajar en el kernel de Linux como un proyecto personal. Publicó la primera versión, 0.01, el 17 de septiembre de 1991, en Usenet. Originalmente, el kernel de Linux era un núcleo monolítico básico, diseñado para ser utilizado en sistemas x86.
- **1992:** Torvalds adopta la licencia GPL (General Public License), lo que permite que el kernel se integre con el software del proyecto GNU. Esto dio origen a lo que hoy conocemos como el sistema operativo GNU/Linux.
- **1994:** Se lanza la versión 1.0 del kernel de Linux, marcando el inicio de su uso como sistema operativo completo.
- **2001:** Con la versión 2.4, el kernel de Linux empieza a soportar nuevas arquitecturas de hardware y mejoras en la gestión de memoria.
- **2003:** La versión 2.6 introduce importantes cambios en el proceso de desarrollo y escalabilidad del kernel, facilitando su adopción en sistemas embebidos y servidores de alto rendimiento.
- **2011:** Se lanza la versión 3.0, que trae mejoras en el rendimiento, soporte extendido para hardware moderno y optimizaciones para servidores y dispositivos móviles.
- **2015:** Con la versión 4.x, el kernel se adapta a nuevas tecnologías como sistemas de archivos avanzados (Btrfs) y soporte mejorado para virtualización y contenedores.
- **2019:** La versión 5.0 introduce nuevas funcionalidades como soporte para arquitecturas de hardware emergentes y mejoras en la seguridad y el rendimiento.

### (b) ¿Cuáles son sus funciones principales?

Las funciones principales del kernel de GNU/Linux son:

1. **Gestión de Procesos:** El kernel administra la creación, ejecución y finalización de procesos. También maneja la programación de procesos, asegurando que cada proceso obtenga su parte justa de tiempo de CPU.

2. **Gestión de Memoria:** El kernel gestiona la memoria del sistema, incluyendo la asignación de memoria a los procesos y la gestión de la memoria virtual. Esto incluye el intercambio de datos entre la RAM y el almacenamiento secundario cuando sea necesario.

3. **Gestión de Dispositivos (Drivers):** El kernel controla y coordina el acceso a los dispositivos de hardware a través de los controladores de dispositivos (drivers). Proporciona una interfaz estándar para que las aplicaciones interactúen con dispositivos como discos, impresoras, redes, etc.

4. **Gestión del Sistema de Archivos:** El kernel maneja el sistema de archivos, facilitando la creación, eliminación, lectura y escritura de archivos en diferentes tipos de sistemas de archivos, como ext4, XFS y Btrfs.

5. **Gestión de la Red:** El kernel facilita la comunicación en red a través de la gestión de protocolos de red y el control de acceso a interfaces de red. Esto incluye la configuración de la pila TCP/IP, enrutamiento y seguridad de red.

6. **Seguridad y Control de Acceso:** El kernel proporciona mecanismos de seguridad que controlan el acceso de los usuarios y procesos a los recursos del sistema. Esto incluye la gestión de permisos, autenticación y control de acceso a nivel de procesos.

### (c) ¿Cuál es la versión actual? ¿Cómo se definía el esquema de versionado del Kernel en versiones anteriores a la 2.4? ¿Qué cambió en el versionado se impuso a partir de la versión 2.6?

- **Versión Actual del Kernel:** Para saber la versión más reciente del kernel de Linux, es recomendable verificar la [página oficial de kernel.org](https://www.kernel.org/), ya que el desarrollo del kernel es continuo y nuevas versiones se publican regularmente.

#### Esquema de Versionado en Versiones Anteriores a 2.4:
El esquema de versionado del kernel de Linux en versiones anteriores a la 2.4 utilizaba tres números en el formato `X.Y.Z`. 
- `X`: Representa la versión principal.
- `Y`: Indica la versión secundaria. Si `Y` es un número par, indica una versión estable; si es impar, indica una versión en desarrollo.
- `Z`: Es el número de revisión o de corrección de errores (bug fixes).

Por ejemplo, la versión 1.2.13 sería una versión estable, mientras que la versión 1.3.15 indicaría una versión de desarrollo.

#### Cambios a partir de la Versión 2.6:
A partir de la versión 2.6, se abandonó la convención de numerar las versiones de desarrollo e ímpares. Se adoptó un nuevo enfoque en el que no se hace distinción entre versiones estables y en desarrollo. En cambio, cada versión incluye nuevas funcionalidades y mejoras, y el número de versión se incrementa de manera secuencial sin seguir la distinción par/impar.

### (d) ¿Es posible tener más de un Kernel de GNU/Linux instalado en la misma máquina?

Sí, es posible tener múltiples versiones del kernel de GNU/Linux instaladas en la misma máquina. Los sistemas basados en GNU/Linux permiten instalar varios núcleos al mismo tiempo, y al iniciar el sistema, el gestor de arranque (como GRUB) presenta un menú en el que el usuario puede elegir cuál kernel cargar. Esto es útil para probar nuevas versiones del kernel o para mantener una versión anterior en caso de que una actualización cause problemas.

### (e) ¿Dónde se encuentra ubicado dentro del File System?

El kernel de GNU/Linux se encuentra típicamente ubicado en el directorio `/boot`. Los archivos del kernel tienen nombres que generalmente comienzan con `vmlinuz` o `vmlinux`, seguidos por el número de versión correspondiente. Por ejemplo, `/boot/vmlinuz-5.10.0-8-amd64` podría ser un archivo de kernel en una instalación de Debian.

### (f) ¿El Kernel de GNU/Linux es monolítico? Justifique.

Sí, el kernel de GNU/Linux es **monolítico**, lo que significa que todo el código que maneja la gestión de procesos, la memoria, los sistemas de archivos, los controladores de dispositivos, y otros servicios del sistema se ejecutan en modo núcleo (kernel mode). En un kernel monolítico, todos los componentes del sistema operativo están integrados en una única imagen de kernel que se carga completamente en la memoria al inicio.

#### Justificación:
El kernel de GNU/Linux incluye controladores de dispositivos y otros módulos en su espacio de kernel, lo que permite un acceso más rápido y directo al hardware en comparación con un kernel microkernel, donde las funciones del sistema operativo están separadas en procesos que se ejecutan en espacio de usuario. Aunque es monolítico, GNU/Linux soporta módulos del kernel, que pueden ser cargados y descargados dinámicamente sin necesidad de reiniciar el sistema, lo que proporciona cierta flexibilidad.

## Punto 5: Intérprete de comandos (Shell)

### (a) ¿Qué es?

El **intérprete de comandos** o **shell** es una interfaz que permite a los usuarios interactuar con el sistema operativo a través de comandos de texto. Actúa como un intermediario entre el usuario y el kernel de GNU/Linux, interpretando los comandos que el usuario ingresa y ejecutando las instrucciones correspondientes en el sistema. Aunque comúnmente asociado con la línea de comandos (CLI), también existen shells gráficos que permiten la interacción a través de interfaces visuales.

### (b) ¿Cuáles son sus funciones?

Las principales funciones del shell son:

1. **Interpretar comandos:** El shell recibe los comandos ingresados por el usuario, los interpreta y envía las instrucciones al kernel para que sean ejecutadas.
2. **Ejecución de programas:** Permite la ejecución de programas y scripts, gestionando las interacciones entre las aplicaciones y el sistema operativo.
3. **Automatización de tareas:** A través de scripting, el shell permite la creación de scripts que automatizan tareas repetitivas, como copias de seguridad o la ejecución de secuencias de comandos.
4. **Gestión de procesos:** El shell permite iniciar, detener y monitorear procesos, así como realizar redirección de entradas y salidas de los mismos.
5. **Navegación del sistema de archivos:** Facilita la navegación y manipulación del sistema de archivos, permitiendo listar, mover, copiar y eliminar archivos y directorios.

### (c) Mencione al menos 3 intérpretes de comandos que posee GNU/Linux y compárelos entre ellos.

1. **Bash (Bourne Again Shell):**
   - **Popularidad:** Bash es el shell predeterminado en muchas distribuciones de GNU/Linux.
   - **Características:** Soporte avanzado para scripting, autocompletado, manejo de historial y una amplia compatibilidad con scripts escritos para `sh` (Bourne shell).
   - **Ventaja:** Gran comunidad de usuarios y documentación extensa, lo que lo convierte en la opción más común y recomendada para usuarios y desarrolladores.

2. **Zsh (Z Shell):**
   - **Popularidad:** Utilizado por usuarios avanzados y conocido por su alto grado de personalización.
   - **Características:** Ofrece más funcionalidades que Bash, como autocompletado más inteligente, globbing avanzado (expansión de comodines) y temas visuales a través de `Oh My Zsh`.
   - **Ventaja:** Mayor flexibilidad y personalización, especialmente en lo que respecta a la interfaz de usuario y los atajos de teclado.

3. **Fish (Friendly Interactive Shell):**
   - **Popularidad:** Creciente, especialmente entre los usuarios que buscan un shell más amigable y con una experiencia fuera de la caja.
   - **Características:** Ofrece autocompletado inteligente, resaltado de sintaxis, y configuraciones predeterminadas optimizadas, sin necesidad de archivos de configuración complejos.
   - **Ventaja:** Mayor facilidad de uso para principiantes y usuarios que prefieren una configuración mínima, con soporte para características avanzadas sin necesidad de personalización adicional.

#### Comparación:
- **Bash** es ideal para la mayoría de los usuarios debido a su equilibrio entre funcionalidad y simplicidad.
- **Zsh** es preferido por aquellos que buscan personalización y características avanzadas.
- **Fish** ofrece una experiencia más amigable, especialmente para usuarios que no desean invertir mucho tiempo en configuraciones, pero puede carecer de algunas funciones de scripting avanzadas de Bash y Zsh.

### (d) ¿Dónde se ubican (path) los comandos propios y externos al Shell?

- **Comandos propios del Shell:** Los comandos internos (o "built-ins") del shell son parte del propio intérprete de comandos y no se encuentran como archivos independientes en el sistema de archivos. Estos comandos se ejecutan directamente dentro del proceso del shell.
- **Comandos externos:** Los comandos externos son programas independientes ubicados en diferentes directorios del sistema. Algunos de los directorios más comunes donde se encuentran estos comandos son:
  - `/bin`: Contiene binarios esenciales para el sistema, como `ls`, `cp`, `mv`.
  - `/usr/bin`: Contiene la mayoría de los comandos de usuario, como `vim`, `grep`.
  - `/sbin` y `/usr/sbin`: Contienen comandos administrativos y de superusuario, como `ifconfig` y `fdisk`.

El shell utiliza la variable de entorno `PATH` para buscar los comandos externos. Esta variable contiene una lista de directorios en los que el shell buscará los comandos que se ingresan.

### (e) ¿Por qué considera que el Shell no es parte del Kernel de GNU/Linux?

El shell no es parte del kernel porque se ejecuta en el **espacio de usuario** (user space), mientras que el kernel opera en el **espacio de kernel** (kernel space). Esta separación es fundamental en la arquitectura de los sistemas operativos modernos:

1. **Seguridad y estabilidad:** Al mantener el shell y otras aplicaciones fuera del kernel, se reduce el riesgo de que errores o fallos en el shell afecten la estabilidad general del sistema.
2. **Modularidad:** La modularidad permite que múltiples shells puedan interactuar con el mismo kernel sin necesidad de modificar el núcleo del sistema operativo. Esto también permite que los usuarios elijan diferentes shells según sus necesidades.

El kernel gestiona directamente el hardware y los recursos del sistema, mientras que el shell proporciona una interfaz para que los usuarios interactúen con el sistema operativo sin involucrarse directamente con las operaciones a nivel de kernel.

### (f) ¿Es posible definir un intérprete de comandos distinto para cada usuario? ¿Desde dónde se define? ¿Cualquier usuario puede realizar dicha tarea?

Sí, es posible definir un intérprete de comandos distinto para cada usuario en GNU/Linux.

- **Desde dónde se define:** El shell predeterminado de un usuario se especifica en el archivo `/etc/passwd`, que contiene información sobre las cuentas de usuario. La última columna de la línea correspondiente a cada usuario indica el shell predeterminado. Por ejemplo:

  ```plaintext
  usuario:x:1000:1000:Usuario:/home/usuario:/bin/Bash

En este caso, el shell predeterminado es Bash (/bin/bash). Para cambiar el shell de un usuario, se puede utilizar el comando chsh (change shell) seguido de la ruta al nuevo shell.

- **¿Cualquier usuario puede realizar dicha tarea?**
Un usuario puede cambiar su propio shell utilizando el comando chsh, siempre que el nuevo shell esté listado en el archivo /etc/shells, que contiene los shells permitidos en el sistema. Sin embargo, los usuarios no pueden cambiar el shell de otros usuarios sin privilegios de administrador (superusuario). Para cambiar el shell de otro usuario, es necesario tener privilegios de root o utilizar comandos administrativos como usermod.

## Punto 6: Sistema de Archivos (File System)

### (a) ¿Qué es?

Un **sistema de archivos** (File System) es la estructura y el método que utiliza un sistema operativo para almacenar, organizar y gestionar los archivos en un dispositivo de almacenamiento, como un disco duro o una unidad SSD. Un sistema de archivos define cómo se guardan los datos en el dispositivo, cómo se organizan en directorios y cómo se accede a ellos mediante nombres de archivo. También gestiona la asignación de espacio en el dispositivo y proporciona métodos para controlar el acceso a los archivos.

En GNU/Linux, el sistema de archivos tiene una estructura jerárquica de directorios, donde todos los archivos y directorios parten de un único punto llamado raíz (`/`).

### (b) Mencione sistemas de archivos soportados por GNU/Linux.

GNU/Linux es compatible con una amplia variedad de sistemas de archivos. Algunos de los más comunes son:

1. **ext4 (Fourth Extended Filesystem):** Es el sistema de archivos más utilizado en distribuciones GNU/Linux modernas. Ofrece buenas prestaciones en términos de rendimiento y confiabilidad, además de soporte para grandes volúmenes de datos.
2. **Btrfs (B-tree File System):** Conocido por sus capacidades avanzadas, como la creación de instantáneas (snapshots), compresión de datos, y mejoras en la gestión de volúmenes.
3. **XFS:** Diseñado para escalabilidad y rendimiento en sistemas de alto rendimiento, como servidores. Es altamente eficiente en la manipulación de archivos grandes y cargas de trabajo intensivas.
4. **FAT32:** Un sistema de archivos más antiguo pero ampliamente compatible, especialmente en dispositivos portátiles y multimedia.
5. **NTFS (New Technology File System):** Sistema de archivos utilizado por Windows. GNU/Linux soporta NTFS a través de herramientas como `ntfs-3g`, lo que permite leer y escribir en particiones NTFS.
6. **ReiserFS:** Un sistema de archivos diseñado para manejar una gran cantidad de archivos pequeños con buen rendimiento. Aunque ha caído en desuso, aún es soportado por muchas distribuciones.

### (c) ¿Es posible visualizar particiones del tipo FAT y NTFS en GNU/Linux?

Sí, GNU/Linux puede visualizar y trabajar con particiones FAT y NTFS. 

- **FAT (FAT16/FAT32):** GNU/Linux soporta de manera nativa la lectura y escritura en sistemas de archivos FAT. Es común en dispositivos portátiles como memorias USB y tarjetas SD.
- **NTFS:** Para trabajar con particiones NTFS, GNU/Linux utiliza el controlador `ntfs-3g`, que permite tanto la lectura como la escritura en particiones NTFS. Este soporte es útil cuando se trabaja con sistemas de archivos de Windows en sistemas dual-boot o en discos externos formateados en NTFS.

### (d) ¿Cuál es la estructura básica de los File System en GNU/Linux? Mencione los directorios más importantes e indique qué tipo de información se encuentra en ellos. ¿A qué hace referencia la sigla FHS?

La estructura básica de un sistema de archivos en GNU/Linux sigue un formato jerárquico, donde todo parte del directorio raíz (`/`). A continuación, se describen algunos de los directorios más importantes:

1. **`/`:** El directorio raíz. Contiene todos los archivos y subdirectorios del sistema.
2. **`/bin`:** Contiene binarios esenciales del sistema que son necesarios para el arranque y operación básica del sistema. Ejemplos incluyen `ls`, `cp`, `mv`.
3. **`/boot`:** Almacena los archivos necesarios para el arranque del sistema, incluyendo el kernel (`vmlinuz`) y los archivos del gestor de arranque (como GRUB).
4. **`/etc`:** Contiene archivos de configuración del sistema y de los programas instalados. Ejemplos incluyen archivos de configuración de red, servicios, y el archivo `passwd`.
5. **`/home`:** Directorio donde se encuentran los directorios personales de los usuarios. Cada usuario tiene su propio directorio, como `/home/usuario`.
6. **`/lib`:** Contiene bibliotecas compartidas necesarias para los binarios esenciales ubicados en `/bin` y `/sbin`.
7. **`/mnt`:** Punto de montaje temporal para sistemas de archivos. Generalmente se usa para montar particiones de manera manual.
8. **`/opt`:** Contiene aplicaciones opcionales instaladas en el sistema. Este directorio se usa para programas que no forman parte de la instalación estándar.
9. **`/sbin`:** Contiene binarios esenciales para tareas administrativas del sistema, como `fdisk`, `ifconfig`, etc. Estos comandos suelen estar restringidos a root o a usuarios con privilegios.
10. **`/usr`:** Contiene aplicaciones y utilidades adicionales del sistema, incluidas las bibliotecas, binarios y documentación.
11. **`/var`:** Contiene archivos variables, como logs del sistema, datos de aplicaciones que cambian con frecuencia, y colas de impresión.
12. **`/dev`:** Contiene archivos de dispositivos que representan hardware del sistema, como discos (`/dev/sda`), terminales (`/dev/tty`), etc.
13. **`/proc`:** Sistema de archivos virtual que contiene información sobre los procesos en ejecución y el estado del kernel.

#### FHS

La sigla **FHS** hace referencia a **Filesystem Hierarchy Standard** (Estándar de Jerarquía del Sistema de Archivos), que define la estructura y disposición de los directorios y archivos en los sistemas GNU/Linux. FHS tiene como objetivo garantizar la interoperabilidad y consistencia entre diferentes distribuciones de GNU/Linux, proporcionando una organización estándar para los archivos del sistema.

## Punto 7: Particiones

### (a) Definición. Tipos de particiones. Ventajas y Desventajas.

Una **partición** es una división lógica de un disco duro o unidad de almacenamiento que permite al sistema operativo gestionar y organizar los datos de manera eficiente. Un disco puede contener una o más particiones, cada una con su propio sistema de archivos.

**Tipos de particiones:**

1. **Primarias:** 
   - **Definición:** Son las particiones principales que pueden contener sistemas de archivos y desde las cuales se puede iniciar el sistema operativo.
   - **Ventajas:** Permiten el arranque del sistema operativo.
   - **Desventajas:** El número de particiones primarias está limitado a cuatro en el esquema de particionamiento MBR.

2. **Extendidas:** 
   - **Definición:** Una partición extendida es un contenedor que puede albergar múltiples particiones lógicas. Solo puede haber una partición extendida en un disco.
   - **Ventajas:** Permite superar la limitación de cuatro particiones primarias en MBR.
   - **Desventajas:** No se puede arrancar directamente desde una partición extendida.

3. **Lógicas:** 
   - **Definición:** Son particiones que se encuentran dentro de una partición extendida. Funcionan como si fueran primarias, pero no pueden ser utilizadas para el arranque directo del sistema.
   - **Ventajas:** Permiten una mayor flexibilidad en la cantidad de particiones.
   - **Desventajas:** Requieren la existencia de una partición extendida.

**Ventajas de las particiones:**
- Organización de datos: Facilitan la separación de datos del sistema operativo, lo que mejora la seguridad y la gestión.
- Multi-sistema operativo: Permiten la instalación de múltiples sistemas operativos en un mismo disco.
- Mantenimiento: Facilitan el formateo y reinstalación del sistema operativo sin afectar los datos personales.

**Desventajas:**
- Espacio desperdiciado: Es posible que el espacio no utilizado en una partición no pueda ser asignado a otras particiones de manera sencilla.
- Complejidad en la gestión: Requiere un entendimiento claro de las necesidades del sistema para planificar el particionamiento de manera efectiva.

### (b) ¿Cómo se identifican las particiones en GNU/Linux? (Considere discos IDE, SCSI y SATA).

En GNU/Linux, las particiones se identifican mediante nombres de dispositivo que dependen del tipo de controlador del disco:

- **IDE:** Los discos IDE se identifican como `/dev/hda`, `/dev/hdb`, etc. Las particiones en estos discos se numeran como `/dev/hda1`, `/dev/hda2`, y así sucesivamente.
- **SCSI y SATA:** Los discos SCSI y SATA se identifican como `/dev/sda`, `/dev/sdb`, etc. Las particiones en estos discos se numeran como `/dev/sda1`, `/dev/sda2`, etc.

El identificador de partición consiste en el nombre del dispositivo seguido de un número que indica la partición específica en ese disco.

### (c) ¿Cuántas particiones son necesarias como mínimo para instalar GNU/Linux? Nómbrelas indicando tipo de partición, identificación, tipo de File System y punto de montaje.

Para instalar GNU/Linux se requieren al menos dos particiones:

1. **Partición raíz (`/`):**
   - **Tipo de partición:** Primaria o lógica.
   - **Identificación:** `/dev/sda1` (ejemplo).
   - **Tipo de File System:** `ext4` (u otro sistema de archivos soportado).
   - **Punto de montaje:** `/`.
   - **Función:** Contiene todos los archivos del sistema operativo y los programas instalados.

2. **Partición de intercambio (swap):**
   - **Tipo de partición:** Primaria o lógica.
   - **Identificación:** `/dev/sda2` (ejemplo).
   - **Tipo de File System:** `swap`.
   - **Punto de montaje:** No tiene punto de montaje.
   - **Función:** Se utiliza como memoria virtual cuando la RAM física está completa. Ayuda en la gestión de procesos y mejora la estabilidad del sistema.

Opcionalmente, se puede agregar una partición para `/home`, que contiene los datos y configuraciones de los usuarios, permitiendo una separación clara entre los archivos del sistema y los datos personales.

### (d) Ejemplifique diversos casos de particionamiento dependiendo del tipo de tarea que se deba realizar en su sistema operativo.

1. **Servidor web:**
   - **`/`:** (Raíz) – 20 GB.
   - **`/var`:** (Datos de aplicaciones web, logs) – 50 GB.
   - **`/home`:** (Datos de usuarios) – 10 GB.
   - **`swap`:** – Tamaño equivalente a la RAM o 1.5 veces.

2. **Sistema de escritorio general:**
   - **`/`:** (Raíz) – 30 GB.
   - **`/home`:** (Archivos personales) – Resto del espacio disponible.
   - **`swap`:** – Tamaño equivalente a la RAM.

3. **Sistema de pruebas y desarrollo:**
   - **`/`:** (Raíz) – 50 GB.
   - **`/home`:** (Datos personales) – 100 GB.
   - **`/opt`:** (Software adicional y herramientas de desarrollo) – 50 GB.
   - **`swap`:** – Tamaño equivalente a la RAM o 1.5 veces.

### (e) ¿Qué tipo de software para particionar existe? Menciónelos y compare.

1. **GParted:** 
   - **Descripción:** Es una interfaz gráfica para `parted`, una herramienta de particionamiento. Permite crear, eliminar, redimensionar y mover particiones de manera intuitiva.
   - **Ventajas:** Fácil de usar, compatible con una gran cantidad de sistemas de archivos.
   - **Desventajas:** Necesita un entorno gráfico.

2. **fdisk:**
   - **Descripción:** Es una herramienta de línea de comandos para gestionar particiones en discos con particionamiento MBR.
   - **Ventajas:** Ligero y accesible desde la terminal.
   - **Desventajas:** No soporta particiones GPT y carece de una interfaz gráfica.

3. **parted:**
   - **Descripción:** Similar a `fdisk`, pero con soporte para GPT y una interfaz más avanzada para el manejo de particiones.
   - **Ventajas:** Soporta discos GPT, puede redimensionar particiones sin pérdida de datos.
   - **Desventajas:** Línea de comandos, lo que puede ser intimidante para principiantes.

4. **cfdisk:**
   - **Descripción:** Una versión de `fdisk` con una interfaz de usuario basada en texto que facilita la creación y modificación de particiones.
   - **Ventajas:** Interfaz de texto amigable.
   - **Desventajas:** Similar a `fdisk`, no soporta GPT.

## Punto 8: Arranque (bootstrap) de un Sistema Operativo

### (a) ¿Qué es el BIOS? ¿Qué tarea realiza?

El **BIOS** (Basic Input/Output System) es un firmware de bajo nivel que se ejecuta al encender una computadora. Su principal tarea es inicializar y verificar el hardware del sistema, como la CPU, la RAM y los dispositivos de almacenamiento, y luego cargar el cargador de arranque (bootloader) desde el dispositivo de arranque principal (disco duro, unidad USB, etc.) para iniciar el sistema operativo.

### (b) ¿Qué es UEFI? ¿Cuál es su función?

El **UEFI** (Unified Extensible Firmware Interface) es el sucesor del BIOS, proporcionando una interfaz de firmware más moderna y funcional. UEFI realiza las mismas tareas que el BIOS, pero con mejoras como:
- Soporte para discos de mayor tamaño (más de 2 TB).
- Tiempo de arranque más rápido.
- Interfaz gráfica en lugar de solo texto.
- Mejor soporte de seguridad, como Secure Boot.

### (c) ¿Qué es el MBR? ¿Qué es el MBC?

- **MBR (Master Boot Record):** Es el primer sector de un disco duro que contiene la tabla de particiones y el código de arranque necesario para iniciar el sistema operativo. Su estructura limita el número de particiones primarias a cuatro y el tamaño de los discos a 2 TB.
  
- **MBC (Master Boot Code):** Es el código de arranque almacenado en el MBR que se ejecuta durante el proceso de inicio para cargar el gestor de arranque y, posteriormente, el sistema operativo.

### (d) ¿A qué hacen referencia las siglas GPT? ¿Qué sustituye? Indique cuál es su formato.

**GPT (GUID Partition Table)** es un esquema de particionamiento que reemplaza al MBR. A diferencia del MBR, GPT soporta discos de mayor tamaño y un número casi ilimitado de particiones. Utiliza identificadores únicos globales (GUID) para identificar las particiones.

**Formato:** GPT almacena múltiples copias de la tabla de particiones a lo largo del disco, lo que lo hace más robusto en caso de corrupción de datos. También utiliza un CRC (Cyclic Redundancy Check) para verificar la integridad de la tabla de particiones.

### (e) ¿Cuál es la funcionalidad de un “Gestor de Arranque”? ¿Qué tipos existen? ¿Dónde se instalan? Cite gestores de arranque conocidos.

Un **gestor de arranque** (bootloader) es un software responsable de cargar el sistema operativo en la memoria RAM y darle control del sistema cuando la computadora arranca. Este software se encuentra en la primera etapa del proceso de inicio, justo después de la ejecución del BIOS o UEFI.

**Funcionalidades:**
- Cargar el kernel del sistema operativo en la memoria.
- Permitir seleccionar entre diferentes sistemas operativos (en caso de sistemas dual-boot).
- Pasar parámetros al kernel del sistema operativo.

**Tipos de gestores de arranque:**
1. **GRUB (GRand Unified Bootloader):**
   - **Descripción:** Es uno de los gestores de arranque más comunes en sistemas GNU/Linux. Soporta múltiples sistemas operativos y es altamente configurable.
   - **Instalación:** Generalmente se instala en el MBR (en sistemas BIOS) o en la partición de arranque EFI (en sistemas UEFI).
   
2. **LILO (LInux LOader):**
   - **Descripción:** Un gestor de arranque más antiguo que GRUB, que ha caído en desuso. Ofrece menos características y flexibilidad en comparación con GRUB.
   - **Instalación:** Se instala en el MBR o en el primer sector de una partición.

3. **Syslinux/Extlinux:**
   - **Descripción:** Un conjunto de gestores de arranque que se utiliza principalmente para medios extraíbles, como unidades USB o discos de arranque en red.
   - **Instalación:** Puede instalarse en el MBR o en una partición específica.

4. **rEFInd:**
   - **Descripción:** Un gestor de arranque UEFI que facilita la selección y arranque de múltiples sistemas operativos en sistemas modernos que utilizan UEFI.
   - **Instalación:** Se instala en la partición de arranque EFI.

### (f) ¿Cuáles son los pasos que se suceden desde que se prende una computadora hasta que el Sistema Operativo es cargado (proceso de bootstrap)?

El proceso de arranque de un sistema operativo, conocido como **bootstrap**, sigue estos pasos generales:

1. **Power-On Self Test (POST):** Al encender la computadora, el BIOS o UEFI realiza una serie de pruebas para verificar el hardware básico del sistema (CPU, RAM, dispositivos de almacenamiento, etc.).
   
2. **Carga del firmware (BIOS/UEFI):** Una vez completado el POST, el BIOS o UEFI busca el dispositivo de arranque (disco duro, unidad USB, etc.) especificado en la configuración.

3. **Carga del gestor de arranque:** El BIOS/UEFI carga el gestor de arranque desde el dispositivo de arranque. En sistemas BIOS, se lee el código del MBR; en sistemas UEFI, se busca el gestor de arranque en la partición EFI.

4. **Selección del sistema operativo:** Si hay múltiples sistemas operativos instalados, el gestor de arranque muestra un menú para seleccionar uno. Si solo hay un sistema operativo, el gestor de arranque lo carga automáticamente.

5. **Carga del kernel:** El gestor de arranque carga el kernel del sistema operativo seleccionado en la memoria y le transfiere el control.

6. **Inicialización del kernel:** El kernel inicializa el hardware del sistema, monta el sistema de archivos raíz, y lanza el proceso `init` o `systemd`, que luego inicia todos los servicios y demonios necesarios para arrancar el sistema operativo completamente.

7. **Carga del entorno de usuario:** Una vez que el kernel ha completado su inicialización, el sistema de inicio lanza los servicios de usuario y, en el caso de sistemas de escritorio, carga el entorno gráfico o la terminal de comandos.

### (g) Analice el proceso de arranque en GNU/Linux y describa sus principales pasos.

El proceso de arranque en GNU/Linux sigue los siguientes pasos:

1. **Inicialización del BIOS/UEFI:** Se ejecuta el firmware del sistema, que realiza las pruebas de hardware (POST) y busca el gestor de arranque en el dispositivo de arranque configurado.
   
2. **Gestor de arranque:** El gestor de arranque (como GRUB) carga y ejecuta el kernel de GNU/Linux en la memoria.

3. **Carga del kernel:** El kernel de GNU/Linux se carga en la memoria y toma control del sistema. Durante esta etapa, el kernel detecta y configura el hardware, y luego monta el sistema de archivos raíz especificado.

4. **Inicialización del sistema:** Después de montar el sistema de archivos raíz, el kernel lanza el primer proceso de usuario (`init` o `systemd`), que se encarga de iniciar todos los servicios y demonios necesarios para el funcionamiento del sistema operativo.

5. **Login:** Finalmente, el sistema presenta la pantalla de inicio de sesión o el entorno gráfico de escritorio, permitiendo al usuario interactuar con el sistema.

### (h) ¿Cuáles son los pasos que se suceden en el proceso de parada (shutdown) de GNU/Linux?

El proceso de apagado de un sistema GNU/Linux sigue estos pasos:

1. **Solicitud de apagado:** El usuario o el sistema emite un comando para apagar el sistema (`shutdown`, `halt`, `poweroff`, etc.).
   
2. **Notificación a los procesos:** `systemd` o el sistema de inicio correspondiente notifica a todos los procesos en ejecución para que se detengan de manera ordenada. Se les envía la señal `SIGTERM`, permitiéndoles cerrar archivos y liberar recursos.

3. **Detención de servicios:** Todos los servicios y demonios del sistema se detienen uno por uno. Los sistemas de archivos se desmontan y los dispositivos se sincronizan.

4. **Detención del kernel:** Una vez que todos los servicios han sido detenidos y los sistemas de archivos desmontados, el kernel apaga la CPU y otros componentes del hardware, completando el proceso de apagado.

5. **Apagado físico:** Finalmente, el hardware de la máquina se apaga completamente.

### (i) ¿Es posible tener en una PC GNU/Linux y otro Sistema Operativo instalado? Justifique.

Sí, es posible tener en una PC GNU/Linux junto con otro sistema operativo (como Windows o macOS) en una configuración conocida como **dual-boot** o **multi-boot**. Esto se logra particionando el disco para que cada sistema operativo tenga su propia partición dedicada. El gestor de arranque, como GRUB, se encarga de gestionar el proceso de arranque, permitiendo al usuario seleccionar cuál sistema operativo cargar al iniciar la computadora.

La justificación para utilizar un sistema de arranque dual podría incluir la necesidad de utilizar software específico para cada sistema operativo o la preferencia por un entorno diferente según la tarea en cuestión.


## 9. Archivos:

### (a) ¿Cómo se identifican los archivos en GNU/Linux?

En GNU/Linux, los archivos se identifican principalmente mediante **nombres de archivo** y **rutas**. Cada archivo tiene una ruta que puede ser absoluta (comenzando desde el directorio raíz `/`, como `/home/usuario/documento.txt`) o relativa (desde el directorio actual, como `documento.txt`). 

Cada archivo también tiene un **inode**, que es una estructura de datos que almacena metadatos sobre el archivo, como permisos, propietario, tamaño y ubicación en el sistema de archivos, pero no su nombre. El nombre del archivo es una entrada en el directorio que se refiere a su inode.

### (b) Investigue el funcionamiento de los editores vi y mcedit, y los comandos cat y more.

- **vi:**
  - **Descripción:** `vi` es un editor de texto modal. Tiene dos modos principales: el modo de comando (para ejecutar comandos) y el modo de inserción (para editar texto).
  - **Uso básico:**
    - Para abrir un archivo: `vi nombre_del_archivo`
    - En modo de inserción: Presionar `i` para comenzar a editar.
    - Para guardar y salir: Presionar `Esc`, luego escribir `:wq` y presionar `Enter`.

- **mcedit:**
  - **Descripción:** `mcedit` es el editor de texto de Midnight Commander, un administrador de archivos con interfaz basada en texto. Es más intuitivo que `vi` y proporciona una interfaz gráfica simple.
  - **Uso básico:**
    - Para abrir un archivo: `mcedit nombre_del_archivo`
    - Guardar cambios: Presionar `F2`.
    - Salir del editor: Presionar `F10`.

- **cat:**
  - **Descripción:** `cat` (concatenate) es un comando para mostrar el contenido de archivos en la terminal o concatenar varios archivos.
  - **Uso básico:**
    - Mostrar el contenido de un archivo: `cat archivo.txt`
    - Concatenar varios archivos: `cat archivo1.txt archivo2.txt > archivo_concatenado.txt`

- **more:**
  - **Descripción:** `more` es un comando para visualizar archivos de texto en páginas, permitiendo avanzar página por página.
  - **Uso básico:**
    - Mostrar un archivo con paginación: `more archivo.txt`
    - Navegar con la barra espaciadora para avanzar una página, y `b` para retroceder.

### (c) Cree un archivo llamado “prueba.exe” en su directorio personal usando el vi. El mismo debe contener su número de alumno y su nombre.

        nvim prueba.exe
        :wq!
### (d) Investigue el funcionamiento del comando file. Pruébelo con diferentes archivos. ¿Qué diferencia nota?

**Funcionamiento del comando `file`:**

El comando `file` determina el tipo de un archivo examinando su contenido en lugar de basarse únicamente en la extensión del archivo. Este comando utiliza una base de datos de firmas de archivos para identificar el tipo de datos que contiene un archivo. 
Diferencias observadas:

- Dependencia de la extensión: A diferencia de los sistemas que se basan en extensiones de archivo, el comando file no depende de la extensión para identificar el tipo de archivo. Por ejemplo, un archivo .jpg que en realidad es un archivo de texto será identificado correctamente como texto, mientras que un archivo .txt que es binario también será identificado adecuadamente.
- Identificación precisa: file puede identificar el contenido real del archivo, lo que es útil para tratar con archivos que han sido renombrados o que no tienen una extensión que refleje su contenido.
- Versatilidad: El comando puede reconocer una amplia variedad de formatos de archivo, desde texto y scripts hasta imágenes y documentos complejos como PDF, proporcionando una descripción detallada basada en el contenido del archivo.

## 10. Indique qué comando es necesario utilizar para realizar cada una de las siguientes acciones. Investigue su funcionamiento y parámetros más importantes:
### (a) Cree la carpeta ISO2017
        mkdir ISO2017
### (b) Acceda a la carpeta (cd)
        cd ISO2017
### (c) Cree dos archivos con los nombres iso2017-1 e iso2017-2 (touch)
        touch iso2017-1 && touch iso2017-2
### (d) Liste el contenido del directorio actual (ls)]
        ls
### (e) Visualizar la ruta donde estoy situado (pwd)
        pwd
### (f) Busque todos los archivos en los que su nombre contiene la cadena “iso*” (find)
        find . -name '*iso*'
### (g) Informar la cantidad de espacio libre en disco (df)
        df -h
### (h) Verifique los usuarios conectado al sistema (who)
        who
### (i) Acceder a el archivo iso2017-1 e ingresar Nombre y Apellido
        nvim iso2017-1
        :wq!
### (j) Mostrar en pantalla las últimas líneas de un archivo (tail).
        tail iso2017-1

## 11. Investigue su funcionamiento y parámetros más importantes:

### (a) `shutdown`
- **Descripción:** `shutdown` se utiliza para apagar o reiniciar el sistema de manera segura. Finaliza todos los procesos antes de apagar el sistema, lo que previene la pérdida de datos.
- **Sintaxis básica:**
  ```bash
  shutdown [opciones] [tiempo] [mensaje]
  ```
- **Parámetros importantes:**
  - `-h`: Apaga el sistema.
  - `-r`: Reinicia el sistema después del apagado.
  - `-c`: Cancela un apagado o reinicio programado.
  - `+m`: Define el tiempo de espera en minutos antes de apagar o reiniciar el sistema.
  - `now`: Apaga o reinicia el sistema de manera inmediata.

### (b) `reboot`
- **Descripción:** `reboot` reinicia el sistema de manera inmediata, sin invocar necesariamente a `shutdown`.
- **Sintaxis básica:**
  ```bash
  reboot [opciones]
  ```
- **Parámetros importantes:**
  - `-f`: Fuerza el reinicio del sistema sin realizar un apagado limpio.
  - `-p`: Apaga el sistema de manera similar a `poweroff`.

### (c) `halt`
- **Descripción:** `halt` detiene todas las operaciones del sistema, detiene la CPU y apaga la máquina.
- **Sintaxis básica:**
  ```bash
  halt [opciones]
  ```
- **Parámetros importantes:**
  - `-f`: Fuerza la detención del sistema sin realizar un apagado limpio.
  - `-p`: Apaga el sistema por completo, similar a `poweroff`.

### (d) `locate`
- **Descripción:** `locate` busca archivos en la base de datos del sistema de archivos, lo que hace la búsqueda muy rápida.
- **Sintaxis básica:**
  ```bash
  locate [opciones] nombre_del_archivo
  ```
- **Parámetros importantes:**
  - `-i`: Realiza la búsqueda sin diferenciar entre mayúsculas y minúsculas.
  - `-n N`: Muestra solo los primeros `N` resultados.

### (e) `uname`
- **Descripción:** `uname` muestra información sobre el sistema operativo y el kernel.
- **Sintaxis básica:**
  ```bash
  uname [opciones]
  ```
- **Parámetros importantes:**
  - `-a`: Muestra toda la información disponible del sistema.
  - `-r`: Muestra la versión del kernel.
  - `-m`: Muestra el tipo de arquitectura del sistema.

### (f) `dmesg`
- **Descripción:** `dmesg` muestra mensajes del kernel, que son útiles para diagnosticar problemas del hardware y del sistema.
- **Sintaxis básica:**
  ```bash
  dmesg [opciones]
  ```
- **Parámetros importantes:**
  - `-C`: Borra el búfer de mensajes del kernel.
  - `-T`: Muestra las marcas de tiempo en formato legible.

### (g) `lspci`
- **Descripción:** `lspci` lista todos los dispositivos PCI conectados al sistema.
- **Sintaxis básica:**
  ```bash
  lspci [opciones]
  ```
- **Parámetros importantes:**
  - `-v`: Muestra información detallada de los dispositivos PCI.
  - `-k`: Muestra los controladores asociados a los dispositivos PCI.

### (h) `at`
- **Descripción:** `at` programa la ejecución de comandos en un momento específico en el futuro.
- **Sintaxis básica:**
  ```bash
  at [hora]
  ```
- **Parámetros importantes:**
  - `-l`: Lista los trabajos programados.
  - `-c`: Muestra el contenido de un trabajo programado.

### (i) `netstat`
- **Descripción:** `netstat` muestra estadísticas de red, conexiones activas y tablas de enrutamiento.
- **Sintaxis básica:**
  ```bash
  netstat [opciones]
  ```
- **Parámetros importantes:**
  - `-a`: Muestra todas las conexiones activas y los puertos de escucha.
  - `-r`: Muestra la tabla de enrutamiento del kernel.
  - `-t`: Muestra solo conexiones TCP.

### (j) `mount`
- **Descripción:** `mount` monta un sistema de archivos, permitiendo el acceso a dispositivos de almacenamiento.
- **Sintaxis básica:**
  ```bash
  mount [opciones] dispositivo punto_de_montaje
  ```
- **Parámetros importantes:**
  - `-o ro`: Monta el sistema de archivos en modo de solo lectura.
  - `-t tipo_fs`: Especifica el tipo de sistema de archivos (e.g., `ext4`, `vfat`).

### (k) `umount`
- **Descripción:** `umount` desmonta un sistema de archivos, asegurando que todos los datos sean escritos en el dispositivo.
- **Sintaxis básica:**
  ```bash
  umount [opciones] punto_de_montaje
  ```
- **Parámetros importantes:**
  - `-f`: Fuerza el desmontaje de un sistema de archivos.
  - `-l`: Desmonta un sistema de archivos de manera "perezosa", es decir, una vez que ya no esté en uso.

### (l) `head`
- **Descripción:** `head` muestra las primeras líneas de un archivo.
- **Sintaxis básica:**
  ```bash
  head [opciones] archivo
  ```
- **Parámetros importantes:**
  - `-n N`: Muestra las primeras `N` líneas del archivo.
  - `-c N`: Muestra los primeros `N` caracteres del archivo.

### (m) `losetup`
- **Descripción:** `losetup` asocia un archivo de dispositivo de bucle (loop device) con un archivo o dispositivo de bloque.
- **Sintaxis básica:**
  ```bash
  losetup [opciones] dispositivo archivo
  ```
- **Parámetros importantes:**
  - `-f`: Busca el primer dispositivo de bucle disponible.
  - `-d`: Desasocia el dispositivo de bucle.

### (n) `write`
- **Descripción:** `write` permite enviar mensajes a otro usuario conectado al sistema.
- **Sintaxis básica:**
  ```bash
  write usuario [tty]
  ```
- **Parámetros importantes:**
  - No tiene opciones importantes, se utiliza directamente escribiendo el mensaje después de invocar el comando.

### (ñ) `mkfs`
- **Descripción:** `mkfs` (make filesystem) se utiliza para crear un sistema de archivos en una partición o dispositivo.
- **Sintaxis básica:**
  ```bash
  mkfs [opciones] tipo_fs dispositivo
  ```
- **Parámetros importantes:**
  - `-t tipo_fs`: Especifica el tipo de sistema de archivos a crear (e.g., `ext4`, `xfs`).

### (o) `fdisk` (con cuidado)
- **Descripción:** `fdisk` es una herramienta para gestionar particiones en discos duros. Puede crear, eliminar, redimensionar y listar particiones.
- **Sintaxis básica:**
  ```bash
  fdisk [opciones] dispositivo
  ```
- **Parámetros importantes:**
  - `-l`: Lista las particiones en todos los discos.
  - `-n`: Crea una nueva partición.
  - **Precaución:** El uso incorrecto de `fdisk` puede llevar a la pérdida de datos, ya que manipula las tablas de particiones del disco.


## 12. Investigue su funcionamiento y parámetros más importantes:

### (a) Indique en qué directorios se almacenan los comandos mencionados en el ejercicio anterior

En GNU/Linux, los comandos se almacenan en varios directorios estándar del sistema. Los más comunes son `/bin`, `/sbin`, `/usr/bin`, `/usr/sbin`, y algunos otros dependiendo de la distribución y la configuración. A continuación se detallan los directorios donde se encuentran generalmente los comandos mencionados en el ejercicio anterior:

1. **`shutdown`**:  
   - Ubicación: `/sbin/shutdown`
  
2. **`reboot`**:  
   - Ubicación: `/sbin/reboot`

3. **`halt`**:  
   - Ubicación: `/sbin/halt`

4. **`locate`**:  
   - Ubicación: `/usr/bin/locate`

5. **`uname`**:  
   - Ubicación: `/bin/uname`

6. **`dmesg`**:  
   - Ubicación: `/bin/dmesg`

7. **`lspci`**:  
   - Ubicación: `/usr/bin/lspci`

8. **`at`**:  
   - Ubicación: `/usr/bin/at`

9. **`netstat`**:  
   - Ubicación: `/bin/netstat`

10. **`mount`**:  
    - Ubicación: `/bin/mount`

11. **`umount`**:  
    - Ubicación: `/bin/umount`

12. **`head`**:  
    - Ubicación: `/usr/bin/head`

13. **`losetup`**:  
    - Ubicación: `/sbin/losetup`

14. **`write`**:  
    - Ubicación: `/usr/bin/write`

15. **`mkfs`**:  
    - Ubicación: `/sbin/mkfs`

16. **`fdisk`**:  
    - Ubicación: `/sbin/fdisk`

### Nota:
- Los comandos ubicados en `/sbin` suelen requerir permisos de superusuario, ya que están destinados a tareas administrativas del sistema.
- Los comandos en `/bin` y `/usr/bin` pueden ser ejecutados por cualquier usuario del sistema, siempre y cuando tengan los permisos necesarios para ello.

