# Práctica 6
# Administración de E/S

Objetivo
El objetivo de esta práctica es que el alumno comprenda los aspectos principales acerca de la
planificación de E/S y de discos.

---
## 1. Dispositivos

### (a) Los dispositivos, según la forma de transferir los datos, se pueden clasificar en 2 tipos:
- Orientados a bloques
- Orientados a flujos

Describa las diferencias entre ambos tipos.
- Orientados a bloques
Transferen los datos en bloques de tamaño fijo. Cada bloque tiene una dirección y se puede acceder a él de forma aleatoria.

- Orientados a flujos
Transferen los datos como un flujo continuo de bytes o caracteres, sin estructurarse en bloques.


### (b) Cite ejemplos de dispositivos de ambos tipos.
- Orientados a bloques: Discos duros, SSDs, CDs, DVDs.
- Orientados a flujos: Teclados, ratones, impresoras, interfaces de red.


### (c) Enuncie las diferencias que existen entre los dispositivos de E/S y que el SO debe considerar.
- Unidad de transferencia: Bloque o Caracter
- Formas de Acceso: Secuencial o Aleatorio
- Tipo de acceso: Compartido o Exclusivo
- Velocidad

---
## 2. Técnicas de E/S Describa como trabajan las siguientes técnicas de E/S

- E/S programada:
    - CPU tiene control directo sobre la I/O
        + Controla el estado
        + Comandos para leer y escribir
        + Transfiere los datos
    - CPU espera que el componente de I/O complete la operación
    - Se desperdician ciclos de CPU
    - Es necesario hacer Polling

- E/S dirigida por interrupciones:
    - Soluciona el problema de la espera de la CPU
    - La CPU no repite el chequeo sobre el dispositivo
    - El procesador continúa la ejecución de instrucciones
    - El componente de I/O envía una interrupción cuando termina

- DMA (Acceso Directo a Memoria):
    - Un componente de DMA controla el intercambio de datos entre la memoria principal y el dispositivo
    - El procesador es interrumpido luego de que el bloque entero fue transferido.

---
## 3. La tecnica de E/S programa puede trabajar de dos formas.

Indique como trabajan estas 2 técnicas:

- E/S mapeada:
    -  Dispositivos y memoria comparten el espacio de direcciones.
    - I/O es como escribir/leer en la memoria.
    - No hay instrucciones especiales para I/O
    - Ya se dispone de muchas instrucciones para la memoria

- E/S aislada:
    - Espacio separado de direcciones
    - Se necesitan líneas de I/O. Puertos de E/S
    - Instrucciones especiales
        - Conjunto Limitado

---
## 4. Enuncie las metas que debe perseguir un SO para la administración de la entrada salida.

- Generalidad
- Interfaz Uniforme
- Eficiencia
- Planificacion
- Buffering – Almacenamiento de los datos en memoria mientras se transfieren
- Caching – Mantener en memoria copia de los datos de reciente acceso para mejorar performance
- Spooling – Administrar la cola de requerimientos de un dispositivo
- Reserva de dispositivos
- Manejo de Errores

---
## 5. Drivers

### (a) ¿Qué son?
Interfaz entre el SO y el HARD, es un modulo.

### (b) ¿Qué funciones mínimas deben proveer?
- open: abre el dispositivo
- close: cerrar el dispositivo
- read: leer bytes del dispositivo
- write: escribir bytes en el dispositivo
- ioctl: orden de control sobre el dispositivo

### (c) ¿Quién determina cuales deben ser estas funciones?
El Sistema Operativo, mediante una API.

---
## 6. Realice un grafico que marque la relación entre el Subsistema de E/S, los drivers, los controladores de dispositivos y los dispositivos.

|---------------------------------|
|       Subsistema de E/S         |
|---------------------------------|
|             Drivers             |
|---------------------------------|
| Controladores de Dispositivos   |
|---------------------------------|
|          Dispositivos           |
|---------------------------------|

---
## 7. Describa mediante un ejemplo los pasos mínimos que se suceden desde que un proceso genera un requerimiento de E/S hasta que el mismo llega al dispositivo.

1. Se hace la peticion al dispositivo de E/S
2. Determina el dispositivo 
3. Se traduce instruccion al formato del dispositivo
5. Se realiza llamada al controlador del dispositivo
6. Se notifica 

