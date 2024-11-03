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

