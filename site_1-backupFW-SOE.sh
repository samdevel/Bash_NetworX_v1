#!/bin/sh

#------------------------------------------------------------#
# Script name : site_1-backupFW-SOE.sh
# Site        : site_1
# Developer   : ~sm~
#------------------------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_1-FWSM

# Input
#echo " "

# This week`
WEEK=`date +%V`
# This week`
DATE=`date +%F`
MONTH=`date +%b-%y`

#DIR=/home/it/Desktop/script/

#  Adresses
BP_SOE_FW01=1.1.1.6
BP_SOE_FW02=1.1.1.7
FP_SOE_FW01=1.1.5.5
FP_SOE_FW02=1.1.5.6

#DIR=/home/npnet_fm/NCS/script/config/Sidewinder/week.$WEEK
DIR=~/script/logs/site_1/Firewall/$MONTH/site_1-FWSOE_$DATE

mkdir -p $DIR
echo "Config stored : $DIR"

# Start to do the job 
./site_1-backupFW-SOE.exp $BP_SOE_FW01 $username $password > $DIR/1.1.1.6 2>&1
echo "BP-SOE-FW01 backup  done..."
echo ""
./site_1-backupFW-SOE.exp $BP_SOE_FW02 $username $password > $DIR/1.1.1.7 2>&1
echo "BP-SOE-FW01 backup  done..."
echo ""
./site_1-backupFW-SOE.exp $FP_SOE_FW01 $username $password > $DIR/1.1.5.5 2>&1
echo "FP-SOE-FW01 backup  done..."
echo ""
./site_1-backupFW-SOE.exp $FP_SOE_FW02 $username $password > $DIR/1.1.5.6 2>&1
echo "FP-SOE-FW02 backup done..."
echo ""

# End of Code