---
## 8. Describa mediante un ejemplo los pasos mínimos que se suceden desde que un proceso genera un requerimiento de E/S hasta que el mismo llega al dispositivo.

---
## 9. Enuncie que servicios provee el SO para la administración de E/S.

– Interfaz uniforme
– Manejo de errores
– Buffer
– Asignación de Recursos
– Planificación

---
## Administración de Discos

## 10. Describa en forma sintética, cómo es la organización física de un disco, puede utilizar gráficos para mayor claridad.

Un disco tiene Platos, Caras, Pistas, Sectores
Dentro del Plato, estan las Caras, dentro de las Caras, las Pistas, dentro de las Pistas, Sectores.
Cilindro N: todas las n-esimas pistas de todas las caras

---
## 11. La velocidad promedio para la obtención de datos de un disco esta dada por la suma de los siguientes tiempos.

De una definición para estos tres tiempos.

- Seek Time: Tiempo que tarda en posicionarse la cabeza en el cilindro
- Latency Time: Tiempo desde que la cabeza se posiciona en el cilindro hasta que el sector en custion pasa por debajo de la misma
- Transfer Time: tiempo de transferencia del sector (bloque) del disco a la memoria

---

## 12. Suponga un disco con las siguientes características:

- 7 platos con 2 caras utilizables cada uno.
- 1100 cilindros
- 300 sectores por pista, donde cada sector de es 512 bytes.
- Seek Time de 10 ms
- 9000 RPM .
- Velocidad de Transferencia de 10 MiB/s (Mebibytes por segundos).

### (a) Calcule la capacidad total del disco.
7 x 2 x 1100 x 300 x 512 = 2365440000B = 2310000Kb = 2255,85Mb = 2,20Gb

### (b) ¿Cuantos sectores ocuparía un archivo de tamaño de 3 MiB(Mebibytes)?
MiB = 2^20
3 * 2^20 = 3145728 
3145728 / 8 = 393216
393216 / 512 = 768 sectores

