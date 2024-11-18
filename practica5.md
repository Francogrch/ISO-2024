# Trabajo Práctico Nº 5
Administración de la Memoria Principal

---
## 1.- Explique a que hacen referencia los siguientes términos:
- Dirección Lógica o Virtual: es la direccion que utiliza el kernel para poder administrar los bloques de memoria
- Dirección Física: es la direccion real, en donde se encuentra el dato dentro del disco

---
## 2.- En la técnica de Particiones Múltiples, la memoria es divida en varias particiones y los procesos son ubicados en estas, siempre que el tamaño del mismo sea menor o igual que el tamaño de la partición. Al trabajar con particiones se pueden considerar 2 métodos (independientes entre si):
- Particiones Fijas
- Particiones Dinámicas

### a) Explique como trabajan estos 2 métodos. Cite diferencias, ventajas y desventajas.

#### **Particiones Fijas**
- **Funcionamiento**: La memoria principal se divide en particiones de tamaño fijo. Cada partición aloja un único proceso.
- **Diferencias**: 
  - Tamaños de partición predefinidos, no se ajustan según el proceso.
  - Los tamaños pueden ser iguales o diferentes, pero permanecen constantes.
- **Ventajas**:
  - Sencillez en la implementación y gestión.
  - Reducción del overhead del sistema operativo.
- **Desventajas**:
  - **Fragmentación interna**: Espacio no utilizado dentro de las particiones.
  - Ineficiencia si los procesos tienen requerimientos de memoria menores al tamaño de la partición.

#### **Particiones Dinámicas**
- **Funcionamiento**: La memoria se divide dinámicamente según las necesidades del proceso.
- **Diferencias**:
  - Las particiones se crean y dimensionan en tiempo de ejecución.
- **Ventajas**:
  - Aprovechamiento más eficiente de la memoria, ajustando el tamaño de cada partición al proceso.
  - Eliminación de la fragmentación interna.
- **Desventajas**:
  - **Fragmentación externa**: Espacios libres no contiguos que impiden alojar procesos grandes.
  - Overhead en la gestión de memoria debido a la necesidad de consolidación y mantenimiento de la tabla de particiones.


### b) ¿Qué información debe disponer el SO para poder administrar la memoria con estos métodos?

Precisa conocer la ubicacion de la particion (direccion de inicio de particion y el OFFSET)
El sistema operativo necesita gestionar la ubicación de cada partición. Esto incluye:
1. **Dirección base** (inicio de la partición).
2. **Tamaño de la partición** (para cálculo de direcciones).
3. **Offset**: Desplazamiento dentro de la partición para traducir direcciones lógicas a físicas.


### c) Realice un gráfico indicado como realiza el SO la transformación de direcciones lógicas a direcciones físicas.

**Descripción del proceso**:
1. El SO toma la **dirección lógica** generada por un proceso.
2. Añade el **offset** de la partición, correspondiente a la dirección base de la partición en memoria física.
3. El resultado es la **dirección física**.

Direccion Logica --> MMU --> Memoria
MMU:Suma el offset junto con la direccion logica 

---
## 3.- Al trabajar con particiones fijas, los tamaños de las mismas se pueden considerar:
- Particiones de igual tamaño.
- Particiones de diferente tamaño.
Cite ventajas y desventajas de estos 2 métodos.

#### **1. Particiones de Igual Tamaño**

**Ventajas**:  
- **Simplicidad** en la implementación y administración por parte del sistema operativo.  
- Reducción de **overhead** de gestión: no es necesario calcular particiones personalizadas para cada proceso.  
- Ideal para entornos donde los procesos tienen requerimientos de memoria uniformes.  

**Desventajas**:  
- **Fragmentación interna** significativa si los procesos requieren menos memoria que el tamaño de la partición.  
- Ineficiencia cuando se ejecutan procesos pequeños junto a procesos grandes, ya que los grandes no caben si la partición fija es muy pequeña.


#### **2. Particiones de Diferente Tamaño**

**Ventajas**:  
- Mejora el uso de la memoria al **adaptarse mejor** a procesos de distintos tamaños.  
- Reduce la fragmentación interna para procesos que requieren menos memoria que la partición grande.  
- Más flexible al manejar cargas de trabajo mixtas (procesos grandes y pequeños).  

