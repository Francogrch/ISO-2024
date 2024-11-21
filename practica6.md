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
### (b) SSTF (Shortest Seek Time First)
### (c) Scan
### (d) Look
### (e) C-Scan (Circular Scan)
### (f) C-Look (Circular Look)

---
## 14. ¿Alguno de los algoritmos analizados en el ejercicio anterior pueden causar inanición de requerimientos?

---
## 15. Supongamos un Head con movimiento en 300 pistas (numerados de 0 a 299), que esta en la pista 143 atendiendo un requerimiento y anteriormente atendió un requerimiento en la pista 125.

Si la cola de requerimientos es: 126, 147, 81, 277, 94, 150, 212, 175, 140, 225, 280, 50, 99, 118, 22, 55; y después de 30 movimientos se incorporan los requerimientos de las pistas 75, 115, 220 y 266. Realice los diagramas para calcular el total de movimientos de head para satisfacer estos requerimientos de acuerdo a los siguientes algoritmos de scheduling de
discos:
### (a) FCFS
### (b) SSTF
### (c) Scan
### (d) Look
### (e) C-Scan
### (f) C-Look

---
## 16. Supongamos un Head con movimiento en 300 pistas (numerados de 0 a 299), que esta en la pista 140 atendiendo un requerimiento y anteriormente atendió un requerimiento en la pista 135.

Si la cola de requerimientos es: 99, 110, 42, 25, 186, 270, 50, 99, 147P F , 81, 257, 94, 133, 212, 175, 130; y después de 30 movimientos se incorporan los requerimientos de las pistas 85, 15P F , 202 y 288; y después de otros 40 movimientos más se incorporan los requerimientos de las pistas 75, 149P F , 285, 201 y 59. Realice los diagramas para calcular el total de movimientos de head para satisfacer estos requerimientos de acuerdo a los siguientes algoritmos de scheduling de discos:

### (a) FCFS
### (b) SSTF
### (c) C-Scan
### (d) Scan
### (e) Look
### (f) C-Look

--- 
## Administración de Archivos
## 17. Dados los siguientes métodos de administración de espació de un archivo:
Asignación contigua
Asignación enlazada
Asignación indexada
(a) Describa como trabaja cada uno.
(b) Cite ventajas y desventajas de cada uno.
18. Gestión de espacio libre. Dados los siguientes métodos de gestión de espacio libre en un
disco:
Tabla de bits

Lista Ligada
Agrupamiento
Recuento
(a) Describa como trabajan estos métodos.
(b) Cite ventajas y desventajas de cada uno.
19. Gestión de archivos en UNIX.
El sistema de archivos de UNIX utiliza una versión modificada del esquema de Asignación Indexada para la administración de espacio de los archivos.
Cada archivo o directorio esta representado por una estructura que mantiene, entre otra
información, las direcciones de lo bloques que contienen los datos del archivo: el I-NODO.
Cada I-NODO contiene 13 direcciones a los bloques de datos, organizadas de la siguiente
manera:
10 de direccionamiento directo.
1 de direccionamiento indirecto simple.
1 de direccionamiento indirecto doble.
1 de direccionamiento indirecto triple.
(a) Realice un grafico que describa la estructura del I-NODO y de los bloques de datos.
Cada bloque es de 1 Kib(Kibibits). Si cada dirección para referenciar un bloque es de
32 bits:
i. ¿Cuántas referencias (direcciones) a bloque pueden contener un bloque de disco?
ii. ¿Cuál sería el tamaño máximo de un archivo?
20. Analice las siguientes fórmulas necesarias para localizar un I-NODO en la lista de inodos:
nro bloque = ((nro de inodo -1)/nro. de inodos por bloque) + bloque de comienzo de la
lista de inodos.
Desplazamiento del inodo en el bloque = ((nro de inodo - 1) módulo (número de inodos
por bloque)) * medida de inodo del disco.
(a) Según la primer fórmula, asumiendo que en el bloque 2 está en el comienzo de la lista
de inodos y que hay 8 inodos por bloque: calcule donde se encuentra el inodo 8 y el 9.
¿Dónde estarían para bloque de disco de 16 inodos?
(b) De acuerdo a la segunda fórmula, si cada inodo del disco ocupa 64 bytesy hay 8 inodos
por bloque de disco, el inodo 8 comienza en el desplazamiento 448 del bloque de disco.
¿Dónde empieza el 6? Si fueran inodos de 128 bytesy 24 inodos por bloque: ¿dónde
empezaría el inodo 8?

Laboratorio de Entrada-Salida
Se recomienda resolver este laboratorio con el Sistema en modo consola y con la menor
cantidad de programas en ejecución posible.
21. Instale e investigue para que sirve el siguiente programa hdparm
sudo apt-get install hdparm

Pág. 4

UNLP |Facultad de Informática

ISO 2024 | Práctica 6

22. Ahora ejecute el siguiente comando:
sudo hdparm -I /dev/sda
¿Cuando cilindros, cabezas y sectores tiene su disco?
¿Que pasa si ejecuta esto en un disco de estado sólido?
23. Ahora ejecute el siguiente comando varias veces(al menos 5), de manera tal de poder calcular
el promedio de resultados obtenidos
sudo hdparm

/dev/sda

24. Ahora ejecutelo de la siguiente manera:
hdparm -t --direct

--offset 500

/dev/sda

25. ¿Para que sirven los parámetros?:
direct
offset
26. Compare los tiempos promedios obtenidos con los parámetros direct y offset y sin ellos(Recuerde
comparar tiempos promedio y no ejecuciones aisladas).
27. ¿Con que concepto de la teoría asocia el parámetro direct?
28. Ejecute el siguiente comando:
ls /sys/block/
29. A que le parece que corresponde cada entrada del directorio anterior?
30. Ejecute el siguiente comando(ajuste el dispoisitivo de disco según su equipo):
cat /sys/block/sda/queue/scheduler
31. Investigue el resultado del comando anterior. ¿Que quiere decir cada item del resultado?,
investigue cada uno de ellos y asocielo con conceptos de la teoría y de esta práctica. ¿Cual
es la diferencia entre los siguientes conceptos?
noop
deadline
cfq
Anticipatory IO
32. Como root, ejecute el siguiente comando
sudo echo "noop" > /sys/block/sda/queue/scheduler
¿Cual es el efecto de esto?.Ayuda:vuelva a ejecutar
cat /sys/block/sda/queue/scheduler

Pág. 5

UNLP |Facultad de Informática

ISO 2024 | Práctica 6

33. Ahora ejecute el siguiente programa al menos 5 veces, de manera tal de poder calcular el
promedio del resultado obtenido
hdparm -t --direct

--offset 500

/dev/sda

34. Ahora del mismo modo repita el paso con las demas opciones obtenidas en el ejercicio 29 y
compare los resultados
¿Cual le parece que debería ser mas óptimo?
¿Porque?

Pág. 6


