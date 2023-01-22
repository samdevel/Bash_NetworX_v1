#!/bin/bash

#------------------------------------------------------------#
# Script name : site_1-backupFWSM.sh
# Site        : site_1
# Developer   : sm@Devel
#------------------------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_1-FWSM

# Input

# Date variables`
DATE=`date +%F`
MONTH=`date +%b-%y`

#  Adresses
BP_FWSM01=1.1.1.12
BP_FWSM02=1.1.1.13
FP_FWSM01=1.1.2.1
FP_FWSM02=1.1.2.2

DIR=~/script/logs/site_1/Firewall/$MONTH/site_1-FWSM_$DATE

mkdir -p $DIR
echo "Config files saved: $DIR"


# Start to do the job 
./site_1-backupFWSM.exp $BP_FWSM01 $username $password $enpass > $DIR/1.1.1.12 2>&1
echo "BP-FW01-1.1.1.12 backup configs done..."
echo ""
./site_1-backupFWSM.exp $BP_FWSM02 $username $password $enpass > $DIR/1.1.1.13 2>&1
echo "BP-FW02-1.1.1.13 backup configs done..."
echo ""
./site_1-backupFWSM.exp $FP_FWSM01 $username $password $enpass > $DIR/1.1.2.1 2>&1
echo "FP-FW01-1.1.2.1 backup configs done..."
echo ""
./site_1-backupFWSM.exp $FP_FWSM02 $username $password $enpass > $DIR/1.1.2.2 2>&1
echo "FP-FW02-1.1.2.2 backup configs done..."
echo ""
 
