```bash
exec
uniq
awk
find
wc
tr
who
sleep
ls
expr # es lo mismo que $(())
source
cut
read
# Arreglos
list=() # Creo lista vacia
${#list[@]} # Cantidad de elementos del array
${list[@]} # Todos los elementos del array
${list[2]} # Elemento en pos 2
list+="valor" # Agregar Elemento al final del array
unset list[2] # Eliminar elemento
unset list[-1] # Eliminar ultimo elemento



IFS="," read -r -a usuarios <<<"$users"
getopts
```
