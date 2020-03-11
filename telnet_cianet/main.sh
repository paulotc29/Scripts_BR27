#!/bin/bash

## remoção dos arquivos

rm ciante.sh table.txt pon.txt sinal.txt

## CRIAÇÃO DE SCRIPTS

#echo "Informe o mac:"
#read mac

mac=$1 ## RECEBENDO MAC VIA PARÂMETRO
MAC=${mac^^} ## CONVERSÃO PARA MAIÚSCULO
mac2=$mac
mac2=${mac2//:/-}


#echo "Informe o ip da OLT:"
#read ip_olt

ip_olt=$2 ## RECEBENDO IP VIA PARÂMETRO

scrip(){

echo $1 >> ciante.sh

}


gera_scrip_passo_01(){

scrip '#!/usr/bin/expect -f'  
scrip " " 
scrip 'set host [lindex '$ip_olt']'
scrip 'set user [lindex XX]'
scrip 'set pass [lindex XX]'
scrip " " 
scrip 'set timeout 2'
scrip " " 
scrip 'exp_internal 0'
scrip " " 
scrip 'spawn telnet $host'
scrip 'expect "Username:"'
scrip 'send "$user\r"'
scrip 'expect "Password:"'
scrip 'send "$pass\r"'
scrip 'expect "%"'
scrip 'send "show mac-address-table mac '$mac2'\r"'
scrip 'expect "%"'
scrip " " 
scrip 'send "logout\r"'
scrip " " 
}

gera_scrip_passo_02(){

scrip '#!/usr/bin/expect -f'  
scrip " " 
scrip 'set host [lindex '$ip_olt']'
scrip 'set user [lindex XX]'
scrip 'set pass [lindex XX]'
scrip " " 
scrip 'set timeout 10'
scrip " " 
scrip 'exp_internal 0'
scrip " " 
scrip 'spawn telnet $host'
scrip 'expect "Username:"'
scrip 'send "$user\r"'
scrip 'expect "Password:"'
scrip 'send "$pass\r"'
scrip 'expect "%"'
scrip 'send "show olt '$1' mac-address-table\r"'
scrip 'expect "%"'
scrip 'send "linha\r"'
scrip 'expect "%"'
scrip " " 
scrip 'send "logout\r"'
scrip " " 
}

gera_scrip_passo_03(){

scrip '#!/usr/bin/expect -f'  
scrip " " 
scrip 'set host [lindex '$ip_olt']'
scrip 'set user [lindex XX]'
scrip 'set pass [lindex XX]'
scrip " " 
scrip 'set timeout 2'
scrip " " 
scrip 'exp_internal 0'
scrip " " 
scrip 'spawn telnet $host'
scrip 'expect "Username:"'
scrip 'send "$user\r"'
scrip 'expect "Password:"'
scrip 'send "$pass\r"'
scrip 'expect "%"'
scrip 'send "show olt '$1' onu '$2' ctc optical\r"'
scrip 'expect "%"'
scrip " " 
scrip 'send "logout\r"'
scrip " " 
}

echo
echo
echo -e " \033[5;31m AGUARDE... \033[0m" 
echo


gera_scrip_passo_01 $mac 

chmod +x ciante.sh

./ciante.sh > mac_identification.txt

PON=`cat mac_identification.txt | grep "ge-" | awk '{print$5}' | cut -d "-" -f2`
#echo $PON

if [[ $PON == "ge-1" ]]; then
echo "MAC não identificado..."
exit
fi

echo " " > pon.txt
echo "9 1" >> pon.txt
echo "10 2" >> pon.txt
echo "11 3" >> pon.txt
echo "12 4" >> pon.txt
echo "13 5" >> pon.txt
echo "14 6" >> pon.txt
echo "15 7" >> pon.txt
echo "16 8" >> pon.txt

id_pon=`cat pon.txt | grep $PON | awk '{print $2}'`

#echo $id_pon

gera_scrip_passo_02 $id_pon 

chmod +x ciante.sh

./ciante.sh > table.txt

#echo $mac2
ONU=`cat table.txt | grep --text $MAC | awk '{print$3}'`

#echo $ONU
gera_scrip_passo_03 $id_pon $ONU 

chmod +x ciante.sh

./ciante.sh > sinal.txt

tail -14 sinal.txt

sinal=`cat sinal.txt | grep --text rx | awk '{print $4}'`


echo
echo 
echo "Foi realizado acesso à gerência da OLT Cianet (IP: "$ip_olt") e identificada, através do MAC do roteador, a ONU que atende o cliente. PON "$PON ", ONU "$ONU"."
echo "Foi verificado que o nível de sinal da fibra estava em "$sinal" dBm." 
echo
