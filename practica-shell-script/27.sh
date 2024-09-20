#!/bin/bash

verificar_param() {
  if [ $1 -ne $2 ]; then
    exit 1
  fi
}

function inicializar {
  array=()
}

agregar_elem() {
  verificar_param $# 1
  array+=($1)
}
function eliminar_elem {
  verificar_param $# 1
  long=${#array[@]}
  if [ $long -ge $1 ]; then
    unset array[$1-1]
  fi
}

function longitud {
  echo ${#array[@]}
}

imprimir() {
  echo ${array[@]}
}

inicializar_con_valores() {
  verificar_param $# 2
  array=()
  for ((i = 0; i < $1; i++)); do
    array+=($2)
  done
}

inicializar
agregar_elem 1
agregar_elem 22
agregar_elem 23
agregar_elem 42
imprimir
eliminar_elem 2
imprimir
longitud
inicializar_con_valores 1 3
imprimir
