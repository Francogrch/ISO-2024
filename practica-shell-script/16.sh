#!/bin/bash

if [ $# != 1 ]; then
  exit 0
fi

cant=$(ls | grep "$1" | wc -l)
echo "$(whoami):$cant" >>reporte.txt
