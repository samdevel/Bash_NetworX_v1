#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : Network Tool
# Script name    : Menu-site_2-Network-Tool.sh
# Site           : site_2 
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
#. ~/script/Login-site_2-Aruba

#input
echo " "
echo "#--Entering Network Tool Menu for ASTAR site--#"
echo " "
echo "########################################"
echo "#    Welcome to  NetworX Management    #"
echo "#        ** NetworX -  Tool **         #"
echo "#            Site: site_2              #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Compare (Recent vs Previous) Config "
echo "[2] Compare (Custom) Config "
echo "[3] List Config Logs Directory"
echo "[4] Compare (Recent vs Previous) Route "
echo "[5] Compare (Custom) Route "
echo "[6] List Route Logs Directory"
echo "**************************"
echo "[d] Device Discovery"
echo "[s] SNMP Tool"
echo "**************************"
echo "[b] Back to previous Menu"
echo "[h] Back to main "
echo " "
echo -n "You are choosing :" 

read choose
echo " "

case $choose in

	1)
        echo "*** Compare (Recent vs Previous) logs *** "
	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-Config.$DATE
	
	mkdir -p $DIR
	echo " "

	# Input
	echo "what backup files to be compared?"
	echo -n "type ->fw is firewall or ->sw is switch: "
	read select_compare


	if [ $select_compare == 'fw' ]
	then

 	   DATE=`date +%F`
	   MONTH=`date +%B%y`
	   DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-Config-Firewall_$DATE
	   FW=2.2.6.1
           mkdir -p $DIR
	   echo " "

	   echo "*** Compare fw configs ***"

	   # Prepare the job
           DATE=`date +%F`
	   MONTH=`date +%B%y`
	   DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-Config-Firewall_$DATE
	   FW=2.2.6.1
           mkdir -p $DIR
	   echo " "

	   echo "*** Compare fw configs ***"
	   # Prepare the job
           dir0=~/script/logs/site_2-Firewall/$MONTH 
           ls -tr ~/script/logs/site_2-Firewall/$MONTH | tail -1 > dir1
	   ls -tr ~/script/logs/site_2-Firewall/$MONTH | tail -2 | head -1 > dir2

	   echo ""
     
	   # Start to do the job 
           echo "Compare Files: `cat dir1`/VIP-FW.txt vs `cat dir2`/VIP-FW.txt"
	   sleep 2

           echo "*** Comparing backup configs ***"
           echo ""
           
           diff -y -W 90 $dir0/`cat dir1`/VIP-FW.txt $dir0/`cat dir2`/VIP-FW.txt > $DIR/$FW.txt
	   echo `cat $DIR/$FW.txt`
	   sleep 10
	   rm -f dir*


	elif [ $select_compare == 'sw' ]
	then
	  
	echo "*** Compare (Recent vs Previous) logs *** "
	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-Config-Switch_$DATE
	
	mkdir -p $DIR
	echo " "
	
	echo "*** compare sw configs ***"

	   # Prepare the job
	   dir0=~/script/logs/Switch/$MONTH 
           ls -tr * / ~/script/logs/Switch/$MONTH | tail -1 > dir1
	   ls -tr * / ~/script/logs/Switch/$MONTH | tail -2 | head -1 > dir2

	   echo "Pls enter the IP of the switch: "
	   read sw_ip
        
	   # Start to do the job 
	   echo "Compare Files: `cat dir1`/$sw_ip vs `cat dir2`/$sw_ip"
	   sleep 2
	   echo ""

           echo "*** Comparing backup configs ***"
           echo ""
           diff -y -W 90 $dir0/`cat dir1`/$sw_ip $dir0/`cat dir2`/$sw_ip >$DIR/$sw_ip.txt
	   echo `cat $DIR/$sw_ip.txt`
	   sleep 10
	   rm -f dir*

		
	else
	   echo "sorry, you type wrong keys, pls type either sw or fw"
	fi
        ;;
	
	
	2)
	echo " *** Compare (Custom) Config *** "
        echo "[It's easier to press key "3" to see entire directory]"
	echo "type the date format: yyyy-mm-dd , e.g. 2016-01-13 "
	read mydate
	
	echo "Device IP address "
	read network_device


	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-config-custom.$DATE
	
	mkdir -p $DIR
	echo " "

	echo "Server saved into : $DIR"
        # Prepare the job
	cd  
	# Start to do the job 
        
        echo ""
        ;;

        3)

	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Network-Tool/Compare-Config.$DATE

	mkdir -p $DIR
	echo " "

	   echo " List Config Logs Directory "
	   echo ""
	   ls -ldtr ~/script/logs/Switch/$MONTH/ > $DIR/list_backup_directory.txt

	   echo `ls -ldtr */ ~/script/logs/Switch/$MONTH/`
	
	   sleep 5
        ;;

        4)
        echo "Compare (Recent vs Previous) Route"
	echo "-Under development-"
        ;;

        5)
        echo "Compare (Custom) Route"
	echo "-Under development-"
        ;;
        
        6)
        echo  "List Route Logs Directory"
	echo "-Under development-"        
	;;

        d)
	echo " *** Discovery *** "

	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Netowrk-Tool/Discovery.$DATE

	
	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Input
	echo -n "Input the network [e.g. 10.10.10.0]:"
        read network
        echo ""
        echo -n "Input subnet [e.g. 24 is for (subnet /24)]:"
        read subnet

        # Start to do the job 
	nmap -sP $network/$subnet | grep Host | awk '{Print $2}' >$DIR/AddressList
        echo ""
        echo "Discovering number of devices ..."
        
        num_dev=`cat $DIR/AddressList | wc -l`
	echo "Discovers: $num_dev device(s)"
        ;;

        s)
	echo " *** SNMP Tool *** "
        
	DATE=`date +%F`
	MONTH=`date +%B%y`
	DIR=~/script/logs/$MONTH/site_2-Network-Tool/SNMP.$DATE

	mkdir -p $DIR
	echo " "

	echo "Server saved into : $DIR"
        
	# Start to do the job 
       
        echo "NAC01 service restarted done..."
        echo ""

        ;;


        b)
        echo "Back to Previous Menu ..."
        sleep 1
           ./Menu-site_2.sh
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