**Desventajas**:  
- Complejidad de **gestión**: requiere un control más sofisticado para asignar procesos a particiones de tamaño adecuado.  
- Puede aumentar el **tiempo de espera** si no hay particiones disponibles para procesos grandes, incluso cuando hay memoria suficiente en particiones pequeñas.  

---
## 4.- Fragmentación
Ambos métodos de particiones presentan el problema de la fragmentación:
- Fragmentación Interna (Para el caso de Particiones Fijas)
- Fragmentación Externa (Para el caso de Particiones Dinámicas)
### a) Explique a que hacen referencia estos 2 problemas
#### Fragmentacion Interna:
- Es interna a la localidad asignada
- Es la porci´on de la localidad que queda sin utilizar
#### Fragmentaci´on Externa:
- Son huecos que van quedando en la memoria a medida que los procesos finalizan
- Al no encontrarse en forma contigua puede darse el caso de que tengamos memoria libre para alocar un proceso, pero que no la podamos utilizar

### b) El problema de la Fragmentación Externa es posible de subsanar. Explique una técnica que evite este problema.
Se puede utilizar la compactacion, que lo que hace es que mueve todas las particiones ocupadas, de manera contigua, para que el espacio libre este todo junto, y de esta manera que no halla fragmentacion externa. El problema es que utilizar esta tecnica ocupa mucho tiempo de cpu.

---
## 5.- Paginación
### a) Explique como trabaja este método de asignación de memoria.
- La memoria se divide en porciones de igual tamanio llamadas marco
- El espacio de direcciones de los procesos se divide en porciones de igual tamanio denominadas paginas
- Tamanio pagina = tamanio marco = 512 bytes (generalmente)
### b) ¿Qué estructuras adicionales debe poseer el SO para llevar a cabo su implementación?
- La tabla de paginas, que contiene numero de pagina relacionado con el numero de marco
- La tabla de marcos, que contiene el numero de marco relacionado con el inicio fin del mismo

### c) Explique, utilizando gráficos, como son transformadas las direcciones lógicas en físicas.
- Si tenemos una direccion virtual, por ejemplo 580:
• Para averiguar el numero de pagina hacemos 580 div 512 = 1.
• Luego esta direccion corresponde a la pagina 1 que se encuentra en el marco 2
• Para averiguar el desplazamiento hacemos 580 mod 512 = 68
• La direccion fısica es 1024 + 68 = 1092

- Si tenemos una direccion fisica, por ejemplo 1092:
• Para averiguar el numero de marco hacemos 1092 div 512 = 2.
• En el marco numero 2 tenemos la pagina numero 1
• Para averiguar el desplazamiento hacemos 1092 mod 512 = 68
• La direccion virtual es 512 + 68 = 580

### d) En este esquema: ¿Se puede producir fragmentación (interna y/o externa)?
Puede haber fragmentacion interna, ya que un proceso puede no ocupar toda la pagina.

---
## 6.- Cite similitudes y diferencias entre la técnica de paginación y la de particiones fijas.
### **Diferencias entre Paginación y Particiones Fijas**

| **Aspecto**               | **Paginación**                                           | **Particiones Fijas**                                     |
|-----------------------|------------------------------------------------------|--------------------------------------------------------|
| **Tamaño de los bloques** | Marcos de tamaño uniforme, definidos por el sistema. | Tamaños de particiones definidos al iniciar el sistema.|
| **Fragmentación**         | Genera **fragmentación interna** solo en el último marco.| Genera **fragmentación interna** en todas las particiones. |
| **Asignación de memoria** | Divide el proceso en **páginas** y las asigna a marcos.  | Un proceso ocupa una partición completa.               |
| **Flexibilidad**          | Permite una mejor utilización de memoria física.     | Menos flexible, especialmente con procesos más pequeños|
| **Traduc. de direcciones**| Requiere una **tabla de páginas**.                       | No necesita tabla; la dirección base se fija por partición|
|-----------------------|------------------------------------------------------|--------------------------------------------------------|

---
## 7.- Suponga un sistema donde la memoria es administrada mediante la técnica de paginación, y donde:

