#!/bin/bash

clear

#Filename: Menu-site_2.sh

#######################################
#   Welcome  to  NetworX Management   #
#        Developed by sm@ADevel       #
#            Site : site_2            #
#          Version : cc-1.00          #
#######################################

# Functions # 

#  *** Function: Switch Backup ***

backup_sw ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call backup.sh script
./Menu-site_2-Sw.sh
echo ""
echo "Switch Configs being saved ..."
echo ""
echo "----000----"
echo ""
}

# *** Function: FW  and NAC-Aruba Backup ***
backup_fw ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_2-Security.sh script
./Menu-site_2-Security.sh
echo ""
echo "Security Appliance Configs being saved ..."
echo ""
echo "----000----"
}


# *** Function: Diagnostics Tools - ClearPass-NAC ***
ClearPass ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call configuring.sh script
./Menu-site_2-NAC.sh
echo ""
#echo "Configured ..."
echo ""
echo "----000----"
}


# *** Function: Switch Custom Config ***
config ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call configuring.sh script
./Menu-site_2-Sw_config.sh
echo ""
echo "Configured ..."
echo ""
echo "----000----"
}


#Function: call NetworX tool
networkTool ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call Sub program: networkTool.sh
./Menu-site_2-Network-Tool.sh
echo ""
echo "The tasks completed"
echo ""

}

#end of function

clear 

show_menu ()
{
echo ""
echo "#######################################"
echo "#   Welcome  to  NetworX Management   #"
echo "#           Site: site_2              #"
echo "#         Version cc-1.00             #"
echo "#######################################"
echo ""
echo "------- MENU --------"
echo -n "Please Select Options:  "
echo "" 
echo "[1] Backup Config-Switch " 
echo "" 
echo "[2] Backup Config Security Appliances " 
echo "" 
echo "[3] NAC - Diagnostics Tool" 
echo "" 
echo "[4] Switch - Config Tool" 
echo "" 
echo "*************************************"
echo "[t] NetworX Tool" 
echo "" 
echo "[h] Back to Main Menu" 
echo "*************************************"
echo -n "You Select: " 
}

########## Main ###########
clear
while true   
do

show_menu

read select 
    case $select in 
         1)
         #echo "backup Switch"
         backup_sw
         ;;
         2)
         #echo "backup Firewall"
         backup_fw
         ;;
         3)
         #ClearPass"
         ClearPass
         ;; 
         4)
         #echo "Config"
         config 
         ;;
         t)
         networkTool
         ;;
         h)
         echo "Back to AFM Main Menu ..."
         ./Menu.AFM.sh 
         ;; 
         *)
         echo "" 
         echo "You Press Wrong Selection, Please try again"
         echo "" 
         ;; 
    esac
done  
