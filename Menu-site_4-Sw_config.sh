#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : Switch-logs Tool
# Script name    : Menu-site_4-NAC-Sw.sh
# Site           : site_4 
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_4-Sw

show_menu ()
{
#input
echo " "
echo "#--Entering Network Tool Menu for NAC-Sw Diagnostics site--#"
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#   ** Switch Config Tools - SW **     #"
echo "#              Site: site_4            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo " "
echo "[1] Config for Individual Switch"
echo "[2] Config for All Switches"
echo "[v] Verify the current of a Switch Port"
echo " ****************************************"
echo "[b] Back to previous Menu "
echo "[h] Back to Main Menu "
echo "[x] Back to Main Menu "
echo " ****************************************"
echo " "
echo -n  "You are choosing :" 

}

########## Main ###########
clear

while true   
do

show_menu


read choose
echo " "

case $choose in
        1)
	echo " *** Config for Individual Switch *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_4-NAC-Sw/$MONTH/site_4-Sw-configFile_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored into : $DIR"
          
        # Input
	echo " ****************************** "
	echo -n " Input Switch IP Address: "
	read  address
	echo " ****************************** "

         ./site_4-Sw-configFile-Alcatel.exp $address $username $password > $DIR/$address 2>&1

	echo "Configuration ... DONE!"
	echo ""
	sleep 3
        ;;
	 
        2)
	echo " *** Config for All Switches *** "

	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_4-NAC-Sw/$MONTH/site_4-Sw-configFileAll_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored into : $DIR"

	# Routine
	
	line=`cat IP-site_4.txt | wc -l`
	echo "number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
	do

	   address=`cat IP-site_4.txt | head -$num | tail -1`
                
	   echo "$num.Switch IP: $address ... saved"
           ./site_4-Sw_configFile-Alcatel.exp $address $password > $DIR/$address 2>&1
	
	   num=$(( $num + 1 ));
	   sleep 1
	   done
	echo "Configuration ... DONE!"
	echo ""
	sleep 3
        ;;
	   
  
	v)
	echo " *** Verify the current of a Switch Port *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_4-NAC-Sw/$MONTH/site_4-Sw-configFile-verify_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored into : $DIR"
          
        # Input
	echo " *********************************** "
	echo "Input Switch IP Address:" 
	read address

	echo "Input A Switch Port [E.g. 1/20]: " 
	read port

	echo " ****************************** "

           ./site_4-Sw-configFile-verify.exp $address $username $password > $DIR/$address 2>&1

	echo "Verification ... DONE!"
	echo "View the log here: $DIR"
	echo ""
	sleep 3
        ;;
	
        b)
        echo "Back to Previous Menu ..."
        sleep 1
           ./Menu-site_4.sh
        ;;
	
        h)
        echo "Back to main menu ..."
        sleep 1
           ./Menu.AFM.sh
        ;;

        *)
        echo " Wrong Input, please choose again"
        ;;
   esac

done