- El tamaño de la página es de 512 bytes
- Cada dirección de memoria referencia 1 byte.
- Los marcos en memoria principal de encuentran desde la dirección física 0.
- Suponga además un proceso con un tamaño 2000 bytes y con la siguiente tabla de páginas:

Página | Marco
  0    |   3
  1    |   5
  2    |   2
  3    |   6

### a) Realice los gráficos necesarios (de la memoria, proceso y tabla de paginas) en el que reflejen el estado descrito.

| Marco | Inicio-Fin |
|   0   |   0-511    |
|   1   |  512-1023  |
|   2   |  1024-1535 |
|   3   |  1536-2047 |
|   4   |  2048-2559 |
|   5   |  2560-3071 |
|   6   |  3072-3583 |


|    Memoria     |
| Marco | Pagina |
|   0   |        |
|   1   |        |
|   2   |   2    |
|   3   |   0    |
|   4   |        |
|   5   |   1    |
|   6   |   3    |


### b) Indicar si las siguientes direcciones lógicas son correctas y en caso afirmativo indicar la dirección física a la que corresponden:
#### i) 35
Numero de pagina = 35 / 512 = 0
Desplezamiento = 35 mod 512 = 35
Pagina 0 -> Marco 3
Marco 3 = 1536 + 35 = 1571
Direccion fisica 1571

#### ii) 512
512 / 512 = pagina 1
512 mod 512 = desplazamiento 0
Pagina 1 -> Marco 5
Direccion fisica = 2560 + 0 = 2560

#### iii) 2051
2051 / 512 = 4
No hay pagina 4, esta direcicon logica es incorrecta.

#### iv) 0
Esta en el marco 3
Direccion fisica = 1536

#### v) 1325
1325 / 512 = 3 
1325 mod 512 = 301
Direccion fisica =  1536 + 301 = 1837

#### vi) 602
602 / 512 = 1 
602 mod 512 = 90
Direccion Fisica = 512 + 90 = 602

### c) Indicar, en caso de ser posible, las direcciones lógicas del proceso que se corresponden si las siguientes direcciones físicas:
#### i) 509
Marco: 0
Pagina: -
No corresponde a ninguna pagina del proceso

#### ii) 1500
Marco: 2
Pagina: 2
(direccion - inicio de Marco)
1500 - 1024 = 476 
Direcion logica = 476 

#### iii) 0
Marco: 0
Pagina: -
No corresponde a ninguna pagina del proceso

#### iv) 3215
Marco: 6
Pagina: 3
3215 - 3072 = 143
Direccion logica = 143
#### v) 1024
Marco: 2
Pagina: 2
Direccion logica = 0

#### vi) 2000
Marco: 3
Pagina: 0
1536 - 2000 = 464
Direccion logica = 464

### d) ¿Indique, en caso que se produzca, la fragmentación (interna y/o externa)?
Se produce fragementacion interna en el ultimo la ultima pagina, que esta en el marco 6.

---
## 8.- Considere un espacio lógico de 8 paginas de 1024 bytes cada una, mapeadas en una memoria física de 32 marcos.
### a) ¿Cuantos bits son necesarios para representar una dirección lógica?
2^10 = 1024
10 bits
### b) ¿Cuantos bits son necesarios para representar una dirección física?
1024x32 = 32768
2^15 = 32768

---

## 9.- Segmentación
### a) Explique como trabaja este método de asignación de memoria.
- La segmentacion basicamente la podemos ver como una mejora de la paginaci´on (no hay F.I., sino externa)
- Un programa es una colección de segmentos. Un segmento es una unidad lógica como: Programa Principal, Procedimientos y Funciones, variables locales y globales, stack, etc.
- Ahora la tabla de segmentos, ademas de tener la direccion de inicio del mismo, tiene la longitud o limite
- Las direcciones logicas constan de dos partes → un numero de segmento s y un desplazamiento d dentro del segmento
- Todos los segmentos de un programa pueden no tener el mismo tamaño (código, datos, rutinas).

### b) ¿Qué estructuras adicionales debe poseer el SO para llevar a cabo su implementación?
Necesita una tabla de segmentos donde esta el numero de segmento, junto con la direcciond del segmento. En esta direccion esta el inicio de segmento y el largo del mismo, se utiliza la misma direccion, dividda por bits.

