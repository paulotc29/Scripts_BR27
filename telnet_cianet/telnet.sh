#!/usr/bin/expect -f

set host [lindex IP]
set user [lindex XX]
set pass [lindex XX]

set timeout 2

exp_internal 0

spawn telnet $host
expect "Username:"
send "$user\r"
expect "Password:"
send "$pass\r"
expect "%"
#send "show mac-address-table mac 74-DA-88-94-83-7C\r"
send "show olt 5 mac-address-table\r"
#send "show olt 5 onu 28 ctc optical\r"
send "linha\n"
expect "%"

send "logout\r"







#identificacao #> mac_identification.txt

#PON=`cat mac_identification.txt | grep "ge-" | awk '{print$5}' | cut -d "-" -f2`

#tabela "$PON" > tabela.txt

#ONU=`cat table.txt | grep --text 74:DA:88:94:83:7C | awk '{print$3}'`

#sinal "$PON" "$ONU" > sinal.txt 

