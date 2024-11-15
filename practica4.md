# Practica 4

## Objetivo
El objetivo de esta práctica es que el alumno comprenda los aspectos base acerca de la planificación de procesos en un Sistema Operativo (tipos de planificadores, algoritmos y sus variantes, etc.). Además, para la autocorrección de los ejercicios, es deseable la utilización del simulador que se encuentra en cátedras virtuales1.

## 1. Responda en forma sintética sobre los siguientes conceptos:
### (a) Programa y Proceso.
Programa:
- Es estatico
- No tiene program cunter
- Existe desde que se edita hasta que se borra
Proceso
- Es dinamico
- Tiene program counter
- Su ciclo de vida comprende desde que se lo ejecuta hasta que termina

### (b) Defina Tiempo de retorno (TR) y Tiempo de espera (TE) para un Job.
*Tiempo de retorno (TR)* : tiempo que transcurre entre que el proceso llega al sistema hasta que completa su ejecucion
*Tiempo de espera (TE)* : tiempo que el proceso se encuentra en el sistema esperando, es decir el tiempo que pasa sin ejecutarse (TR - Tcpu)

### (c) Defina Tiempo Promedio de Retorno (TPR) y Tiempo promedio de espera (TPE) para un lote de JOBS.
*Tiempo Promedio de Retorno (TPR)*: tiempo promedio de un lote de jobs que transcurre entre que los jobs lelgan al sistema hasta que se completa su ejecucion. 
*Tiempo promedio de espera (TPE)*  tiempo promedio de un lote de jobs que se encntra en el sistema esperando o el tiempo que pasan sin ejecutarse.

### (d) ¿Qué es el Quantum?
Medida que determina cuanto tiempo podra usar el procesador cada proceso

### (e) ¿Qué significa que un algoritmo de scheduling sea apropiativo o no apropiativo (Preemptive o Non-Preemptive)?
*Nonpreemptive*: una vez que un proceso esta en estado de ejecucion, continua hasta que termina o se bloquea por algun evento (e.j. I/O)
*Preemptive*: el proceso en ejecucion puede ser interrumpido y llevado a la cola de listos:
• Mayor overhead pero mejor servicio
• Un proceso no monopoliza el procesador
### (f) ¿Qué tareas realizan?:
Long term scheduler: • Medium term scheduler: • Short term scheduler: determina que proceso pasar´a a
ejecutarse

#### i. Short Term Scheduler
Determina que proceso pasara a ejecutarse

#### ii. Long Term Scheduler
Admite nuevos procesos a memoria (controla el grado de multirpogramacion)

#### iii. Medium Term Scheduler
Realiza el swapping (intercambio) entre el disco y la memoria cuando el SO lo determina (puede disminuir el grado de multiprogramacion)

### (g) ¿Qué tareas realiza el Dispatcher?
Se ocupa de realizar el context switch, el cambio a modo usuario y actualiza el program counter. Se ejecuta cuando un procesos de seleciona a la cola de listos y necesita cargarse a la CPU.

## 2. Procesos:
### (a) Investigue y detalle para que sirve cada uno de los siguientes comandos. (Puede que algún comando no venga por defecto en su distribución por lo que deberá instalarlo):
#### i. top
Muestra en tiempo real información sobre el uso de recursos del sistema, incluyendo CPU, memoria y los procesos activos. Es útil para monitorear el rendimiento y estado de los procesos.
#### ii. htop
Similar a top, pero con una interfaz más amigable e interactiva. Permite visualizar y gestionar procesos de manera intuitiva, con opciones de navegación y atajos de teclado para ordenar y detener procesos.
#### iii. ps
Muestra una instantánea de los procesos en ejecución en el sistema. Es útil para ver detalles de procesos específicos y para filtrar información sobre procesos en distintos estados.
#### iv. pstree
Muestra los procesos en ejecución en forma de árbol, mostrando la jerarquía y relación entre los procesos y sus procesos hijos. Es útil para visualizar la estructura y organización de los procesos.
#### v. kill
Envía señales a procesos específicos, como la señal de terminación (SIGTERM) o de finalización forzada (SIGKILL). Es útil para detener procesos que están en ejecución.

#### vi. pgrep pkill 
*pgrep*: Busca y lista procesos en ejecución que coinciden con un nombre o patrón específico. Facilita encontrar procesos para luego gestionar su estado.
*pkill*: Permite terminar procesos enviándoles una señal, pero en lugar de especificar el ID del proceso (PID), permite hacerlo utilizando un nombre o patrón.
#### vii. killall
*killall*: Envía una señal a todos los procesos que coincidan con un nombre dado. Es útil para finalizar múltiples instancias de un proceso con un solo comando.
#### viii. renice
Cambia la prioridad de un proceso en ejecución, ajustando su valor de nice. Es útil para aumentar o reducir la prioridad de procesos según la necesidad de recursos del sistema.
#### ix. xkill
Permite cerrar aplicaciones gráficas seleccionándolas con el cursor. Es útil para forzar el cierre de ventanas que no responden en el entorno gráfico.
#### x. atop
Es una herramienta avanzada de monitoreo que muestra información detallada del sistema y del uso de recursos por los procesos, incluyendo CPU, memoria, disco y red.

