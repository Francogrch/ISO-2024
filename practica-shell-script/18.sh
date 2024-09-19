#!/bin/bash
#
# if [ $# -ne 1 ]; then
#   exit 1
# fi
#
# function isOn() {
#   for user in $(who | awk '{print $1}' | uniq); do
#     if [ $1 = $user ]; then
#       return 0
#     fi
#   done
#   return 1
# }
#
# log=0
# while [ $log -eq 0 ]; do
#   if isOn $1; then
#     log=1
#   else
#     sleep 10
#   fi
# done
#
if [ $# -ne 1 ]; then
  exit 1
fi
isOn=$(who | tr -s " " | cut -f 1 -d " " | grep $1)
while [ ${#isOn[@]} -eq 0 ]; do
  sleep 10
  isOn=$(who | tr -s " " | cut -f 1 -d " " | grep $1)
done
