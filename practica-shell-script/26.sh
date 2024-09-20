#!/bin/bash

if [ $# -eq 0 ]; then
  exit 1
fi

params=($@)
no_exist=0
for ((i = 0; i < $#; i++)); do
  actual=${params[$i]}
  if [ $(($i % 2)) -eq 0 ]; then
    if [ -e $actual ]; then
      if [ -f $actual ]; then
        echo Es un archivo
      else
        echo Es un directorio
      fi
    else
      no_exist=$(($no_exist + 1))
    fi
  fi
done

echo Inexistentes: $no_exist
