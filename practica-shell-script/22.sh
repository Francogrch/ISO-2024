#!/bin/bash

num=(10 3 5 7 9 3 5 4)

function productorio {
  sum=1
  for num in $@; do
    sum=$(($sum * $num))
  done
  echo $sum
}

productorio ${num[@]}
