#!/bin/bash
#Date:2018-03-18
#Auth:SANDAN
#Function:init Ubuntu 14.04 

y_echo () { echo -e "\033[033;1m$*\033[0m"; }
b_echo () { echo -e  "\033[1;34m$*\033[0m"; }
y_echo "-------------------------------------------------------"
y_echo "-            $hn Get Wan IP address                   -"
y_echo "-------------------------------------------------------"
echo "$(curl members.3322.org/dyndns/getip 2>/dev/null)" > /etc/wan

y_echo "-------------------------------------------------------"
y_echo "-            $hn Configure The Swap Partition         -"
y_echo "-------------------------------------------------------"
swapoff -a
MEM=`cat /proc/meminfo |grep MemTotal|awk '{printf ("%d\n",$2/1024/1024)}'`
makeswap(){
  mkswap /data/swap
  swapon /data/swap
  echo "/data/swap     swap    swap    defaults    0 0" >> /etc/fstab
}
if [[ $MEM -le 4 ]]; then
  dd if=/dev/zero of=/data/swap bs=1M count=4096
  makeswap

elif [[ $MEM -ge 4 || $MEN -le 16 ]]; then
    dd if=/dev/zero of=/data/swap bs=1M count=8192
      makeswap
else
        echo "NO Create Swap"
fi
