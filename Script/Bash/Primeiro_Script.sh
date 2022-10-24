#!/bin/bash



VerificacaoAnsible()
{       #! inserir  para que siga a logica do randins 
    if  sudo test -f /etc/korp/ansible/inventory.yml 
    then
        echo "AQUIII"
        echo "AQUIII2"
        true
        

    else   
        function parse_yaml {
        local prefix=$2
        local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
        sed -ne "s|^\($s\):|\1|" \
                -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
                -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
        awk -F$fs '{
            indent = length($1)/2;
            vname[indent] = $2;
            for (i in vname) {if (i > indent) {delete vname[i]}}
            if (length($3) > 0) {
                vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
                printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
            }#fim if
        }'#fim Awk
        #fim Funcao parse_yaml
        }


        eval $(parse_yaml inventory.yml)
      
  fi
}


#hello=$(VerificacaoAnsible)

#true $is_first_install = True , else $is_first_install = False 
if VerificacaoAnsible true; then echo "true" ; else echo "false"; fi

#echo $(VerificacaoAnsible)