### (b) Observe detenidamente el siguiente código. Intente entender lo que hace sin necesidad de ejecutarlo.
```C
#include <stdio.h>
#include <sys/types.h>
#include <unistd h>
int main (void) {
  int c;
  pid_t pid;
  printf("Comienzo.:\n" ) ;
  for ( c = 0 ; c < 3 ; c++ )
  {
    pid = fork();
  }
  printf("Proceso\n" ) ;
  return 0;
}
```
#### i. ¿Cuántas líneas con la palabra “Proceso” aparecen al final de la ejecución de este programa?.
2^3 = 8 veces
#### ii. ¿El número de líneas es el número de procesos que han estado en ejecución?.Ejecute el programa y compruebe si su respuesta es correcta, Modifique el valor del bucle for y compruebe los nuevos resultados.
1 proceso original y 7 procesos nuevos a través de fork()). Asi que si.

### (c) Vamos a tomar una variante del programa anterior. Ahora, además de un mensaje, vamos a añadir una variable y, al final del programa vamos a mostrar su valor. El nuevo código del programa se muestra a continuación.
```C
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main (void) {
  int c;
  int p=0;
  pid_t pid;
  for ( c = 0 ; c < 3 ; c++ )
  {
    pid = fork();
  }
  p++;
  printf ( "Proceso %d\n " , p) ;
  return 0;
}
```
#### i. ¿Qué valores se muestran por consola?.
Proceso 1 (x8)
#### ii. ¿Todas las líneas tendrán el mismo valor o algunas líneas tendrán valores distintos?.
Todas las lineas tendran el mismo valor debido a que el p++ esta por fuera del for
#### iii. ¿Cuál es el valor (o valores) que aparece?. Ejecute el programa y compruebe si su respuesta es correcta, Modifique el valor del bucle for y el lugar dónde se incrementa la variable p y compruebe los nuevos resultados.
Al mover la linea p++ dentro del for, genera cambios en los valores, ya que al clonar el proceso desde esa linea, el valor de p va a ir cambiando. 

### (d) Comunicación entre procesos: 
#### i. Investigue la forma de comunicación entre procesos a través de pipes.
Los pipes son un mecanismo de comunicación entre procesos en sistemas Unix y similares. Permiten que los datos fluyan de un proceso a otro de manera unidireccional. Un pipe se puede imaginar como un tubo a través del cual un proceso puede enviar datos que otro proceso puede leer.
#### ii. ¿Cómo se crea un pipe en C?.
```C
#include <unistd.h>

int pipe(int pipefd[2]);
```
Aquí, pipefd es un array de dos enteros que se utilizarán como descriptores de archivo:
- ```pipefd[0]```: se utiliza para leer desde el pipe.
- ```pipefd[1]```: se utiliza para escribir en el pipe.

#### iii. ¿Qué parametro es necesario para la creación de un pipe?. Explique para que se utiliza.
El parámetro necesario para la creación de un pipe es un array de dos enteros (en este caso pipefd[2]), que se pasa como argumento a la función pipe(). Este array se utiliza para almacenar los descriptores de archivo que representan el pipe:

    pipefd[0]: es el descriptor de archivo para la lectura. Cualquier proceso que necesite leer datos de este pipe usará este descriptor.
    pipefd[1]: es el descriptor de archivo para la escritura. Cualquier proceso que desee escribir datos en el pipe utilizará este descriptor.

#### iv. ¿Qué tipo de comunicación es posible con pipes?
Los pipes permiten una comunicación unidireccional entre procesos, donde un proceso puede escribir datos y otro puede leerlos. Generalmente se utilizan en la comunicación entre procesos relacionados (padre-hijo) en sistemas Unix. Sin embargo, son unidireccionales, lo que significa que para establecer una comunicación bidireccional se requieren dos pipes. Además, los datos son temporales y se almacenan en un buffer limitado, por lo que el manejo adecuado del acceso es crucial para evitar bloqueos y condiciones de carrera.
### (e) ¿Cuál es la información mínima que el SO debe tener sobre un proceso?¿En que estructura de datos asociada almacena dicha información?

La información mínima que el sistema operativo debe tener sobre un proceso incluye:

1. **Identificador de Proceso (PID)**: Un número único que identifica al proceso en el sistema.
2. **Estado del Proceso**: Indica si el proceso está en ejecución, listo, bloqueado, etc.
3. **Contador de Programa (PC)**: La dirección de la siguiente instrucción a ejecutar.
4. **Registros del Proceso**: Incluye registros de CPU que se necesitan para restaurar el estado del proceso cuando se reanuda.
5. **Información de Gestión de Memoria**: Detalles sobre el espacio de direcciones del proceso y las páginas de memoria que utiliza.
6. **Prioridad**: Un valor que indica la importancia del proceso en relación con otros procesos.

