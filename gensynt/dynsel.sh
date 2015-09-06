#!/bin/bash

oldIFS=$IFS
IFS=$'\n'
choices=( `cat -n options.txt `)
IFS=$oldIFS
PS3="Please enter your choice: "
select answer in "${choices[@]}"; do
  for item in "${choices[@]}"; do
    if [[ $item == $answer ]]; then
      break 2
    fi
  done
done
echo "$answer"
