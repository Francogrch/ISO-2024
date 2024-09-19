#!/bin/bash

if [ $# != 1 ]; then
  exit 1
fi

names=$(cut -f 1 -d: /etc/passwd)

for name in $names; do
  echo "$name:$(find / -name "*.$1" -user $name | wc -l)" >>reporte.txt
done
