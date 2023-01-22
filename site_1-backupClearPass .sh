#!/bin/bash

#------------------------------------------#
# Script name: site_1-backupClearPass.sh 
# Site       : site_1
# Developer  : ~sm~
#------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_1-Aruba

echo "############################################"
echo "#      Welcome to  NetworX Management      #"
echo "# ** Backup logs for Aruba-ClearPass **    #"
echo "#                Site: site_1                 #"
echo "############################################"
echo ""

# Input
#echo " "

# This week`
WEEK=`date +%V`
DATE=`date +%F`
MONTH=`date +%b-%y`

#IP address
echo "Set Mgmt IP: 1.1.1.158"
echo "Set Netmask: 255.255.255.248"
echo "set G-way  : 1.1.1.153"

#Checking the Mgmt Interface


#  NAC-ClearPass IP Addresses
NAC01=1.1.1.156
NAC02=1.1.1.157


#DIR=~/it/Desktop/script/site_1/Security/FW
DIR=~/script/logs/site_1-NAC-Aruba/$MONTH/site_1-NAC-Aruba-logs_$DATE

mkdir -p $DIR
echo "Config stored : $DIR"

# Start to do the job 
./site_1-backupClearPass.exp $NAC01 $username $password > $DIR/NAC01-156.txt 2>&1
echo "NAC01 backup logs done..."
echo ""
./site_1-backupClearPass.exp $NAC02 $username $password > $DIR/NAC02-157.txt 2>&1
echo "NAC02 backup logs done..."
echo ""

# End of code