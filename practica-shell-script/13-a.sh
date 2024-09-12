#!/bin/bash
for ((i = 1; i <= 100; i++)); do
  echo $i
done

for ((i = 0; i <= 100; i++)); do
  echo "$i^2 = $(expr $i \* $i) "
done
