#!/bin/bash

select opcion in "Listar" "DondeEstoy" "QuienEsta" "Salir"; do
  case $opcion in
  "Listar")
    ls -la
    ;;
  "DondeEstoy")
    pwd
    ;;
  "QuienEsta")
    users
    ;;
  "Salir")
    exit 0
    ;;
  esac
done
