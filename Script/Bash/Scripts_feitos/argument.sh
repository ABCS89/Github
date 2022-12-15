#!/bin/bash


for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done



# verificação caso não deseja que rode o bootstrap-playbook.yml
playbook_name=""
if [ ${run_bootstrap^^} == "false" ]; 
#    [ ${run_bootstrap,,} == "false" ]; LOWERCAISE COM ,,
#if [ ${run_bootstrap^^} == "false" ]; UPERCASE COM ^^
then
    #playbook_name="main.yml" 
    echo "1 "
else
    #playbook_name="bootstrap-playbook.yml"
     echo "2 "  
fi



