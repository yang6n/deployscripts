#!/usr/bin/expect -f

if { $argv != 3 } {
  puts stderr "usage: ./sshcopyid.sh host pass user"
  exit 2
}

set host [lindex $argv 0]
set user [lindex $argv 1]
set passwd [lindex $argv 2]

spawn ssh-copy-id $user@$host
expect "assword:"
send "$passwd\n"

expect eof
