#!/bin/bash
clear
declare -a keys
keys=('key1' 'key2' 'key3')
declare -i i
echo "0) Main Menu"
for (( k=0;k<${#keys[*]};k++)) do
  i=$(( $k + 1 ))
  key=${keys[$k]}
  echo "$i) Add key \`$key'"
done
let i+=1
echo "$i) Unload all keys"


until [ -n "$category" ]; do
  echo -en "\nEnter a selection: "
  read category
  case $category in
    *) 
      if [ -z "$category" ]; then
        unset category
      else
        echo $category|grep -q ^[0-9]*$
        if [ $? -ne 0 ]; then
          echo "Selection \`$category' is invalid"
          unset category
        else
          if [ $category -eq $(( ${#keys[*]} + 1 )) ]; then
            cmd='ssh-add -D'
          elif [ $category -eq 0 ]; then
            cmd='gotomainmenu'
          else
            key=${keys[$(($category-1))]}
            if [ -z "$key" ]; then
              echo "Selection \`$category' is invalid"
              unset category
            else
              cmd="ssh-add ~/.ssh/$key"
            fi
          fi
        fi
      fi
  esac
done

[ -z "$cmd" ] && echo "This cannot be!  cmd should have been defined" && exit 1

echo -e "\nRunning command: \`$cmd'"
eval $cmd
exit $?
