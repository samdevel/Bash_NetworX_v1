#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : to backup&config Switch
# Script name    : Menu-site_3.sh
# Site           : site_3
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
. ~/script/AFM-site_3-Login

#input
echo " "
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#        Developed  by  sm@Devel       #"
echo "#              Site: site_3            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Backup logs"
echo "[2] Backup Show-tech"
echo "[3] logs"
echo "[b] back to main "
echo " "
echo -n "You are choosing :" 

read choose
echo " "

case $choose in
     1)
	echo " *** Backup logs *** "

	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/config/Switch/$MONTH/site_3-logs.$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Routine

	line=`cat IP-site_3.txt | wc -l`
	echo "number of devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_3.txt | head -$num | tail -1`

		echo "Swith IP: $address ... saved"
		./AFM-backupSwitch-Cisco.exp  $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(($num + 1));
		sleep 1
		done
     ;;
     2)
	echo " *** Backup Show tech *** "
        
	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/config/Switch/$MONTH/site_3-ShowTech.$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Routine
	
	line=`cat IP-site_3.txt | wc -l`
	echo "number of devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_3.txt | head -$num | tail -1`

		echo "Switch IP: $address ... saved"
		./AFM-backupSwitch-Cisco-ShowTech.exp  $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(($num + 1));
		sleep 1
		done
     ;;
     3)
     echo"*** Configuring Switch *** "

	# Routine
	
	line=`cat IP-site_3.txt | wc -l`
	echo "number of devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_3.txt | head -$num | tail -1`

		echo "$address ... configured"
		./AFM-configuringFile.exp  $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(($num + 1));
		sleep 1
		done
     ;;
     b)
     echo "Back to main menu ..."
	   sleep 2
           ./Menu.AFM.sh
     ;;
     *)
     echo " Wrong Input, please choose again"
     ;;
 esac
