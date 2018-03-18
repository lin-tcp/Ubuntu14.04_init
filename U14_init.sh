#!/bin/bash
#Date:2018-03-18
#Auth:SANDAN
#Function:init Ubuntu 14.04 

y_echo () { echo -e "\033[033;1m$*\033[0m"; }
b_echo () { echo -e  "\033[1;34m$*\033[0m"; }
y_echo "-------------------------------------------------------"
y_echo "-            2. Get Wan IP address                    -"
y_echo "-------------------------------------------------------"
echo "$(curl members.3322.org/dyndns/getip 2>/dev/null)" > /etc/wan