### c) Explique, utilizando gráficos, como son transformadas las direcciones lógicas en físicas.
Dado una direccion de 16 bits, se pueden utilizar 4 bits para identificar el segmento, y los demas para el tamanio.
Cuando llega una direccion logica, se toman los bits del offset y se suman a los bits de base que estan almacenados en la tabla de segmento.
En la tabla de segmentos, hay 16 bits de base, y otros bits de largo.

### d) En este esquema: ¿Se puede producir fragmentación (interna y/o externa)?
Se puede producir fragmentacion externa, ya que dentro de un segmentos al tener diferente tamanio, los espacios que quedan entre segmentos son espacio inutilizado si el segmento que tiene que entrar ocupa mas espacio.

---
## 10.- Cite similitudes y diferencias entre la técnica de segmentación y la de particiones dinámicas.

Similitudes:
- Segmentos como particiones, son dinamicos y no fijos, no hay fragmentacion interna
- Al ser dinamicos, puede haber fragmentacion externa.
- La utilizacion de tablas, con un valor base y su largo.

Diferencias:
- Particiones Dinámicas: Cada partición aloja un proceso completo.
- Segmentación: Un proceso se divide en múltiples segmentos lógicos (e.g., código, datos, pila), cada uno con su propio valor base y longitud.---

- Segmentación: Utiliza un número de segmento y un desplazamiento para calcular direcciones físicas.
- Particiones Dinámicas: Solo utiliza una dirección base para cada proceso, ajustada dinámicamente.

---
## 11.- Cite similitudes y diferencias entre la técnica de paginación y segmentación.

Similitudes:
- Dividen el proceso en paginas o segmentos.
- Teoricamente no generar fragmentacion interna

Diferencias:
- Segmentacion divide el proceso en partes logicas, mientras que la paginacion no.
- Segmentacion tiene fragmentacion externa 
- Paginacion divide en marcos la memoria, donde se almacenan paginas, mientras que la segmentacion la divide en segmentos.
- Paginacion utiliza una tabla de pagina, y segmentacion una tabla de segmentos.

---
## 12.- Dado un S.O. que administra la memoria por medio de segmentación paginada, y teniéndose disponibles las siguientes tablas:

Tabla de Segmentos
Núm. Seg. | Dir. base
    1     |   500
    2     |   1500
    3     |   5000


Tabla de Paginas
|---------------|-------------|-------------|
| Nro. Segmento | Nro. Pagina | Direc. Base |
|---------------|-------------|-------------|
|               |      1      |     40      |
|      1        |      2      |     80      |
|               |      3      |     60      |
|---------------|-------------|-------------|
|               |      1      |     20      |
|      2        |      2      |     25      |
|               |      3      |     0       |
|---------------|-------------|-------------|
|               |      1      |     120     |
|      3        |      2      |     150     |
|---------------|-------------|-------------|

Indicar las direcciones físicas correspondientes a las siguientes direcciones lógicas (segmento,pagina,desplazamiento):
### i) (2,1,1)
Direccion seg 2 = 1500 
direc Base de seg 2 pag 1 = 20
direccion fisica de seg2 pagina1 = 1520
direccion fisica de 2,1,1 = 1520 + 1 = 1521
### ii) (1,3,15)
seg1 500
seg1 pag3 60 = 560
direccion fisica 560 + 15 = 575

### iii) (3,1,10)
seg3 5000
seg3 pag1 120 = 5120
direccion fisica = 5120 + 10 = 5130
### iv) (2,3,5)
seg2 1500
seg2 pag3 0
direccion fisica 1505

---
## 13.- Memoria Virtual
### a) Describa que beneficios introduce este esquema de administración de la memoria.
- El principal beneficio es el de poder tener mas procesos en memoria principal
- No se carga la totalidad del proceso
- Permite cargar procesos mas grande que la memoria

### b) ¿En que se debe apoyar el SO para su implementación?
Se debe apoyar en un area de intercambio o swap en una memoria secundaria

### c) Al implementar está técnica utilizando paginación por demanda, las tablas de paginas de un proceso deben contar con información adicional además del marco donde se encuentra la página. ¿Cuál es está información? ¿ Porque es necesaria?
Se le agrega el bit de validez, que esto hace referencia a si la pagina esta cargada en memoria principal. Ademas se le agrega un bit de modificado. Esta inforamcion es necesaria para saber si ocurre un fallo de pagina o no y para poder decidir sobre alguna pagina victima, al momento de un page foult.

