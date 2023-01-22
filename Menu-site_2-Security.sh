#!/bin/bash

clear

########################################
# Script to backup Security Appliances #
# File NAme : Menu-site_2-Security.sh
# Site      : site_2                      #
# Developer : sm@Devel
########################################

# Functions # 

# *** Function SOE-Netscreen Juniper ***
backupFWSOE ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call backuFW-SOE.sh script
./site_2-backupFW-SOE.sh
echo ""
echo "FW logs being saved ..."
echo ""
echo "----000----"
echo ""
}

# *** Function: Aruba - ClearPass -NAC *** 
backupClearPass ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call backuClearPass.sh script
./site_2-backupClearPass.sh
echo ""
echo "Aruba NAC-ClearPass logs being saved ..."
echo ""
echo "----000----"
echo ""
}

#end of function


show_menu ()
{
echo ""

echo "###############################################"
echo "#       Welcome to  NetworX Management        #"
echo "#  ** Backup logs for Security Appliance **   #"
echo "#                Site: site_2                 #"
echo "###############################################"
echo ""
echo "---- Security Appliances ----"
echo -n "Please Select what You want to backup "
echo "" 
echo "[1] Backup Juniper FW" 
echo "[2] Backup Aruba ClearPass-NAC" 
echo ""
echo "[b] Back to Previous Page ..." 
echo "[h] Back to AFM Main Page ..." 
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
         #echo "backup FW - Netscreen"
         backupFWSOE
         ;;
         2)
         #echo "backup ClearPass-NAC Aruba"
         backupClearPass
         ;;
         b)
         echo "Back to Previous Page ..."
         ./Menu-site_2.sh  
	      sleep 1
         ;; 
         h)
         echo "Back to Main Home ..."
         ./Menu.AFM.sh
	     sleep 1
         ;; 
         *)
         echo "" 
         echo "You press wrong choice, Please try again" 
         ;; 
    esac
done  