Esta información se almacena en una estructura de datos llamada **Tabla de Procesos** o **Process Control Block (PCB)**. Cada proceso en el sistema tiene un PCB que contiene todos los detalles necesarios para la gestión y el control del proceso por parte del sistema operativo.
### (f) ¿Qué significa que un proceso sea “CPU Bound” y “I/O Bound”?
- CPU Bound: significa que el proceso esta ligado al uso de la CPU
- I/O Bound: significa que el proceso esta ligado al uso de dispositivos entrada/salida
### (g) ¿Cuáles son los estados posibles por los que puede atravesar un proceso?
Los estados posibles por los que puede atravesar un proceso son:

- New: El proceso ha sido creado pero aún no está en ejecución.
- Ready: El proceso está listo para ser ejecutado y espera asignación de CPU.
- Running: El proceso está siendo ejecutado por la CPU.
- Blocked: El proceso está esperando algún evento (como I/O) y no puede continuar su ejecución.
- Suspend: El proceso ha sido temporalmente detenido y almacenado en disco, no está en memoria.
- Exit: El proceso ha terminado su ejecución y está siendo limpiado por el sistema operativo.
### (h) Explique mediante un diagrama las posibles transiciones entre los estados.
```
         +----------+
         |   New    |
         +----------+
               |
               | (Crear Proceso)
               v
         +----------+
       ->|  Ready   |
       | +----------+
      /     ^  |
     /      |  | (Asignar CPU)
    |       |  v
    |    +----------+
    |    |  Running  |
    |    +----------+
    |     /        \
    |    /          \
    |   | (Bloqueo)  | (Termina)
    |   v            v
  +----------+    +----------+
  | Blocked  |    |   Exit   |
  +----------+    +----------+
            
```
### (i) ¿Que scheduler de los mencionados en 1 f se encarga de las transiciones?

- El Short Term Scheduler gestiona las transiciones inmediatas entre Ready y Running, así como entre Running y Blocked.
- El Medium Term Scheduler maneja la transición entre Ready y Suspend.
- El Long Term Scheduler gestiona la transición desde New a Ready.

## 3. Para los siguientes algoritmos de scheduling:
- FCFS (Fisrt Coome First Served)
- SJF (Shortest Job First)
- Round Robin
- Prioridades

### (a) Explique su funcionamiento mediante un ejemplo.
#### FCFS - First come first served
- Cuando hay que elegir un proceso para ejecutar, se selecciona el mas viejo
- No favorece a ningún tipo de procesos, pero en principio prodı́amos decir que los CPU Bound terminan al comenzar su primer ráfaga, mientras que los I/O Bound no
*Ejemplo*:
Al momento de elegir un proceso para ocupar la CPU, el algoritmo de FCFS toma de la cola de Ready el proceso que mas tiempo este en la cola.

#### SJF (Shortest Job First)
- Polı́tica nonpreemptive que selecciona el proceso con la ráfaga más corto
- Calculo basado en la ejecución previa
- Procesos cortos se colocan delante de procesos largos
- Los procesos largos pueden sufrir starvation (inanición)

*Ejemplo*:
Al momento de seleccionar un proceso de la cola de Ready, se toma el proceso que menos tiempo halla utilizado la CPU anteriormente.

#### Round Robin

- Politica basada en un reloj
- Quantum (Q): medida que determina cuanto tiempo podrá usar el procesador cada proceso:
- Cuando un proceso es expulsado de la CPU es colocado al final de la Ready Queue y se selecciona otro (FIFO circular )
- Existe un “contador” que indica las unidades de CPU en las que el proceso se ejecuto. Cuando el mismo llega a 0 el proceso es expulsado
- El “contador” puede ser: Global o Local ( PCB )
- Existen dos variantes con respecto al valor inicial del “contador” cuando un proceso es asignado a la CPU: Timer Variable - Timer Fijo
*Ejemplo*:
Se utiliza una cola, se selecciona el que esta en el tope de la cola, al terminar el Quantum, si no finalizo la ejecucion vuelve a ingresar a la cola, y se selecciona el siguiente del tope de la cola.

#### Prioridades
- Cada proceso tiene un valor que representa su prioridad → menor valor, mayor prioridad
- Se selecciona el proceso de mayor prioridad de los que se encuentran en la Ready Queue
- Existe una Ready Queue por cada nivel de prioridad
-  Procesos de baja prioridad pueden sufrir starvation (inanición)
- Solución: permitir a un proceso cambiar su prioridad durante su ciclo de vida → Aging o Penalty
- Puede ser un algoritmo preemptive o no

*Ejemplo*:
Se selecciona de la cola con mayor prioridad, si tiene procesos, si no tiene va a la cola de prioridad proxima inferior, y se selecciona el proceso. 


### (b) ¿Alguno de ellos requiere algún parámetro para su funcionamiento?
Si, El SJF precisa un historial de uso de cpu de cada proceso, y Round Robin precisa el Quantum.

