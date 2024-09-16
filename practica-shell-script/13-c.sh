#!/bin/bash
if [ $# != 1 ]; then
  exit 0
fi

if [ -f $1 ]; then
  if [ -d $1 ]; then
    echo "Directorio"
  else
    echo "Archivo"
  fi
else
  touch $1
fi
