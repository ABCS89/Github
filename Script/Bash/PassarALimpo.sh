#!/bin/bash

VerificacaoAnsible()
{   #return 0 to true.
    if  ! sudo test -f /etc/korp/ansible/inventory.yml 
    then return 0; else   
        echo "AQUIII"
        InvDescriptado()
        {
        cd /etc/korp/ansible/
        sudo ansible-vault view inventory.yml --vault-id .vault_key 
        cd
        }        
        #Function check the new update of Inventory with the last var input:testing_mssql
        Check=$(InvDescriptado| grep testing_mssql | cut -d ':' -f 1 ) 
        if [ "$Check" != "testing_mssql" ]
        then return 1; else return 0; fi           
    fi
}
#true is_first_install = True , else is_first_install = False 
if $VerificacaoAnsible $0; then e is_first_install = True ; else is_first_install = False; fi