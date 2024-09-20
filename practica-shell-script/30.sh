#!/bin/bash
home="~/"

if [ ! -e "$home/bin" ]; then
  $(mkdir "$home/bin")
fi
contador=0
exes=($(ls -l | grep "^-" | awk '{print $9}'))
for exe in ${exes[@]}; do
  salida=$(mv "./$exe" "$home/bin")
  if [salida]; then
    echo "Se movio $exe con exito"
    contador=$((contador + 1))
  fi
done
echo "Se han movido $contador archivos"
