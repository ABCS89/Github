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
if [ ${run_bootstrap^^} == "FALSE" ];
then
    playbook_name="main.yml" 
else
    playbook_name="bootstrap-playbook.yml"  
fi



