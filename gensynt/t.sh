old_IFS=$IFS      # save the field separator           
IFS=$'\n'     # new field separator, the end of line           
for line in $(cat a.txt)          
do          
   echo $line          
done          
IFS=$old_IFS     # restore default field separator 
rm a.txt