### (c) Cual es el mas adecuado según los tipos de procesos y/o SO.
CPU Bound:
- Prioridades
- FCFS

I/O Bound:
- SJF
- Prioridades
- Round Robin
### (d) Cite ventajas y desventajas de su uso.
- FCFS:
Ventaja: Todos los procesos terminar de la manera mas rapida posible.
Desventaja: No hay grado de multiprogramacion
- SJF:
Ventaja: El conjunto de jobs que menos tiempo tarden, terminaran en menos tiempo.
Desventaja: Los jobs que tarden mas, pueden sufrir inanicion. 
- Round Robin:
Ventaja: Sube el grado de multiprogramacion
Desventaja: Si un job no termina en un quantum, tendra que esperar a que se de la vuelta a la cola.
- Prioridades:
Ventaja: brinda mas control sobre la eleccion entre procesos
Desventaja: Los procesos con menos prioridad pueden sufrir inanicion, logica estructural mas compleja.

## 4. Para el algoritmo Round Robin, existen 2 variantes:
- Timer Fijo
- Timer Variable

### (a) ¿Qué significan estas 2 variantes?
- Timer Fijo:
El “contador” se inicializa en Q cuando su valor es cero if (contador == 0) contador = Q;
- Timer Variable:
El “contador” se inicializa en Q (contador := Q) cada vez que un proceso es asignado a la CPU. Es el más utilizado.

### (b) Explique mediante un ejemplo sus diferencias.
Con el Timer Fijo, al momento que un proceso sale de la CPU y entra otro proceso, el Quantum no vuleve a 0, y lo que resta del Quantum es lo que el segundo proceso utiliza de CPU. Mientras que con el Timer Variable, cuando un proceso sale de la CPU el Quantum se actualiza y el siguiente proceso puede ejecutar un Quatum entero.

### (c) En cada variante ¿Dónde debería residir la información del Quantum?
En el caso de un Timer Fijo, la información del Quantum podría estar en una estructura de control de procesos global, ya que el contador se mantiene constante entre procesos. En cambio, con un Timer Variable, cada proceso tiene su propio Quantum que se reinicia al asignarse la CPU, por lo que sería más adecuado almacenarlo en la PCB (Process Control Block) de cada proceso para un control individual y más dinámico.

## 5. Se tiene el siguiente lote de procesos que arriban al sistema en el instante 0 (cero):

|-----|-----------------|
| Job | Unidades de CPU |
|-----|-----------------|
|  1  |       7         |
|  2  |      15         |
|  3  |      12         |
|  4  |       4         |
|  5  |       9         |
|-----|-----------------|
```
# Ejercicio5
TAREA "1"  INICIO=0
[CPU,7]

TAREA "2"  INICIO=0
[CPU,15]

TAREA "3"  INICIO=0
[CPU,12]

TAREA "4"  INICIO=0
[CPU,4]

TAREA "5"  INICIO=0
[CPU,9]
```

### (a) Realice los diagramas de Gantt según los siguientes algoritmos de scheduling:
#### i. FCFS (First Come, First Served)
#### ii. SJF (Shortest Job First)
#### iii. Round Robin con quantum = 4 y Timer Fijo
#### iv. Round Robin con quantum = 4 y Timer Variable

### (b) Para cada algoritmo calcule el TR y TE para cada job así como el TPR y el TPE.
### (c) En base a los tiempos calculados compare los diferentes algoritmos.

## 6. Se tiene el siguiente lote de procesos:
### (a) Realice los diagramas de Gantt según los siguientes algoritmos de scheduling:

|-----|---------|-----------------|
| Job | Llegada | Unidades de CPU |
|-----|---------|-----------------|
|  1  |    0    |       4         |
|  2  |    2    |       6         |
|  3  |    3    |       4         |
|  4  |    6    |       5         |
|  5  |    8    |       2         |
|-----|---------|-----------------|
```
# Ejercicio6
TAREA "1"  INICIO=0
[CPU,4]

TAREA "2"  INICIO=2
[CPU,6]

TAREA "3"  INICIO=3
[CPU,4]

TAREA "4"  INICIO=6
[CPU,5]

TAREA "5"  INICIO=8
[CPU,2]

```

#### i. FCFS (First Come, First Served)
#### ii. SJF (Shortest Job First)
#### iii. Round Robin con quantum = 1 y Timer Variable
#### iv. Round Robin con quantum = 6 y Timer Variable
### (b) Para cada algoritmo calcule el TR y TE para cada job así como el TPR y el TPE.
### (c) En base a los tiempos calculados compare los diferentes algoritmos.
### (d) En el algoritmo Round Robin, que conclusión se puede sacar con respecto al valor del quantum.
### (e) ¿Para el algoritmo Round Robin, en que casos utilizaría un valor de quantum alto y que ventajas y desventajas obtendría?

