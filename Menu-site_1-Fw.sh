#!/bin/bash

clear

#################################
# Script to backup FW config    #
# File Name : Menu-site_1-Fw.sh #
# Site      : site_1            #
# Developer : sm@Devel          #
#################################

# Function # 
#**********#

#  Function: FWSM
backupFWSM ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call backupFWSM.sh script
./site_1-backupFWSM.sh
echo ""
echo "FWSM Configs being saved ..."
echo ""
echo "----000----"
echo ""
}

# Function: SOE-Netscreen Juniper 
backupFW_SOE ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call backupFW-SOE.sh script
./site_1-backupFW-SOE.sh
echo ""
echo "FW-SOE Configs being saved ..."
echo ""
echo "----000----"
}

# Function Backup All
backupFW_All ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call backup FW all
./site_1-backupFW-All.sh
echo ""
echo "All FW Configs being saved ..."
echo ""
echo "----000----"
}

#end of function


show_menu ()
{
echo ""
echo "############################"
echo "#   Backup for Firewall    #"
echo "#       Site: site_1        #"
echo "############################"
echo ""
echo "---- Firewalls ----"
echo -n "Please Select what You want to backup "
echo "" 
echo "[1] Backup FWSM" 
echo "[2] Backup Juniper FW" 
echo "[3] Backup All" 
echo ""
echo "[b] Back to Previous Page ..." 
echo "[h] Back to Main Page ..." 
echo ""
echo "------******-----"
echo -n "You are Choosing: " 
}

########## Main ###########
clear
while true   
do

show_menu

read select 
    case $select in 
         1)
         #echo "backup FWSM - Cisco"
         backupFWSM
         ;;
         2)
         #echo "backup SOE FW - Netscreen"
         backupFW_SOE
         ;;
         3)
         #echo "backup FW All"
         backupFW_All
         ;; 
         b)
         echo "Back to Previous Page ..."        
	 exit 0 
         ;; 
         h)
         echo "Back to Main Home ..."
         exit 0 
         ;; 
         *)
         echo "" 
         echo "You press wrong choice, Please try again"
         echo "" 
         ;; 
    esac
done  