---
## 14.- Fallos de Página (Page Faults):
### a) ¿Cuándo se producen?
Ocurren cuando se pide una pagina que no esta cargada en memoria principal

### b) ¿Quién es responsable de detectar un fallo de página?
El HW es el responsable 

### c) Describa las acciones que emprende el SO cando se produce un fallo de página.
- El HW detecta la situación y genera un trap al S.O.
- El S.O. Podrá colocar al proceso en estado de “Blocked” (espera) mientras gestiona que la página que se necesite se cargue.
- El S.O. busca un “Frame o Marco Libre” en la memoria y genera una operación de E/S al disco para copiar en dicho Frame la página del proceso que se necesita utilizar.
- El SO puede asignarle la CPU a otro proceso mientras se completa la E/S
- Cuando la operación de E/S finaliza, se notifica al SO
- SO Actualiza la tabla de páginas del proceso
- El proceso que generó el Fallo de Página vuelve a estado de Ready (listo)
- Cuando el proceso se ejecute, se volverá a ejecutar la instrucción que antes generó el fallo de página

---
## 15.- Direcciones:
a) Si se dispone de una espacio de direcciones virtuales de 32 bits, donde cada dirección referencia 1 byte:
### i) ¿Cuál es el tamaño máximo de un proceso (recordar “espacio virtual”)?
2^32 bytes=4,294,967,296 bytes=4 GB

### ii) Si el tamaño de pagina es de 512Kb. ¿Cuál es el número máximo de paginas que puede tener un proceso?
2^32b / 512Kb = 2^32 / 524288 = 8192 
El numero maximo de paginas es la cantidad maxima de paginas que son 8192

### iii) Si el tamaño de pagina es de 512Kb. y se disponen de 256 Mb. de memoria real ¿Cuál es el número de marcos que puede haber?
256Mb / 512Kb = 262144Kb / 512Kb = 512 marcos

### iv) Si se utilizaran 2 Kb. para cada entrada en la tabla de páginas de un proceso: ¿Cuál seria el tamaño máximo de la tabla de páginas de cada proceso?
Cantidad maxima de paginas = 8192
8192 * 2Kb = 16384Kb = 16 Mb

---
## 16.- Como se vio en el ejercicio anterior, la tabla de páginas de un proceso puede alcanzar un tamaño considerablemente grande, que incluso, no podría almacenarse de manera completa en la memoria real. Es por esto que el SO también realiza paginación sobre las tablas de paginas. Existen varios enfoques para administrar las tablas de páginas:
- Tablas de páginas de 1 nivel.
- Tablas de páginas de 2 niveles.
- Tablas de páginas invertidas.

Explique brevemente como trabajan estos enfoques e indique como se realiza la transformación de la dirección virtual en dirección física.

---
## 17.- Suponga que la tabla de páginas para un proceso que se está ejecutando es la que se muestra a continuación:

|--------|-------|-------|-------|-------|
| Página | Bit V | Bit R | Bit M | Marco |
|--------|-------|-------|-------|-------|
|   0    |   1   |   1   |   0   |   4   |
|   1    |   1   |   1   |   1   |   7   |
|   2    |   0   |   0   |   0   |   -   |
|   3    |   1   |   0   |   0   |   2   |
|   4    |   0   |   0   |   0   |   -   |
|   5    |   1   |   0   |   1   |   -   |
|--------|-------|-------|-------|-------|

Asumiendo que:
- El tamaño de la pagina es de 512 bytes
- Cada dirección de memoria referencia 1 byte
- Los marcos se encuentras contiguos y en orden en memoria (0, 1, 2.. ) a partir de la dirección real 0.

*¿Qué dirección física, si existe, correspondería a cada una de las siguientes direcciones virtuales?*
(No gestione ningún fallo de página, si se produce)
### a) 1052
### b) 2221
### c) 5499
### d) 3101

---
## 18.- Tamaño de la Página:
La selección del tamaño de la página influye de manera directa sobre el funcionamiento de la memoria virtual. Compare las siguientes situaciones con respecto al tamaño de página, indicando ventajas y desventajas:
- Un tamaño de página pequeño.
- Un tamaño de página grande.

