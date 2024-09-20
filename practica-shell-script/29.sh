#!/bin/bash

# touch /home/ex1.doc /home/ex3.doc /home/ex2.doc

directorio="/home/"
array=($(ls $directorio | grep ".doc"))

cantidadArchivos() {
  echo ${#array[@]}
}

verArchivo() {
  if [ $# -ne 1 ]; then
    exit 1
  fi
  for archivo in ${array[@]}; do
    if [ $archivo = $1 ]; then
      echo $(cat $directorio$1)
      exit 1
    fi
  done
  echo "Archivo no encontrado"
  exit 5
}

borrarArchivo() {
  if [ $# -ne 1 ]; then
    exit 1
  fi
  pos=-1
  for ((i = 0; i < ${#array[@]}; i++)); do
    if [ ${array[$i]} = $1 ]; then
      pos=$i
      break
    fi
  done
  if [ $pos = -1 ]; then
    echo "Archivo no encontrado"
    exit 10
  fi

  echo "Desea eliminar el archivo logicamente? (Si / No)"
  read respuesta
  if [ $respuesta = "Si" ]; then
    unset array[$i]
  elif [ $respuesta = "No" ]; then
    unset array[$i]
    $(sudo rm -rf $directorio$1)
  else
    echo Respuesta incorrecta
  fi
}

cantidadArchivos
borrarArchivo "ex3.doc"
cantidadArchivos
verArchivo "ex1.doc"
