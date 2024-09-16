#!/bin/bash

select option in "12a" "12b" "12c" "13a" "Salir"; do
  case $option in
  "12a")
    source ./12-a.sh
    ;;
  "12b")
    echo "Primer numero: "
    read p1
    echo "Segundo numero: "
    read p2
    source ./12-b.sh $p1 $p2
    ;;
  "12c")
    echo "Operacion: "
    read p1
    echo "Primer numero: "
    read p2
    echo "Segundo numero: "
    read p3
    source ./12-c-calculadora.sh $p1 $p2 $p3
    ;;
  "13a")
    source ./13-a.sh
    ;;
  "Salir")
    exit 0
    ;;
  esac
done
