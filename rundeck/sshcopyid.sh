#!/usr/bin/expect -f

if { $argc != 3 } {
  puts stderr "usage: ./sshcopyid.sh host user passwd"
  exit 2
}

set host [lindex $argv 0]
set user [lindex $argv 1]
set passwd [lindex $argv 2]

spawn ssh-copy-id $user@$host
expect {
    "Are you sure you want to continue connecting" {
        send "yes\n" 
        exp_continue   
    }
    "All keys were skipped because they already exist on the remote system" {
    }
    "assword:" {
        send "$passwd\n"
    }
}

expect eof
