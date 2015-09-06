#/bin/bash
old_IFS=$IFS      # save the field separator
IFS=':'     # new field separator, the end of line
for line in $(cat /etc/passwd)
do
   echo $line
done
IFS=$old_IFS     # restore default field separator

