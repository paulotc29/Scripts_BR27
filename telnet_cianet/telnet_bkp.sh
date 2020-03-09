#!/usr/bin/expect -f

# ACESSO REMOTO VIA TELNET - EM TEST

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
send "show mac-address-table mac 74-DA-88-94-83-7C\r"
#send "show olt 5 mac-address-table\r"
#send "show olt 5 onu 28 ctc optical\r"
#send "linha\n"
expect "%"

send "logout\r"