## 7. Una variante al algoritmo SJF es el algoritmo SJF apropiativo o SRTF (Shortest Remaining Time First):
### (a) Realice el diagrama del Gantt para este algoritmo según el lote de trabajos del ejercicio 6.
### (b) ¿Nota alguna ventaja frente a otros algoritmos?
En este ejemplo, el resultado es el mismo, aunque SRTF tiene igual o menos tiempo de respuesta y de espera.

## 8. Suponga que se agregan las siguientes prioridades al lote de procesos del ejercicio 6, donde un menor número indica mayor prioridad:
`
|-----|-----------|---------|-----------------|
| Job | Prioridad | Llegada | Unidades de CPU |
|-----|-----------|---------|-----------------|
|  1  |     3     |    0    |       4         |
|  2  |     4     |    2    |       6         |
|  3  |     2     |    3    |       4         |
|  4  |     1     |    6    |       5         |
|  5  |     2     |    8    |       2         |
|-----|-----------|---------|-----------------|
`
### (a) Realice el diagrama de Gantt correspondiente al algoritmo de planificación por prioridades según las variantes:
i. No Apropiativa
ii. Apropiativa

### (b) Calcule el TR y TE para cada job así como el TPR y el TPE.

### (c) ¿Nota alguna ventaja frente a otros algoritmos? Bajo que circunstancias lo utilizaría y ante que situaciones considera que la implementación de prioridades podría no ser de mayor relevancia?
La ventaja es que el Sistema Operativo se adapte mejor a la necesidad del uso de la CPU, pudiendo administrar las prioridades, y estas pueden ser cambiadas segun ciertas circunstancias.
Lo utilizaria en situaciones donde las prioridades de ejecucion puedan variar sobre el tiempo aprovechando la capacidad de decision al elegir diferentes pocesos con diferentes prioridades.

## 9. Inanición (Starvation)
### (a) ¿Qué significa?
Es cuando un proceso queda al final de la estructura y nunca llega a elegirse, por ende, nunca se ejecuta.

### (b) ¿Cuál/es de los algoritmos vistos puede provocarla?
- Prioridades
- SRTF

### (c) ¿Existe alguna técnica que evite la inanición para el/los algoritmos mencionados en b?
Si, Aging es la tecnica. Si no se ejecuta en determinado tiempo, aumenta la prioridad de ejecucion.

## 10. Los procesos, durante su ciclo de vida, pueden realizar operaciones de I/O como lecturas o escrituras a disco, cintas, uso de impresoras, etc. El SO mantiene para cada dispositivo, que se tiene en el equipo, una cola de procesos que espera por la utilización del mismo (al igual que ocurre con la Cola de Listos y la CPU, ya que la CPU es un dispositivo mas). Cuando un proceso en ejecución realiza una operación de I/O el mismo es expulsado de la CPU y colocado en la cola correspondiente a el dispositivo involucrado en la operación. El SO dispone también de un “I/O Scheduling” que administrada cada cola de dispositivo a través de algún algoritmo (FCFS, Prioridades, etc.). Si al colocarse un proceso en la cola del dispositivo, la misma se encuentra vacía el mismo será atendido de manera inmediata, caso contrario, deberá esperar a que el SO lo seleccione según el algoritmo de scheduling establecido. Los mecanismos de I/O utilizados hoy en día permiten que la CPU no sea utilizada durante la operación, por lo que el SO puede ejecutar otro proceso que se encuentre en espera una vez que el proceso bloqueado por la I/O se coloca en la cola correspondiente. Cuando el proceso finaliza la operación de I/O el mismo retorna a la cola de listos para competir nuevamente por la utilización de la CPU.

Para los siguientes algoritmos de Scheduling:
- FCFS
- Round Robin con quantum = 2 y timer variable.

Y suponiendo que la cola de listos de todos los dispositivos se administra mediante FCFS, realice los diagramas de Gantt según las siguientes situaciones:

## (a) Suponga que al lote de procesos del ejercicio 6 se agregan las siguientes operaciones de entrada salida:

Job | I/O (rec,ins,dur)
1   | (R1, 2, 1)
2   | (R2, 3, 1) (R2, 5, 2)
3   | (R3, 1, 2) (R3, 3, 1)

## (b) Suponga que al lote de procesos del ejercicio 6 se agregan las siguientes operaciones de entrada salida:

Job | I/O (rec,ins,dur)
1   | (R1, 2, 3) (R1, 3, 2)
2   | (R2, 3, 2)
3   | (R2, 2, 3)
4   | (R1, 1, 2)

## 11. Algunos algoritmos pueden presentar ciertas desventajas cuando en el sistema se cuenta con procesos ligados a CPU y procesos ligados a entrada salida. Analice las mismas para los siguientes algoritmos:
### (a) Round Robin
Al tener una unica cola, es necesario que el proceso recorra toda la cola al terminar el quantum, lo que lelvaria que un proceso que dure poco en la cpu, y sea mas grande que el quantum, como por ejemplo un proceso de entrada salida, tarde mas.

### (b) SRTF (Shortest Remaining Time First)
Mientras que el SRTF benefian a los procesos de entrada salida, ya que el cambio entre procesos lo hara cuando se ingrese uno nuevo en la cola, y no tiene que dar toda la vuelta a la cola. 


