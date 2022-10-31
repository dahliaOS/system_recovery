#!/bin/bash
neofetch gpu > /tmp/installer/gpu
neofetch cpu > /tmp/installer/cpu
neofetch memory > /tmp/installer/mem
uname -a > /tmp/installer/kernel
nmcli --terse -e no dev wifi > /tmp/installer/wifi
sh listdisks.sh > /tmp/installer/listDisks

