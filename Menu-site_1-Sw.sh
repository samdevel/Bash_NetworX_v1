#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : to backup&config Switch
# Script name    : Menu-site_1-Sw.sh
# Site           : Site_1
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_1-Sw

#input
echo " "
echo "#--Entering Network Tool Menu for Site 1--#"
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#        Developed by  sm@Devel        #"
echo "#             Site: site_ 1            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Backup Configs"
echo ""
echo "[2] Backup Show-tech"
echo ""
echo "[3] Backup Configs-Custom Core"
echo ""
echo "[4] Backup Configs-Custom Access"
echo "**************************"
echo "[b] Back to previous Menu"
echo "[h] Back to Main "
echo "**************************"
echo " "
echo -n  "You are choosing :" 

read choose
echo " "

case $choose in
     1)
	echo " *** Backup Configs *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1/Switch/$MONTH/site_1-Sw-Configs_$DATE
	
	mkdir -p $DIR
	echo " "

	echo "Config being saved : $DIR"

	# Routine
	
	line=`cat IP-site_1.txt | wc -l`
	echo "number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_1.txt | head -$num | tail -1`
                
		echo "$num.Switch IP: $address ... saved"
		./site_1-backupSwitch-Cisco.exp $address $username $password $enpass > $DIR/$address 2>&1

		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     2)
	echo " *** Backup Show tech *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1/Switch/$MONTH/site_1-Sw-ShowTech_$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Routine
	line=`cat IP-site_1.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_1.txt | head -$num | tail -1`
                
		echo "$num.Switch IP: $address ... saved"
		./site_1-backupSwitch-Cisco-ShowTech.exp $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     3)
     echo "*** Backup Custom for Core Switch *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=config/Switch/$MONTH/site_1-Sw-Configs-Custom-Core.$DATE
	DIR=~/script/logs/site_1/Switch/$MONTH/site_1-Sw-Configs-Custom-Core_$DATE

	mkdir -p $DIR
	echo " "

     	# Routine
	line=`cat IP-site_1-Core.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_1-Core.txt | head -$num | tail -1`

		echo "$num.Switch IP: $address ... Configs being Saved"
		./site_1-backupSwitch-Cisco_Custom-Core.exp $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     4)
     echo "*** Backup Custom for Access Switch *** "
	
        DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/site_1/Switch/$MONTH/site_1-Sw-Configs-Custom-Access_$DATE

	mkdir -p $DIR
	echo " "

     	# Routine
	line=`cat IP-site_1-Access.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_1-Access.txt | head -$num | tail -1`

		echo "$num.Switch IP: $address ... Config being Saved"
		./site_1-backupSwitch-Cisco_Custom-Access.exp $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     b)
     echo "Back to Previous Menu ..."
        sleep 1
        ./Menu-site_1.sh
       ;;
     h)
     echo "Back to Main Menu ..."
        sleep 1
        ./Menu.AFM.sh
       ;;
     *)
        echo " Wrong Input, please choose again"
       ;;
esac
