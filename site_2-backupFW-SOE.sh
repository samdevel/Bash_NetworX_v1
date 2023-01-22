#!/bin/bash

#----------------------------------#
# Script name: site_2-backupFW-SOE.sh 
# Site       : site_2
# Developer  : sm@Devel
#----------------------------------#

#Verify login into the machine
. ~/script/Login-site_2-Fw

echo "#########################################"
echo "#    Welcome to  NetworX Management     #"
echo "#    ** Backup logs for   Firewall **   #"
echo "#               Site: site_2            #"
echo "#########################################"
echo ""


# Input

# This week`
WEEK=`date +%V`
DATE=`date +%F`
MONTH=`date +%b-%y`

#  Adresses
VIP=2.2.2.1
FW0700=2.2.2.4
FW1700=2.2.2.5

#DIR=~/script/site_2/Security/FW
DIR=~/script/logs/site_2-Firewall/$MONTH/site_2-FWSOE-logs_$DATE

mkdir -p $DIR
echo "Backup config saved : $DIR"


# Start to do the job 
./site_2-backupFW-SOE.exp $VIP $username $password > $DIR/2.2.2.1 2>&1
echo "Vip-FW01 backup logs done..."
sleep 1
./site_2-backupFW-SOE.exp $FW0700 $username $password > $DIR/2.2.2.4 2>&1
echo "FW0700 backup logs done..."
sleep 1
./site_2-backupFW-SOE.exp $FW1700 $username $password > $DIR/2.2.2.5 2>&1
echo "FW1700 backup logs done..."


# End of code