---
## 19.- Asignación de marcos a un proceso (Conjunto de trabajo o Working Set):
Con la memoria virtual paginada, no se requiere que todas las páginas de un proceso se encuentren en memoria. El SO debe controlar cuantas páginas de un proceso puede tener en la memoria principal. Existen 2 políticas que se pueden utilizar:
- Asignación Fija
- Asignación Dinámica.
### a) Describa como trabajan estas 2 políticas.
### b) Dada la siguiente tabla de procesos y las paginas que ellos ocupan, y teniéndose 40 marcos en la memoria principal, cuantos marcos le corresponderían a cada proceso si se usa la técnica de Asignación Fija:
#### i) Reparto Equitativo
#### ii) Reparto Proporcional

|---------|-------------------------|
| Proceso | Total de Paginas Usadas | 
|---------|-------------------------|
|    1    |          15             |
|    2    |          20             |
|    3    |          20             |
|    4    |          8              |
|---------|-------------------------|

### c) ¿Cual de los 2 repartos usados en b) resulto mas eficiente? ¿Por qué?

---
## 20.- Reemplazo de páginas (selección de una victima):
¿Qué sucede cuando todos los marcos en la memoria principal están usados por las páginas de los procesos y se produce en fallo de página? El SO debe seleccionar una de las páginas que se encuentra en memoria como victima, y ser reemplazada por la nueva página que produjo el fallo.
Considere los siguientes algoritmos de selección de victimas básicos:
- LRU
- FIFO
- OPT (Optimo)
- Segunda Chance

### a) Clasifique estos algoritmos de malo a bueno de acuerdo a la tasa de fallos de página que se obtienen al utilizarlos.

### b) Analice su funcionamiento. ¿Como los implementaría?

### c) Sabemos que la pagina a ser reemplaza puede estar modificada. ¿Qué acciones debe llevar el SO cuando se encuentra ante esta situación?

---
## 21.- Alcance del reemplazo
Al momento de tener que seleccionar una pagina victima, el SO puede optar por 2 políticas a utilizar:
- Reemplazo local
- Reemplazo global
### a) Describa como trabajan estas 2 políticas.
### b) ¿Es posible utilizar la política de “Asignación Fija” de marcos junto con la política de “Reemplazo Global? Justifique.

## 22.- Considere la siguiente secuencia de referencias de páginas:
1, 2, 15, 4, 6, 2, 1, 5, 6, 10, 4, 6, 7, 9, 1, 6, 12, 11, 12, 2, 3, 1, 8, 1, 13, 14, 15, 3, 8
### a) Si se disponen de 5 marcos. ¿Cuántos fallos de página se producirán si se utilizan las siguientes técnicas de selección de victima? (Considere una política de Asignación Dinámica y Reemplazo Global)
#### i) Segunda Chance
#### ii) FIFO
#### iii) LRU
#### iv) OPT

### b) Suponiendo que cada atención de un fallo se pagina requiere de 0,1 seg. Calcular el tiempo consumido por atención a los fallos de páginas para los algoritmos de a).
## 23.- Sean los procesos A, B y C tales que necesitan para su ejecución las siguientes páginas:
- A: 1, 3, 1, 2, 4, 1, 5, 1, 4, 7, 9, 4
- B: 2, 4, 6, 2, 4, 1, 8, 3, 1, 8
- C: 1, 2, 4, 8, 6, 1, 4, 1

Si la secuencia de ejecución es tal que los procesos se ejecutan en la siguiente secuencia:
1. B demanda 2 páginas
2. A demanda 3 páginas
3. C demanda 2 páginas
4. B demanda 3 páginas
5. A demanda 3 páginas
6. C demanda 2 páginas
7. B demanda 2 páginas
8. C demanda 4 páginas
9. A demanda 3 páginas
10. B demanda 3 páginas
11. C termina
12. A demanda 3 páginas
13. B termina
14. A termina

### a) Considerando una política de Asignación Dinámica y Reemplazo Global y disponiéndose de 7 marcos. ¿Cuántos fallos de página se producirán si se utiliza la técnica de selección de victimas:
#### i) LRU
#### ii) Segunda Chance

