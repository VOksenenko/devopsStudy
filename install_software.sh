#!/bin/bash
input=$1
OS=$( cat /etc/os-release|grep -iE '^ID='| awk -F '=' '{print $2}'| tr -d '"' )

while IFS= read -r line
do
    case $OS in
        ubuntu)
            echo "ubuntu"
            #yes | sudo apt-get install $line
            yes| sudo apt remove $line
            ;;

        centos)
            echo "centos"
            sudo yum -y install $line
            ;;

       *)
           echo  "Sorry. Cannot define OS distribution. Cannot install soft on this host."
           ;;
    esac
done < "$input"