### (c) Calcule el tiempo de transferencia real de un archivo de 15 MiB(Mebibytes). grabado en el disco de manera secuencial (todos sus bloques almacenados de manera consecutiva)
seek + latency + (tiempo transferencia bloque * #bloques)
10ms/1000 + ((9000RPM)*60) + 1.5 seg  
0.01s + 540000s + 1.5s = 540001.51s / 60 = 9000,025166667m /60 = 150 hrs = 6.25 dias

tiempo de transferencia de bloque:
10MiB/s = 2^20 * 10 = 10485760 / 8 = 
1310720 bytes -> 1
512bytes -> x
512 / 1310720=0,000390625

cantBloques:
15Mib  = 15 * 2^20 = 15728640 / 8 = 1966080 bytes
1966080 bytes / 512bytes = 3840


10ms/1000 + ((9000RPM)*60) + (3840 * 0,000390625) = 

### (d) Calcule el tiempo de transferencia real de un archivo de 16 MiB(Mebibytes). grabado en el disco de manera aleatoria.

(seek + latency + tiempo transferencia bloque) * #bloques

seek= 10ms/1000 = 0.01s 
latency= 9000RPM*60 = 540000s
ttb = 
10MiB/s = 10 * 2^20 = 10485760 / 8 = 
1310720 bytes -> 1seg
5512bytes -> x
512 / 1310720=0,000390625
cantBlqoues= 
16MiB = 16 * 2^20 = 16777216/8 = 2097152 bytes
2097152 / 512 = 4096

(0.01 + 540000 + 0,000390625)*4096 = 2211844097,6s = 2211844097,6/60 = 36864068,293333333m / 60 = 614401,138222222 hr

---

## 13. El Seek Time es el parámetro que posee mayor influencia en el tiempo real necesario para transferir datos desde o hacia un disco. Es importante que el SO planifique los diferentes requerimientos que al disco para minimizar el movimiento de la cabeza lecto-grabadora. Analicemos las diferentes políticas de planificación de requerimientos a disco con un ejemplo: Supongamos un Head con movimiento en 200 tracks (numerados de 0 a 199), que está en el track 83 atendiendo un requerimiento y anteriormente atendió un requerimiento en el track 75.

Si la cola de requerimientos es: 86, 147, 91, 177, 94, 150, 102, 175, 130, 32, 120, 58, 66, 115. 
Realice los diagramas para calcular el total de movimientos de head para satisfacer estos requerimientos de acuerdo a los siguientes algoritmos de scheduling de discos:

### (a) FCFS (First Come, First Served)

    sectores = [83, 86, 147, 91, 177, 94, 150, 102, 175, 130, 32, 120, 58, 66, 115]
Movimientos=273
### (b) SSTF (Shortest Seek Time First)

    sectores= [83, 86, 91, 94, 102, 115, 120, 130, 147, 150, 175, 177,66,58,32]
Movimientos=239

### (c) Scan

    sectores= [83, 86, 91, 94, 102, 115, 120, 130, 147, 150, 175, 177,199,66,58,32]
Movimientos = 283

### (d) Look

    sectores= [83, 86, 91, 94, 102, 115, 120, 130, 147, 150, 175, 177, 66, 58, 32]
Movimientos = 238

### (e) C-Scan (Circular Scan)
    sectores = [83, 86, 91, 94, 102, 115, 120, 130, 147, 150, 175, 177,199,0,32, 58, 66]
Movimientos = 182

### (f) C-Look (Circular Look)
    sectores = [83, 86, 91, 94, 102, 115, 120, 130, 147, 150, 175, 177, 32, 58, 66]
Movimientos = 128

---
## 14. ¿Alguno de los algoritmos analizados en el ejercicio anterior pueden causar inanición de requerimientos?

SSTF puede generar inanicion

---
## 15. Supongamos un Head con movimiento en 300 pistas (numerados de 0 a 299), que esta en la pista 143 atendiendo un requerimiento y anteriormente atendió un requerimiento en la pista 125.

Si la cola de requerimientos es: 126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55; y después de 30 movimientos se incorporan los requerimientos de las pistas 75, 115, 220 y 266. 
Realice los diagramas para calcular el total de movimientos de head para satisfacer estos requerimientos de acuerdo a los siguientes algoritmos de scheduling de discos:

      sectores = [126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55]

### (a) FCFS

    sectores = [126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55,75, 115, 220,  266]

Movimientos: 1434

### (b) SSTF
    sectores = [126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55]
    sectores = [22,50,55,81,97,99,118,126,140,147,150,175,212,225,277,280]

    sectores = [140,147,150,(x)126,118,99,97,81,55,50,22,175,212,225,277,280]
    (x)=[75,115,220,266]
    sectores = [140,147,150,126,118,115,99,97,81,75,55,50,22,175,212,220,225,266,277,280]

Movimientos: 396
### (c) Scan

    sectores = [140,147,150,(x)175, 212,225,277,280,299,126,118,99,97,81,55,50,22]
    (x)=[75,115,220,266]
    sectores = [140,147,150,175, 212,220,225,266,277,280,299,126,118,115,99,97,81,75,55,50,22]

Movimientos: 436
### (d) Look

    sectores = [140,147,150,(x)175, 212,225,277,280,126,118,99,97,81,55,50,22]

    (x)=[75,115,220,266]
    sectores = [140,147,150,175, 212,220,225,266,277,280,126,118,115,99,97,81,75,55,50,22]

Movimientos:398 
### (e) C-Scan
    sectores = [140,147,150,(x)175, 212,225,277,280,299,0,22,50,55,81,97,99,118,126]
    (x)=[75,115,220,266]
    sectores = [140,147,150,175, 212,220,225,266,277,280,299,0,22,50,55,75,81,97,99,115,118,126]

Movimientos:285

### (f) C-Look
    sectores = [140,147,150,(x)175, 212,225,277,280,22,50,55,81,97,99,118,126]

    (x)=[75,115,220,266]
    sectores = [140,147,150,175, 212,220,225,266,277,280,22,50,55,75,81,97,99,115,118,126]

Movimientos:244

---
## 16. Supongamos un Head con movimiento en 300 pistas (numerados de 0 a 299), que esta en la pista 140 atendiendo un requerimiento y anteriormente atendió un requerimiento en la pista 135.

Si la cola de requerimientos es: 99, 110, 42, 25, 186, 270, 50, 99, 147PF , 81, 257, 94, 133, 212, 175, 130; y después de 30 movimientos se incorporan los requerimientos de las pistas 85, 15PF , 202 y 288; y después de otros 40 movimientos más se incorporan los requerimientos de las pistas 75, 149PF , 285, 201 y 59. Realice los diagramas para calcular el total de movimientos de head para satisfacer estos requerimientos de acuerdo a los siguientes algoritmos de scheduling de discos:

    sectores = [99, 110, 42, 25, 186, 270, 50, 99, 147PF, 81, 257, 94, 133, 212, 175, 130]
    +30 = [85, 15PF , 202, 288]
    +40 = [75, 149PF , 285, 201, 59] 

### (a) FCFS
    sectores = [140,147PF, 99,15PF,149PF,110, 42, 25, 186, 270, 50, 99, 81, 257, 94, 133, 212, 175, 130,85, 202, 288, 75, 285, 201, 59]
    sectores = [140,147, 99,15,149,110, 42, 25, 186, 270, 50, 99, 81, 257, 94, 133, 212, 175, 130,85, 202, 288, 75, 285, 201, 59]
Movimientos: 2375

### (b) SSTF
    sectores = [25,42,50,99,99,110,186,270,147PF,81,257,94,133,212,175,130]
    sectores = [140,147F,133,130,110,99,94,81,50,42,25,175,186,212,267,270]

    sectores = [140,147PF,133,130,110(x),99,94,81,50,42,25,175,186,212,267,270]
    sectores = [140,147PF,133,130,110(x),15PF,149PF,99,94,81,50,42,25,175,186,212,267,270]
    
    sectores = [140,147PF,133,130,110(x),15PF,149PF,85,202,288,75,285,201,59,99,94,81,50,42,25,175,186,212,267,270]
    sectores = [140,147PF,133,130,110,15PF,149PF,175,186,201,202,212,267,270,285,288,99,94,85,81,75,59,50,42,25]
    sectores = [140,147,133,130,110,15,149,175,186,201,202,212,267,270,285,288,99,94,85,81,75,59,50,42,25]
Mov:675

### (c) C-Scan
    sectores = [99, 110, 42, 25, 186, 270, 50, 99, 147PF, 81, 257, 94, 133, 212, 175, 130]
    sectores = [25,42,50,81,84,94,99,110,130,133,147PF,175,186,212,257,270]
    sectores = [140,147PF,175(x),186,212,257,270,299,0,25,42,50,81,84,94,99,110,130,133]
    sectores = [140,147PF,175(x),186,212,257,270,299,0,25,42,50,81,84,94,99,110,130,133]
    sectores = [140,147PF,175(x),15PF,149PF,186,201,202,212,257,270,285,288,299,0,25,42,50,59,75,81,84,85,94,99,110,130,133]
    sectores = [140,147,175,15,149,186,201,202,212,257,270,285,288,299,0,25,42,50,59,75,81,84,85,94,99,110,130,133]
Mov: 612

### (d) Scan
    sectores = [99, 110, 42, 25, 186, 270, 50, 99, 147PF, 81, 257, 94, 133, 212, 175, 130]
    +30 = [85, 15PF , 202, 288]
    +40 = [75, 149PF , 285, 201, 59] 

    sectores = [140,147PF,175(x),15PF(x),149PF,186,201,202,212,257,270,288,299,133,130,110,99,94,85,84,81,75,59,50,42,25]
    sectores = [140,147,175,15,149,186,201,202,212,257,270,288,299,133,130,110,99,94,85,84,81,75,59,50,42,25]
Mov: 753

### (e) Look
    sectores = [99, 110, 42, 25, 186, 270, 50, 99, 147PF, 81, 257, 94, 133, 212, 175, 130]
    +30 = [85, 15PF , 202, 288]
    +40 = [75, 149PF , 285, 201, 59] 


    sectores = [25,42,50,81,84,94,99,110,130,133,147PF,175,186,212,257,270]
    sectores = [140,147PF,175(x),186,212,257,270,133,130,110,99,94,84,81,50,42,25]
    sectores = [140,147PF,175(x),15PF(x),149PF,186,201,202,212,257,270,285,288,133,130,110,99,94,85,84,81,75,59,50,42,25]
    sectores = [140,147,175,15,149,186,201,202,212,257,270,285,288,133,130,110,99,94,85,84,81,75,59,50,42,25]
Mov: 731

### (f) C-Look

    sectores = [25,42,50,81,84,94,99,110,130,133,147PF,175,186,212,257,270]
    sectores = [140,147PF,175(x),186,212,257,270,133,130,110,99,94,84,81,50,42,25]
    sectores = [140,147PF,175(x),186,212,257,270,25,42,50,81,84,94,99,110,130,133]
    sectores = [140,147PF,175(x),15PF(x),149(x),186,201,202,212,257,270,285,288,25,42,50,59,75,81,84,85,94,99,110,130,133]
    sectores = [140,147,175,15,149,186,201,202,212,257,270,285,288,25,42,50,59,75,81,84,85,94,99,110,130,133]
Mov: 576

--- 
## Administración de Archivos
## 17. Dados los siguientes métodos de administración de espació de un archivo:
*Asignación contigua*:
- Conjunto continuo de bloques son utilizados (ventaja)
- Se requiere una pre-asignación (desventaja)
- Se debe conocer el tamaño del archivo durante su creación
- File Allocation Table (FAT) es simple (ventaja)
- Sólo una entrada que incluye Bloque de inicio y longitud
- El archivo puede ser leído con una única operación
- Puede existir fragmentación externa (desventaja)

*Asignación enlazada*:
- Asignación en base a bloques individuales
- Cada bloque tiene un puntero al próximo bloque del archivo
- File allocation table -> Única entrada por archivo: Bloque de inicio y tamaño del archivo
- No hay fragmentación externa (ventaja)
- Útil para acceso secuencial (no random)
- Los archivos pueden crecer bajo demanda (ventaja)
- No se requieren bloques contiguos

*Asignación indexada*:
- La FAT contiene un puntero al bloque índice (ventaja)
- El bloque índice no contiene datos propios del archivo, sino que contiene un índice a los bloques que lo componen
- Asignación en base a bloques individuales
- No se produce Fragmentación Externa (ventaja)
- El acceso “random” a un archivo es eficiente (ventaja)
- File Allocation Table -> Única entrada con la dirección del bloque de índices (index node / i-node) (ventaja)

### (a) Describa como trabaja cada uno.
### (b) Cite ventajas y desventajas de cada uno.

---
## 18. Gestión de espacio libre. Dados los siguientes métodos de gestión de espacio libre en un disco:

*Tabla de bits*:
- Tabla (vector) con 1 bit por cada bloque de disco
- Fácil encontrar un bloque o grupo de bloques libres (ventaja)
- Tamaño del vector en memoria tamaño disco bytes / tamaño bloque en sistema archivo (desventaja)

*Lista Ligada*:
- Se tiene un puntero al primer bloque libre.
- Cada bloque libre tiene un puntero al siguiente bloque libre
- Ineficiente para la búsqueda de bloques libres (desventaja)
- Hay que realizar varias operaciones de E/S para obtener un grupo libre. (desventaja)
- Problemas con la pérdida de un enlace (desventaja)
- Difícil encontrar bloques libres consecutivos (desventaja)
- No ocupa espacio adicional como la tabla de bits (ventaja)

*Agrupamiento*(indexacion):
- Variante de “bloques libres encadenados”
- El primer bloque libre contiene las direcciones de N bloques libres.
- Las N-1 primeras direcciones son bloques libres.
- La N-ésima dirección referencia otro bloque con N direcciones de bloques libres.
- Acceso mas rapido a bloques libres(ventaja)

*Recuento*:
- Variante de Indexación
- Esta estrategia considera las situaciones de que varios bloques contiguos pueden ser solicitados o liberados a la vez (en especial con asignación contigua).
- En lugar de tener N direcciones libres (índice) se tiene:
    + La dirección del primer bloque libre
    + Los N bloques libres contiguos que le siguen. (#bloque, N siguientes bloques libres)
- Busca achicar estructuras (ventaja)
- Es compleja de mantener (desventaja)

### (a) Describa como trabajan estos métodos.
### (b) Cite ventajas y desventajas de cada uno.

---
## 19. Gestión de archivos en UNIX.

El sistema de archivos de UNIX utiliza una versión modificada del esquema de Asignación Indexada para la administración de espacio de los archivos.
Cada archivo o directorio esta representado por una estructura que mantiene, entre otra información, las direcciones de lo bloques que contienen los datos del archivo: el I-NODO.
Cada I-NODO contiene 13 direcciones a los bloques de datos, organizadas de la siguiente manera:
- 10 de direccionamiento directo.
- 1 de direccionamiento indirecto simple.
- 1 de direccionamiento indirecto doble.
- 1 de direccionamiento indirecto triple.

### (a) Realice un grafico que describa la estructura del I-NODO y de los bloques de datos.
Cada bloque es de 1 Kib(Kibibits). Si cada dirección para referenciar un bloque es de 32 bits:
#### i. ¿Cuántas referencias (direcciones) a bloque pueden contener un bloque de disco?
#### ii. ¿Cuál sería el tamaño máximo de un archivo?

---
## 20. Analice las siguientes fórmulas necesarias para localizar un I-NODO en la lista de inodos:
- nro bloque = ((nro de inodo -1)/nro. de inodos por bloque) + bloque de comienzo de la lista de inodos.
- Desplazamiento del inodo en el bloque = ((nro de inodo - 1) módulo (número de inodos por bloque)) * medida de inodo del disco.
### (a) Según la primer fórmula, asumiendo que en el bloque 2 está en el comienzo de la lista de inodos y que hay 8 inodos por bloque: calcule donde se encuentra el inodo 8 y el 9. ¿Dónde estarían para bloque de disco de 16 inodos?
### (b) De acuerdo a la segunda fórmula, si cada inodo del disco ocupa 64 bytesy hay 8 inodos por bloque de disco, el inodo 8 comienza en el desplazamiento 448 del bloque de disco. ¿Dónde empieza el 6? Si fueran inodos de 128 bytesy 24 inodos por bloque: ¿dónde empezaría el inodo 8?

## Laboratorio de Entrada-Salida
Se recomienda resolver este laboratorio con el Sistema en modo consola y con la menor cantidad de programas en ejecución posible.

---
## 21. Instale e investigue para que sirve el siguiente programa hdparm
    sudo apt-get install hdparm

---
## 22. Ahora ejecute el siguiente comando:
    sudo hdparm -I /dev/sda

- ¿Cuando cilindros, cabezas y sectores tiene su disco?
- ¿Que pasa si ejecuta esto en un disco de estado sólido?

---
## 23. Ahora ejecute el siguiente comando varias veces(al menos 5), de manera tal de poder calcular el promedio de resultados obtenidos
    sudo hdparm /dev/sda

---
## 24. Ahora ejecutelo de la siguiente manera:
    hdparm -t --direct --offset 500 /dev/sda

---
## 25. ¿Para que sirven los parámetros?:
- direct
- offset

---
## 26. Compare los tiempos promedios obtenidos con los parámetros direct y offset y sin ellos(Recuerde comparar tiempos promedio y no ejecuciones aisladas).
---
## 27. ¿Con que concepto de la teoría asocia el parámetro direct?
---
## 28. Ejecute el siguiente comando:
      ls /sys/block/
---
## 29. A que le parece que corresponde cada entrada del directorio anterior?
---
## 30. Ejecute el siguiente comando(ajuste el dispoisitivo de disco según su equipo):
      cat /sys/block/sda/queue/scheduler
---
## 31. Investigue el resultado del comando anterior. ¿Que quiere decir cada item del resultado?, investigue cada uno de ellos y asocielo con conceptos de la teoría y de esta práctica. ¿Cual es la diferencia entre los siguientes conceptos?
      noop
      deadline
      cfq
      Anticipatory IO

---
## 32. Como root, ejecute el siguiente comando
      sudo echo "noop" > /sys/block/sda/queue/scheduler

¿Cual es el efecto de esto?.Ayuda:vuelva a ejecutar

      cat /sys/block/sda/queue/scheduler

---
## 33. Ahora ejecute el siguiente programa al menos 5 veces, de manera tal de poder calcular el promedio del resultado obtenido
    hdparm -t --direct --offset 500 /dev/sda

---
## 34. Ahora del mismo modo repita el paso con las demas opciones obtenidas en el ejercicio 29 y compare los resultados ¿Cual le parece que debería ser mas óptimo? ¿Porque?

