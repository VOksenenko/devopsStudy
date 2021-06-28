#!/bin/bash
# Get a sowtware file as parameter
input=$1

# Get OS distribution  from /etc/os-release. Filtered by ID, get  second tab after  equal sign using awk. Get rid of quotes using tr.
OS=$( cat /etc/os-release|grep -iE '^ID='| awk -F '=' '{print $2}'| tr -d '"' )

#Read line-by-line from input file till the end of file.
while IFS= read -r line
do
        # Use different actions depend on OS distribution using case operator and possible cases.
        # If neither ubuntu nor centos found, shows information message.
        case $OS in
        ubuntu)
            yes| sudo apt remove $line
            ;;

        centos)
            sudo yum -y install $line
            ;;

       *)  # This message will be shown if OS release do not match ubuntu or centos
           echo  "Sorry. Cannot define OS distribution. Cannot install soft on this host."
           ;;
    esac
done < "$input"
