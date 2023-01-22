#!/bin/bash

#------------------------------------------#
# Script name: site_2-backupClearPass.sh 
# Site       : site_2
# Developer  : sm@Devel
#------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_2-Aruba

echo "############################################"
echo "#      Welcome to  NetworX Management      #"
echo "# ** Backup logs for Aruba-ClearPass **    #"
echo "#                Site: site_2               #"
echo "############################################"
echo ""

# Input
#echo " "

# This week`
WEEK=`date +%V`
DATE=`date +%F`
MONTH=`date +%b-%y`

#IP address
echo "Set Mgmt IP: 2.2.2.158"
echo "Set Netmask: 255.255.255.248"
echo "set G-way  : 2.2.2.153"

#Checking the Mgmt Interface


#  NAC-ClearPass IP Addresses
NAC01=2.2.2.156
NAC02=2.2.2.157


#DIR=~/it/Desktop/script/site_2/Security/FW
DIR=~/script/logs/site_2-NAC-Aruba/$MONTH/site_2-NAC-Aruba-logs_$DATE

mkdir -p $DIR
echo "Config stored : $DIR"

# Start to do the job 
./site_2-backupClearPass.exp $NAC01 $username $password > $DIR/NAC01-156.txt 2>&1
echo "NAC01 backup logs done..."
echo ""
./site_2-backupClearPass.exp $NAC02 $username $password > $DIR/NAC02-157.txt 2>&1
echo "NAC02 backup logs done..."
echo ""

# End of code
