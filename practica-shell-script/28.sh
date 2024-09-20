#!/bin/bash

if [ $# -ne 1 ]; then
  exit 1
fi
if [ ! -e $1 ]; then
  exit 4
else
  echo $(ls -l $1 | grep '^-[rw]' | wc -l)
fi
