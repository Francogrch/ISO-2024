#!/bin/bash

array=(1 2 3 4 5 6 7 8)
impares=0

for num in ${array[@]}; do
  if [ $((num % 2)) -ne 0 ]; then
    impares=$(($impares + 1))
  else
    echo $num
  fi
done
echo impares: $impares
