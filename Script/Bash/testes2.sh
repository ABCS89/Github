#!/bin/bash



 #read -e -p "IP de acesso: " varA;varB=$varA

 #echo $varA, $varB


 read -e -p "Possui 2 banco de dados  SQL? Exemplo:homologacao e producao? 1-sim 2 -nao " Chk_sql

echo $Chk_sql

if [ $Chk_sql == "1" ];then  echo  "deu certo ";else echo "xurumela" ; fi