### b) Considerando una política de Asignación Fija con reparto equitativo y Reemplazo Local y disponiéndose de 9 marcos. ¿Cuántos fallos de página se producirán si se utiliza la técnica de selección de victimas:
### i) LRU
### ii) Segunda Chance

---
## 24.- Sean los procesos A, B y C tales que necesitan para su ejecución las siguientes páginas:
A: 1, 2, 1, 7, 2, 7, 3, 2
B: 1, 2, 5, 2, 1, 4, 5
C: 1, 3, 5, 1, 4, 2, 3
Si la secuencia de ejecución es tal que los procesos se ejecutan en la siguiente manera:
1. C demanda 1 página
2. A demanda 2 páginas
3. C demanda 1 página
4. B demanda 1 página
5. A demanda 1 página
6. C modifica la página 1
7. B demanda 2 páginas
8. A demanda 1 página
9. C demanda 1 página
10. B modifica la página 2
11. A modifica la página 2
12. B demanda 2 páginas
13. A demanda 1 página
14. B demanda 2 páginas
15. C demanda 2 páginas
16. C demanda 1 página
17. A demanda 1 página
18. B termina
19. A demanda 2 páginas
20. C demanda 1 página
21. A termina
22. C termina

Considerando una política de Asignación Dinámica y Reemplazo Global y disponiéndose de 7 marcos, debiéndose guardar 1 marco para la gestión de descarga asincrónica de paginas modificadas ¿Cuántos fallos de página se producirán si se utiliza la técnica de selección de victima:
### a) Segunda Chance
### b) FIFO
### c) LRU

---

## 25.- Hiperpaginación (Trashing)
### a) ¿Qué es?
### b) ¿Cuáles pueden ser los motivos que la causan?
### c) ¿Cómo la detecta el SO?
### d) Una vez que lo detecta, ¿qué acciones puede tomar el SO para eliminar este problema?

---
## 26.- Considere un sistema cuya memoria principal se administra mediante la técnica de paginación por demanda que utiliza un dispositivo de paginación, algoritmo de reemplazo global LRU y una política de asignación que reparte marcos equitativamente entre los procesos. El nivel de multiprogramación es actualmente, de 4.

Ante las siguientes mediciones:
a) Uso de CPU del 13%, uso del dispositivo de paginación del 97%.
b) Uso de CPU del 87%, uso del dispositivo de paginación del 3%.
c) Uso de CPU del 13%, uso del dispositivo de paginación del 3%.
Analizar:
### ¿Qué sucede en cada caso?
### ¿Puede incrementarse el nivel de multiprogramación para aumentar el uso de la CPU?
### ¿La paginación está siendo útil para mejorar el rendimiento del sistema?

---
## 27.- Considere un sistema cuya memoria principal se administra mediante la técnica de paginación por demanda. Considere las siguientes medidas de utilización:
- Utilización del procesador: 20%
- Utilización del dispositivo de paginación: 97,7%
- Utilización de otros dispositivos de E/S: 5%

Cuales de las siguientes acciones pueden mejorar la utilización del procesador:
### a) Instalar un procesador mas rápido
### b) Instalar un dispositivo de paginación mayor
### c) Incrementar el grado de multiprogramación
### d) Instalar mas memoria principal
### e) Decrementar el quantum para cada proceso

---
## 28.- La siguiente formula describe el tiempo de acceso efectivo a la memoria al utilizar paginación para la implementación de la memoria virtual:
TAE = At + (1 − p ) * Am + p * (Tf + Am )

Donde:
- TAE = tiempo de acceso efectivo
- p = taza de fallo de pagina (0 <= p <=1)
- Am = tiempo de acceso a la memoria real
- Tf = tiempo se atención de una fallo de pagina
- At = tiempo de acceso a la tabla de paginas. Es igual al tiempo de acceso a la memoria (Am) si la entrada de la tabla de páginas no se encuentra en la TLB.

Suponga que tenemos una memoria virtual paginada, con tabla de paginas de 1 nivel, y donde la tabla de páginas se encuentra completamente en la memoria. Servir una falla de página tarda 300 nanosegundos si hay disponible un marco vacío o si la página reemplazada no se ha modificado, y 500 nanosegundos si se ha modificado. El tiempo de acceso a memoria es de 20 nanosegundos y el de acceso a la TLB es de 1 nanosegundo

