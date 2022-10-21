#!/bin/bash



VerificacaoAnsible()
{
    if  sudo test -f /etc/korp/ansible/inventory.yml 
    then
        echo "AQUIII"
        echo "AQUIII2"
        true
        

    else
      Inv_yml.yml= source ${/root/repositorios/Github/Script/Bash/inventory.yml} 
       # PATH='sudo ansible-vault edit inventory.yml --vault-id .vault_key'
       echo $Inv_yml
      #  if
      #  then 
       # else 
       # fi
        
    fi 
}


#hello=$(VerificacaoAnsible)

#true $is_first_install = True , else $is_first_install = False 
if VerificacaoAnsible true; then echo "true" ; else echo "false"; fi

#echo $(VerificacaoAnsible)