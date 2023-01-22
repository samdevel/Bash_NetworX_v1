#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : to backup&config Switch
# Script name    : Menu-site_1-Sw_config.sh
# Site           : site_1
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
. /home/it/Desktop/script/Login-site_1

#input
echo " "
echo "#--Entering Network Tool Menu for site_1--#"
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#        Developed by  sm@Devel        #"
echo "#              Site: site_1            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Configuring BP Switch"
echo "[2] Configuring FP Switch"
echo "[3] Configs All Sites"
echo "[b] Back to previous Menu"
echo "[h] Back to main "
echo " "
echo -n  "You are choosing :" 

read choose
echo " "

case $choose in
     1)
	echo " *** Configuring Switches at BP *** "

	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=config/Switch/$MONTH/site_1-Configs-BP.$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Routine
	
	line=`cat IP-site_1-bp.txt | wc -l`
	echo "number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat site_1-IP-bp.txt | head -$num | tail -1`
                
		echo "$num.Switch IP: $address ... saved"
	        ./site_1-configuringFile-Cisco.exp $address $username $password $enpass  > $DIR/$address 2>&1

		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     2)
	echo " *** Configuring Switches at FP *** "
        
	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=config/Switch/$MONTH/site_1-Configs-FP.$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Routine
	line=`cat IP-site_1-fp.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat site_1-IP-fp.txt | head -$num | tail -1`
                
		echo "$num.Switch IP: $address ... saved"
	        ./site_1-configuringFile-Cisco.exp $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     3)
     echo "*** Configuring All Switches *** "

     	# Routine
	line=`cat IP-site_1.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
		do

		address=`cat IP-site_1.txt | head -$num | tail -1`

		echo "$num.Switch IP: $address ... configured"
	        ./site_1-configuringFile-Cisco.exp $address $username $password $enpass  > $DIR/$address 2>&1
		
		num=$(( $num + 1 ));
		sleep 1
		done
       ;;
     b)
     echo "Back to Previous Menu ..."
        sleep 1
        ./Menu-site_1-Sw.sh
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
