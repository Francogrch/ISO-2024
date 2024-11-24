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

sectores = [140,147,175,15,149,186,201,202,212,257,270,288,299,133,130,110,99,94,85,84,81,75,59,50,42,25]
print(suma_diferencias(sectores))
