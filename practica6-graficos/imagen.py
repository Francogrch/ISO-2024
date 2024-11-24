import matplotlib.pyplot as plt

def suma_diferencias(lista):
    """
    Calcula la suma de las diferencias absolutas entre los elementos consecutivos de una lista.

    :param lista: Lista de números
    :return: Suma de las diferencias absolutas
    """
    if len(lista) < 2:
        return 0  # Si la lista tiene menos de 2 elementos, no hay diferencias que calcular
    
    suma = 0
    for i in range(len(lista) - 1):
        suma += abs(lista[i] - lista[i + 1])
    
    return suma

# Datos de sectores y tiempos
punto = 16 
algoritmo = "SCAN"
sectores = [140,147,175,15,149,186,201,202,212,257,270,288,299,133,130,110,99,94,85,84,81,75,59,50,42,25]
tiempos = list(range(1, len(sectores) + 1))  # Tiempo secuencial desde 1 hasta el número de sectores

# Crear la gráfica con el eje del sector arriba
plt.figure(figsize=(10, 6))
plt.scatter(sectores, tiempos, color='blue', label='Sectores')

# Añadir detalles a la gráfica
plt.title(f"Punto {punto} - Algoritmo: {algoritmo}")
plt.xlabel("Número de Sector")
plt.ylabel("Tiempo")
plt.grid(True, linestyle='--', alpha=0.7)
plt.yticks(tiempos)
plt.xticks(sectores, rotation=45, ha='right', fontsize=10)
plt.gca().invert_yaxis()
plt.legend()

# Mover el eje de los sectores hacia arriba
plt.gca().xaxis.set_label_position('top')
plt.gca().xaxis.tick_top()

plt.tight_layout()
nombre= f"./Punto{punto}-{algoritmo}.png"
plt.savefig(nombre)
print(nombre)
print(suma_diferencias(sectores))
# Mostrar la imagen
#plt.show()