## 12. Para equiparar la desventaja planteada en el ejercicio 11), se plantea la siguiente modificación al algoritmo:
Algoritmo VRR (Virtual Round Robin): Este algoritmo funciona igual que el Round Robin, con la diferencia que cuando un proceso regresa de una I/O se coloca en una cola auxiliar. Cuando se tiene que tomar el próximo proceso a ejecutar, los procesos que se encuentra en la cola auxiliar tienen prioridad sobre los otros. Cuando se elije un proceso de la cola auxiliar se le otorga el procesador por tantas unidades de tiempo como le falto ejecutar en su ráfaga de CPU anterior, esto es, se le otorga la CPU por un tiempo que surge entre la diferencia del quantum original y el tiempo usado en la última ráfaga de CPU.

### (a) Analice el funcionamiento de este algoritmo mediante un ejemplo. Marque en cada instante en que cola se encuentran los procesos.
### (b) Realice el ejercicio 10)a) nuevamente considerando este algoritmo, con un quantum de 2 unidades y Timer Variable.


## 13. Suponga que un SO utiliza un algoritmo de VRR con Timer Variable para el planificar sus procesos. Para ello, el quantum es representado por un contador, que es decrementado en 1 unidad cada vez que ocurre una interrupción de reloj. ¿Bajo este esquema, puede suceder que el quantum de un proceso nunca llegue a 0 (cero)? Justifique su respuesta.
Siempre va a llegar a 0 debido a que, por mas que un proceso haga una I/O al volver quedara con el quantum que le faltaba, hasta que llegue a 0.

## 14. El algoritmo SJF (y SRTF) tiene como problema su implementación, dada la dificultad de conocer la duración de la próxima ráfaga de CPU. Es posible realizar una estimación de la próxima, utilizando la media de las ráfagas de CPU para cada proceso. Así, por ejemplo, podemos tener la siguiente formula:
Sn+1 = 1/n Tn + (n−1 / n)Sn

Donde:
Ti = duración de la ráfaga de CPU i-ésima del proceso.
Si = valor estimado para el i-ésimo caso
Si = valor estimado para la primer ráfaga de CPU. No es calculado.

### (a) Suponga un proceso cuyas ráfagas de CPU reales tienen como duración: 6, 4, 6, 4, 13, 13, 13 Calcule que valores se obtendrían como estimación para las ráfagas de CPU del proceso si se utiliza la formula 1, con un valor inicial estimado de S1 =10. La formula anterior 1 le da el mismo peso a todos los casos (siempre calcula la media). Es posible reescribir la formula permitiendo darle un peso mayor a los casos mas recientes y menor a casos viejos (o viceversa). Se plantea la siguiente formula:
Sn+1 = αTn + (1 − α)Sn

Con 0 h α h 1.

### (b) Analice para que valores de α se tienen en cuenta los casos mas recientes.
### (c) Para la situación planteada en a) calcule que valores se obtendrían si se utiliza la formula 2 con α = 0, 2; α = 0, 5 y α = 0, 8.
### (d) Para todas las estimaciones realizadas en a y c ¿Cuál es la que mas se asemeja a las ráfagas de CPU reales del proceso?


# WTF?


## 15. Colas Multinivel
Hoy en día los algoritmos de planificación vistos se han ido combinando para formar algoritmos más eficientes. Así surge el algoritmo de Colas Multinivel, donde la cola de procesos listos es divida en varias colas, teniendo cada una su propio algoritmo de planificación.


### (a) Suponga que se tienen dos tipos de procesos: Interactivos y Batch. Cada uno de estos procesos se coloca en una cola según su tipo. ¿Qué algoritmo de los vistos utilizaría para administrar cada una de estas colas?. A su vez, se utiliza un algoritmo para administrar cada cola que se crea. Así, por ejemplo, el algoritmo podría determinar mediante prioridades sobre que cola elegir un proceso.
Para la cola de interactivos utilizaria VRR o SRTF
Para la cola de Batch utilizaria FCFS 
### (b) Para el caso de las dos colas vistas en a: ¿Qué algoritmo utilizaría para planificarlas?
Prioridades para la eleccion de colas 

## 16. Suponga que en un SO se utiliza un algoritmo de planificación de colas multinivel. El mismo cuenta con 3 colas de procesos listos, en las que los procesos se encolan en una u otra según su prioridad. Hay 3 prioridades (1 , 2 , 3), donde un menor número indica mayor prioridad. Se utiliza el algoritmo de prioridades para la administración entre las colas. Se tiene el siguiente lote de procesos a ser procesados con sus respectivas operaciones de I/O:



|-----|---------|-----------------|
| Job | Llegada | Unidades de CPU |
|-----|---------|-----------------|
|  1  |    0    |       9         |
|  2  |    1    |       5         |
|  3  |    2    |       5         |
|  4  |    3    |       7         |
|  5  |    5    |       5         |
|-----|---------|-----------------|


