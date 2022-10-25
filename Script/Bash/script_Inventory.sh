#!/bin/bash



VerificacaoAnsible()
{       # inserir  para que siga a logica do randins 
    if  ! sudo test -f /etc/korp/ansible/inventory.yml 
    then
        echo "AQUIII"# !!! remover 
        echo "AQUIII2"# !!! remover 
        true
        

    else   
        InvDescriptado(){
        cd /etc/korp/ansible/
        sudo ansible-vault view inventory.yml --vault-id .vault_key 
        cd
        }
        #pegar variavel chave  no caso vai ser  testing_mssql
        Check=$(InvDescriptado| grep localhost | cut -d ':' -f 1 )
        echo $Check  # !!! remover 
        aut="string"
        if [ $Check == "localhost" ]
        then
            echo "entrou "# !!! remover 
            true      
        else 
            false            
        fi   
        
    fi

}


hello=$(VerificacaoAnsible)

#true is_first_install = True , else is_first_install = False # !!! remover 
if $VerificacaoAnsible true; then echo "true" ; else echo "false"; fi

#echo $(VerificacaoAnsible)
echo $hello

