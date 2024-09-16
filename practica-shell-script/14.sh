#!/bin/bash
if [ $# != 3 ]; then
  exit 0
fi

if [ $2 == "-a" ]; then
  for archivo in "$1"/*; do
    mv $archivo "$archivo$3"
  done
fi
if [ $2 == "-b" ]; then
  for archivo in "$1"/*; do
    mv $archivo "$1/$3$(basename "$archivo")"
  done
fi
