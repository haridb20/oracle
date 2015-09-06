#!/bin/bash -x
data=($(
while read line
do
  echo -n "${line} "
done < options.txt
))
while true; do
cat options.txt
     read -p 'Quick, do something! ' c
     case $c in
       q) exit 0;;
       *) cat ${data[$c]}.txt;;
    esac
done