Prioridad | I/O (rec,ins,dur)
    1     | (R1, 4, 2) (R2, 6, 3) (R1, 8, 3)
    2     | (R3, 3, 2) (R3, 4, 2)
    3     | (R1, 4, 1)
    2     | (R2, 1, 2) (R2, 5, 3)
    1     | (R1, 2, 3) (R3, 4, 3)


Suponiendo que las colas de cada dispositivo se administran atraves de FCFS y que cada cola de procesos listos se administra por medio de un algoritmo RR con un quantum de 3 unidades y Timer Variable, realice un diagrama de Gantt:

### (a) Asumiendo que NO hay apropiación entre los procesos.
### (b) Asumiendo que hay apropiación entre los procesos.

## 17. En el esquema de Colas Multinivel, cuando se utiliza un algoritmo de prioridades para administrar las diferentes colas los procesos pueden sufrir starvation. La técnica de envejecimiento se puede aplicar a este esquema, haciendo que un proceso cambie de una cola de menor prioridad a una de mayor prioridad, después de cierto periodo de tiempo que el mismo se encuentra esperando en su cola. Luego de llegar a una cola en la que el proceso llega a ser atendido, el mismo retorna a su cola original.

Por ejemplo: Un proceso con prioridad 3 esta en cola su cola correspondiente. Luego de X unidades de tiempo, el proceso se mueve a la cola de prioridad 2. Si en esta cola es atendido, retorna a su cola original, en caso contrario luego de sucederse otras X unidades de tiempo el proceso de mueve a la cola de prioridad 1. Esta última acción se repite hasta que el proceso obtiene la CPU, situación que hace que el mismo vuelva a su cola original.

### (a) Para los casos a y b del ejercicio 16 realice el diagrama de Gantt considerando además que se tiene un envejecimiento de 4 unidades.

## 18. La situación planteada en el ejercicio 17, donde un proceso puede cambiar de una cola a otra, se la conoce como Colas Multinivel con Realimentación.

Suponga que se quiere implementar un algoritmo de planificación que tenga en cuenta el tiempo de ejecución consumido por el proceso, penalizando a los que más tiempo de ejecución tienen. (Similar a la tarea del algoritmo SJF que tiene en cuenta el tiempo de ejecución que resta).
Utilizando los conceptos vistos de Colas Multinivel con Realimentación indique que colas implementaría, que algoritmo usaría para cada una de ellas así como para la administración de las colas entre sí. Tenga en cuenta que los procesos no deben sufrir inanición.

Colas: SRTF
Administrar colas: SFJ + envejecimiento

## 19. Un caso real: “Unix Clasico “ (SVR3 y BSD 4.3)
Estos sistemas estaban dirigidos principalmente a entornos interactivos de tiempo compartido. El algoritmo de planificación estaba diseñado para ofrecer buen tiempo de respuesta a usuarios interactivos y asegurar que los trabajos de menor prioridad (en segundo plano) no sufrieran inanición. La planificación tradicional usaba el concepto de colas multinivel con realimentación, utilizando RR para cada uno de las colas y realizando el cambio de proceso cada un segundo (quantum). La prioridad de cada proceso se calcula en función de la clase de proceso y de su historial de ejecución. Para ello se aplican las siguientes funciones:
CP Uj (i − 1)
2
CP Uj (i)
Pj (i) = Basej +
+ nicej
2
CP Uj (i) =

(3)
(4)

donde:
CPUj (i) = Media de la utilización de la CPU del proceso j en el intervalo i.
Pj (i) = Prioridad del proceso j al principio del intervalo i (los valores inferiores indican
prioridad más alta).
Basej = Prioridad base del proceso j.
Nicej = Factor de ajuste.
La prioridad del proceso se calcula cada segundo y se toma una nueva decisión de planificación. El propósito de la prioridad base es dividir los procesos en bandas fijas de prioridad.
Los valores de CPU y nice están restringidos para impedir que un proceso salga de la banda que tiene asignada. Las bandas definidas, en orden decreciente de prioridad, son:
Intercambio
Control de Dispositivos de I/O por bloques
Gestión de archivos
Control de Dispositivos de I/O de caracteres
Procesos de usuarios
Veamos un ejemplo: Supongamos 3 procesos creados en el mismo instante y con prioridad
base 60 y un valor nice de 0. El reloj interrumpe al sistema 60 veces por segundo e incrementa
un contador para el proceso en ejecución.
Los sectores en celeste representan el proceso en ejecución.
### (a) Analizando la jerarquía descripta para las bandas de prioridades: ¿Que tipo de actividad considera que tendrá más prioridad? ¿Por qué piensa que el scheduler prioriza estas actividades?
### (b) Para el caso de los procesos de usuarios, y analizando las funciones antes descriptas: ¿Qué tipo de procesos se encarga de penalizar? (o equivalentemente se favorecen). Justifique
### (c) La utilización de RR dentro de cada cola: ¿Verdaderamente favorece al sistema de Tiempo Compartido? Justifique.

