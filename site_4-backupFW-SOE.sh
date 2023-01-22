#!/bin/bash

#----------------------------------#
# Script name: site_4-backupFW-SOE.sh 
# Site       : site_4
# Developer  : ~sm~
#----------------------------------#

#Verify login into the machine
. ~/script/Login-site_4-Fw

echo "#########################################"
echo "#    Welcome to  NetworX Management     #"
echo "# ** Backup logs for SOE Firewall ** #"
echo "#               Site: site_4               #"
echo "#########################################"
echo ""


# Input

# This week`
WEEK=`date +%V`
DATE=`date +%F`
MONTH=`date +%b-%y`

#  Adresses
VIP=4.4.4.1
FW0700=4.4.4.4
FW1700=4.4.4.5

#DIR=~/script/site_4/Security/FW
DIR=~/script/logs/site_4-Firewall/$MONTH/site_4-FWSOE-logs_$DATE

mkdir -p $DIR
echo "Backup config saved : $DIR"


# Start to do the job 
./site_4-backupFW-SOE.exp $VIP $username $password > $DIR/4.4.4.1 2>&1
echo "Vip-FW01 backup logs done..."
sleep 1
./site_4-backupFW-SOE.exp $FW0700 $username $password > $DIR/4.4.4.4 2>&1
echo "FW0700 backup logs done..."
sleep 1
./site_4-backupFW-SOE.exp $FW1700 $username $password > $DIR/4.4.4.5 2>&1
echo "FW1700 backup logs done..."


# End of code
