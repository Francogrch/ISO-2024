#!/bin/bash

# usuarios=$(grep "^users:" /etc/group | cut -d: -f4)
users=$(grep "wheel:" /etc/group | cut -d: -f4)

users="user1,user2,user3"

IFS=","
read -r -a usuarios <<<"$users"

while getopts "b:il" opt; do
  case $opt in
  b)
    if [ "$OPTARG" -lt "${#usuarios[@]}" ]; then
      echo ${usuarios[$OPTARG]}
    else
      echo "Fuera de rango"
    fi
    ;;
  l)
    echo ${#usuarios[@]}
    ;;
  i)
    echo ${usuarios[@]}
    ;;
  *)
    echo Comando invalido
    ;;
  esac
done
