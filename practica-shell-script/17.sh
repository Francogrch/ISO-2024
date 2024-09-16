#!/bin/bash

for archivo in $(ls); do
  mv $archivo $(echo "$archivo" | tr "a-zA-Z" "A-Za-z" | tr -d 'aA')
done
