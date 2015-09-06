#!/bin/bash
saveIFS=$IFS
IFS='|'
pattern="^(${pattern[*]})$"  # ^(red|green|blue)$  (perhaps hackish)
IFS=$saveIFS

# simple regex match if statement (not hackish)
if [[ $var =~ $pattern ]]
then
    do_something
fi

# or a backwards case statement (very hackish)
case 1 in    # this could be a variable or a command substitution
    $([[ $var =~ $pattern]] && echo 1) )  # the echo 1 could be another command or the 1 could be yet another variable
        do_something;;
    * )
        do_default;;
esac
