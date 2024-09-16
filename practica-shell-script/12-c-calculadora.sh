#!/bin/bash

if [ $# != 3 ]; then
  exit 0
fi

function suma {
  echo "$(expr $1 + $2)"
}
function resta {
  echo "$(expr $1 - $2)"
}
function multi {
  echo "$(expr $1 \* $2)"
}
function div {
  echo "$(expr $1 % $2)"
}

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
