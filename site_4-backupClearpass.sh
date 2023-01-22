#!/bin/bash

#------------------------------------------#
# Script name: site_4-backupClearPass.sh 
# Site       : site_4
# Developer  : sm@Devel
#------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_4-Aruba

echo "############################################"
echo "#      Welcome to  NetworX Management      #"
echo "# ** Backup logs for Aruba-ClearPass **    #"
echo "#                Site: site_4                 #"
echo "############################################"
echo ""

# Input
#echo " "

# This week`
WEEK=`date +%V`
DATE=`date +%F`
MONTH=`date +%b-%y`

#IP address
echo "Set Mgmt IP: 4.4.4.158"
echo "Set Netmask: 255.255.255.248"
echo "set G-way  : 4.4.4.153"

#Checking the Mgmt Interface


#  NAC-ClearPass IP Addresses
NAC01=4.4.4.156
NAC02=4.4.4.157


#DIR=~/it/Desktop/script/site_4/Security/FW
DIR=~/script/logs/site_4-NAC-Aruba/$MONTH/site_4-NAC-Aruba-logs_$DATE

mkdir -p $DIR
echo "Config stored : $DIR"

# Start to do the job 
./site_4-backupClearPass.exp $NAC01 $username $password > $DIR/NAC01-156.txt 2>&1
echo "NAC01 backup logs done..."
echo ""
./site_4-backupClearPass.exp $NAC02 $username $password > $DIR/NAC02-157.txt 2>&1
echo "NAC02 backup logs done..."
echo ""

# End of code