### a) Si suponemos una taza de fallos de página de 0,3 y que siempre contamos con un marco libre para atender el fallo ¿Cual será el TAE si el 50% de las veces la entrada de la tabla de páginas se encuentra en la TLB (hit)?
### b) Si suponemos una taza de fallos de página de 0,3; que el 70% de las ocasiones la pagina a reemplazar se encuentra modificada. ¿Cual será el TAE si el 60% de las veces la entrada de la tabla de páginas se encuentra en la TLB (hit)?
### c) Si suponemos que el 60% de las veces la pagina a reemplazar esta modificada, el 100% de las veces la entrada de la tabla de páginas requerida se encuentra en la TLB (hit) y se espera un TAE menor a 200 nanosegundos. ¿Cuál es la máxima tasa aceptable de fallas de página?

---
## 29.- Anomalía de Belady
### a) ¿Qué es?
### b) Dada la siguiente secuencia de referencias a paginas:
3, 2, 1, 0, 3, 2, 4, 3, 2, 1, 0, 4
- I.Calcule la cantidad de fallos de páginas si se cuentan con 3 marcos y se utiliza el algoritmo de reemplazo FIFO
- II. Calcule la cantidad de fallos de páginas si se cuentan con 4 marcos y se utiliza el algoritmo de reemplazo FIFO
Analice la situación

---
## 30.- Considere el siguiente programa:
`C
      #define Size 64
      int A[Size; Size], B[Size; Size], C[Size; Size];
      int register i, j;
      for (j = 0; j < Size; j ++)
      for (i = 0; i < Size; i++)
      C[i; j] = A[i; j] + B[i; j];
`

Si asumimos que el programa se ejecuta en un sistema que utiliza paginación por demanda para administrar la memoria, donde cada pagina es de 1Kb. Cada número entero (int) ocupa 4 bytes. Es claro que cada matriz requiere de 16 páginas para almacenarse. Por ejemplo: A[0,0]..A[0,63], A[1,0]..A[1,63], A[2,0]..A[2,63] y A[3,0]..A[3,63] se almacenara en la primer pagina. Asumamos que el sistema utiliza un working set de 4 marcos para este proceso. Uno de los 4 marcos es utilizado por el programa y los otros 3 se utilizan para datos (las matrices). También asumamos que para los índices “i” y “j” se utilizan 2 registros, por lo que no es necesario el acceso a la memoria para estas 2 variables.

### a) Analizar cuantos fallos de paginas ocurren al ejecutar el programa (considere las veces que se ejecuta C[i,j] = A[i,j] + B[i,j])


### b) Puede ser modificado el programa para minimizar el número de fallos de páginas. En caso de ser posible indicar la cantidad de fallos de fallos de páginas que ocurren.

---
## 31.- Considere las siguientes secuencias de referencias a páginas de los procesos A y B, donde se muestra en instante de tiempo en el que ocurrió cada una (1 a 78):

*Cuadro en PDF*

### a) Considerando una ventana ∆=5, indique cual seria el conjunto de trabajo de los procesos A y B en el instante 24 (WSA(24) y WSB(24))
### b) Considerando una ventana ∆=5, indique cual seria el conjunto de trabajo de los procesos A y B en el instante 60 (WSA(60) y WSB(60))
### c) Para el los WS obtenidos en el inciso a), si contamos con 8 frames en el sistema ¿Se puede indicar que estamos ante una situación de trashing? ¿Y si contáramos con 6 frames?
### d) Considerando únicamente el proceso A, y suponiendo que al mismo se le asignaron inicialmente 4 marcos, donde el de reemplazo de paginas es realizado considerando el algoritmo FIFO. ¿Cuál será la taza de fallos en el instante 38 de páginas suponiendo que la misma se calcula contando los fallos de páginas que ocurrieron en las últimas 10 unidades de tiempo?
### e) Para el valor obtenido en el inciso d), si suponemos que el S.O. utiliza como limites superior e inferior de taza de fallos de paginas los valores 2 y 5 respectivamente ¿Qué acción podría tomar el S.O. respecto a la cantidad de marcos asignados al proceso?

