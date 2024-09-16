#!/bin/bash
list=()
select option in "push" "lenght" "pop" "print" "salir"; do
  case $option in
  "push")
    read n1
    list+=("$n1")
    ;;
  "lenght")
    echo ${#list[@]}
    ;;
  "pop")
    valor=$(expr ${#list[@]} - 1)
    if [ $valor -gt -1 ]; then
      echo "${list[$valor]}"
      unset 'list[$valor]'
    fi
    ;;
  "print")
    echo ${list[@]}
    ;;
  "salir")
    exit 0
    ;;
  esac
done