## 20. A cuáles de los siguientes tipos de trabajos:
### (a) cortos acotados por CPU
### (b) cortos acotados por E/S
### (c) largos acotados por CPU
### (d) largos acotados por E/S

benefician las siguientes estrategias de administración:

### (a) prioridad determinada estáticamente con el método del más corto primero (SJF).
a y b
### (b) prioridad dinámica inversamente proporcional al tiempo transcurrido desde la última operación de E/S.
d

## 21. Explicar porqué si el quantum "q.en Round-Robin se incrementa sin límite, el método se aproxima a FIFO.
Porque nunca se generaria un context switch

## 22. Los sistemas multiprocesador pueden clasificarse en:
- Homogéneos: Los procesadores son iguales. Ningún procesador tiene ventaja física sobre el resto.
- Heterogéneos: Cada procesador tiene su propia cola y algoritmo de planificación.
Otra clasificación posible puede ser:
- Multiprocesador débilmente acoplados: Cada procesador tiene su propia memoria principal y canales.
- Procesadores especializados: Existe uno o más procesadores principales de propósito general y varios especializados controlados por el primero (ejemplo procesadores de E/S, procesadores Java, procesadores Criptográficos, etc.).
- Multiprocesador fuertemente acoplado: Consta de un conjunto de procesadores que comparten una memoria principal y se encuentran bajo el control de un Sistema Operativo

### (a) ¿Con cuál/es de estas clasificaciones asocia a las PCs de escritorio habituales?
Homogeneo y multiprocesador fuertemente acoplado
### (b) ¿Qué significa que la asignación de procesos se realice de manera simétrica?
Que mantenga un balance de trabajo en todos los procesadores 
### (c) ¿Qué significa que se trabaje bajo un esquema Maestro/esclavo?
Que un procesador es el que dirige a los demas 


## 23. Asumiendo el caso de procesadores homogéneos:
### (a) ¿Cuál sería el método de planificación más sencillo para asignar CPUs a los procesos?
El metodo seria utilizar una cola de procesadores donde se envien los procesos y a medida que se complenten se agreguen nuevamente a la cola de procesadores listos para trabajar junto con una cola de procesos de tipo FCFS

### (b) Cite ventajas y desventajas del método escogido
No hay prioridades

## 24. Conceptos clave en Sistemas Operativos
### (a) Huella de un proceso en un procesador

Hace referencia a los datos que un proceso deja en la memoria caché del procesador, como instrucciones y datos frecuentemente usados. Esto mejora su rendimiento si vuelve a ejecutarse en el mismo núcleo.
(b) Afinidad con un procesador

Es la preferencia o asignación de un proceso para ejecutarse en un procesador específico o conjunto de núcleos, lo que optimiza el uso de la caché y reduce la latencia.
### (c) ¿Por qué podría ser mejor que un proceso se ejecute en el mismo procesador?

Para maximizar el rendimiento al reutilizar los datos en la caché del núcleo, reduciendo la latencia al evitar recargar datos en memoria.
### (d) ¿Puede el usuario cambiar la afinidad de un proceso?

    Windows: Sí, desde el Administrador de tareas o usando taskset.
    GNU/Linux: Sí, con el comando taskset o desde herramientas gráficas como htop.

### (e) Balanceo de carga (load balancing)

Es la distribución equitativa de la carga de trabajo entre múltiples procesadores o sistemas, asegurando que ninguno esté sobrecargado mientras otros están infrautilizados.
### (f) Comparación: afinidad vs. balanceo de carga

    Afinidad: Optimiza el rendimiento al mantener un proceso en un procesador específico.
    Balanceo de carga: Prioriza distribuir tareas para maximizar el uso de los recursos.
    Relación: La afinidad puede dificultar el balanceo si los procesos quedan anclados a un núcleo sobrecargado.
## 25. Si a la tabla del ejercicio 6 la modificamos de la siguiente manera: Y considerando que el Job
scheduler de los Sistemas Operativos de la familia Windows utiliza un mecanismo denominado preferred processor (procesador preferido). El scheduler usa el procesador preferido a modo de afinidad cuando el proceso esta en estado ready. De esta manera el sheduler asigna este procesador a la tarea si este está libre.



| Job | Llegada | CPU | Afinidad |
|  1  |    0    |  4  |   CPU0   |
|  2  |    2    |  6  |   CPU0   |
|  3  |    3    |  4  |   CPU1   |
|  4  |    6    |  5  |   CPU1   |
|  5  |    8    |  2  |   CPU0   |


### (a) Ejecute el esquema anterior utilizando el algoritmo anterior.
### (b) Ejecute el esquema anterior. Pero ahora si el procesador preferido no está libre es asignado a otro procesador. Luego el procesador preferido de cada job es el último en el cual ejecuto.
### (c) Para cada uno de los casos calcule el tiempo promedio de retorno y el tiempo promedio de espera.
### (d) ¿Cuál de las dos alternativas planteadas es mas performante?

