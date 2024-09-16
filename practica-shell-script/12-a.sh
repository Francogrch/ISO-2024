#!/bin/bash
echo "Ingrese el primer numero:"
read num1
echo "Ingrese el segundo numero:"
read num2
if [ $num1 -gt $num2 ]; then
  mayor=$num1
else
  mayor=$num2
fi

echo "Multiplicacion: $num1 * $num2 = $(expr $num1 \* $num2)"
echo "Suma: $num1 + $num2 = $(expr $num1 \+ $num2)"
echo "Resta: $num1 - $num2 = $(expr $num1 \- $num2)"
echo "Mayor entre $num1 y $num2 = $mayor "
