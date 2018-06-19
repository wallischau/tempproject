#!/usr/bin/bash

# cisco_telnet_ap.sh
# Author: Mikayla Cohen
#
# Description: Sends commands to WiFi access points through a Cisco communication router.
#
# Usage: cisco_telnet_ap.sh -b chamber_letter -c <command> -c <command> ...

CISCO_IP="10.3.65.11"
SSH_USER="admin"
SSH_PW="Charter12!"
ENABLE_PW="Charter12!"
AP_PW="R3MOT3ACC3$$"

AP_CHAMBER=""

for arg in $@
do
    case $1 in
        -h )
            ;&
        -help )
            echo "Usage: cisco_telnet_ap.sh -b chamber_letter -c <command> -c <command> ..."
            exit 0
            ;;
        -b )
            shift
            AP_CHAMBER="$1"
            AP_LOG="/tmp/cisco_telnet_dut_$AP_CHAMBER.log"
            ;;
        -c )
            shift
            AP_COMMAND="$AP_COMMAND echo ==D=E=L=I=M=I=T=E=R== >> $AP_LOG; $1 >> $AP_LOG;"
            ;;
    esac
    shift
done

# Read config file.

AP_COMMAND="rm $AP_LOG; $AP_COMMAND EOFSTR='E=N=D'; echo ==\\\$EOFSTR== >> $AP_LOG; tail -f -n +0b $AP_LOG;"
echo "Executing command $AP_COMMAND on AP residing in Chamber $CHAMBER"
expect <<- DONE
    set timeout -1

    spawn ssh $SSH_USER@$CISCO_IP -o KexAlgorithms=diffie-hellman-group14-sha1

    expect "Password: "

    send "$SSH_PW\r"

    expect "W"

    send "enable\r"

    expect "Password: "

    send "$ENABLE_PW\r"

    send "telnet Chamber$AP_CHAMBER\r"

    expect {
        "Open" {
            send "\r"
        }
    }

    expect {
        "login:" {
            send "technician\r"
            expect "Password:"
            send "$AP_PW\r"

            expect "#"
            send "$AP_COMMAND\r"
        }

        "#" {
            send "$AP_COMMAND\r"
        }
        
    }

    expect {
        "==E=N=D==" {
            send "\x03"
        
            send "exit\r"

            send "\036x"

            send "quit\r"

            send "\r"

            expect eof
        }
    }
DONE
