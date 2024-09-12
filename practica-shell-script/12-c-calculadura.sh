#!/bin/bash

function suma {
  echo "$1 + $2 = $(expr $1 + $2)"
}
function resta {
  echo "$1 - $2 = $(expr $1 - $2)"
}
function multi {
  echo "$1 * $2 =  $(expr $1 \* $2)"
}
function div {
  echo "$1 % $2 = $(expr $1 % $2)"
}

if [ $# -gt 2 ]; then
  case $1 in
  "multiplicacion")
    multi $2 $3
    ;;
  "suma")
    suma $2 $3
    ;;
  "resta")
    resta $2 $3
    ;;
  "division")
    div $2 $3
    ;;
  esac
else
  echo "Recuerda que los parametros tienen este formato -> OPCION num1 num2 "
  echo "Opciones: suma resta multiplicacion division "
fi
