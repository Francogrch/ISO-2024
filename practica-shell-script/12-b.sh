#!/bin/bash
num1=$1
num2=$2

if [ $# -gt 1 ]; then
  if [ $num1 -gt $num2 ]; then
    mayor=$num1
  else
    mayor=$num2
  fi

  echo "Multiplicacion: $num1 * $num2 = $(expr $num1 \* $num2)"
  echo "Suma: $num1 + $num2 = $(expr $num1 + $num2)"
  echo "Resta: $num1 - $num2 = $(expr $num1 - $num2)"
  echo "Mayor entre $num1 y $num2 = $mayor "
else
  echo "No hay mas de un parametro."
fi
