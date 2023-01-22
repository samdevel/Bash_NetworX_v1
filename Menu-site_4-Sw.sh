#!/bin/sh

clear

#--------------------------------------------#
# Script Purpose : To Backup Config Switch
# Script name    : Menu-site_4-Sw.sh
# Site           : site_4
# Developer      : ~sm~
#--------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_4-Sw

#input
echo " "
echo "#--Entering Network Tool Menu for site_4 site--#"
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#   ** Backup logs for Switch **       #"
echo "#              Site: site_4            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Backup Configs"
echo "[2] Backup Show-tech"
echo "[3] Backup Configs-Custom"
echo "***************************"
echo "[b] Back to Previous Menu"
echo "[h] Back to Main "
echo " "
echo -n  "You are choosing : " 

read choose
echo " "

case $choose in
     1)
	echo " *** Backup logs *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/Switch/$MONTH/site_4-Sw-backuplogs_$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being saved: $DIR"

	# Routine
	
	line=`cat IP-site_4.txt | wc -l`
	echo "number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
	     do

	     address=`cat IP-site_4.txt | head -$num | tail -1`
                
	     echo "$num.Switch IP: $address ... saved"
	     ./site_4-backupSwitch-Alcatel.exp $address $username $password > $DIR/$address 2>&1

	     num=$(( $num + 1 ));
	     sleep 2
	     done
        ;;

        2)
	echo " *** Backup Show tech *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/Switch/$MONTH/site_4-Showtech_$DATE

	mkdir -p $DIR
	echo " "

	echo "Config being saved: $DIR"

	# Routine
	line=`cat IP-site_4.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
	    do

	    address=`cat IP-site_4.txt | head -$num | tail -1`
                
	    echo "$num.Switch IP: $address ... saved"
            ./site_4-backupSwitch-Alcatel_ShowTech.exp $address $username $password > $DIR/$address 2>&1
		
	    num=$(( $num + 1 ));
	    sleep 2
	    done
        ;;
       
        3)
	echo " *** Backup Custom logs  *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/Switch/$MONTH/site_4-backupConfigCustom_$DATE

	mkdir -p $DIR
	echo " "

     	# Routine
	line=`cat IP-site_4.txt | wc -l`
	echo "number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
	do

	   address=`cat IP-site_4.txt | head -$num | tail -1`

	   echo "$num.Switch IP: $address ... configured"
           ./site_4-backupSwitch-Alcatel_Custom.exp $address $username $password > $DIR/$address 2>&1
		
	   num=$(( $num + 1 ));
	   sleep 2
	   done
        ;;
        
        b)
        echo "Back to Previous Menu ..."
        sleep 1
          ./Menu-site_4.sh
        ;;

        h)
        echo "Back to AFM Main Menu ..."
        sleep 1
          ./Menu.AFM.sh
        ;;

        *)
        echo " Wrong Input, Please Try Again ..."
        ;;

    esac
