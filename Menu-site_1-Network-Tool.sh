#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : Network Tool
# Script name    : Menu-site_1-Network-Tool.sh
# Site           : site_1 
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine

#input
echo " "
echo "#--Entering NetworX Tool Menu for site_1 site--#"
echo " "
echo "########################################"
echo "#    Welcome to  NetworX Management    #"
echo "#        ** NetworX -  Tool **         #"
echo "#            Site: site_1               #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Compare (Recent vs Previous) Config "
echo "[2] Compare (Custom) Config "
echo "[3] List of Config Switch Logs Directory"
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
	
	# Input
	echo "What backup files to be compared?"
	echo -n " # Pls type "fw" is for Firewall or "sw" is for Switch: "
	read select_compare
	echo ""

	case $select_compare in
	fw)
	   echo "Comparing (Recent vs Previous) Firewall Configs"
	   DATE=`date +%F`
	   MONTH=`date +%b-%y`
	   DIR=~/script/logs/site_1/Network-Tool/$MONTH/Compare-Config-Firewall_$DATE
	   FW=10.225.66.1
           mkdir -p $DIR
	   echo " "

	   # Prepare the job
           dir0=~/script/logs/site_1/Firewall/$MONTH 
           ls -tr ~/script/logs/site_1/Firewall/$MONTH | tail -1 > dir1
	   ls -tr ~/script/logs/site_1/Firewall/$MONTH | tail -2 | head -1 > dir2

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
	;;

	sw)
	echo "*** Comparing (Recent vs Previous) Switch Configs *** "
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1/Network-Tool/$MONTH/Compare-Config-Switch_$DATE
	
	mkdir -p $DIR
	echo " "

	   # Prepare the job
	   dir0=~/script/logs/site_1/Switch/$MONTH 
           ls -tr * / ~/script/logs/site_1/Switch/$MONTH | tail -1 > dir1
	   ls -tr * / ~/script/logs/site_1/Switch/$MONTH | tail -2 | head -1 > dir2
            	

	   echo "Pls enter the IP of the switch: "
	   read sw_ip
        
	   # Start to do the job 
	   echo "Compare Files: `cat dir1`/$sw_ip vs `cat dir2`/$sw_ip"
	   sleep 2
	   echo ""

           echo "Start Comparing backup file configs ..."
	   sleep 2
           echo ""
           diff -y -W 90 $dir0/`cat dir1`/$sw_ip $dir0/`cat dir2`/$sw_ip >$DIR/$sw_ip.txt
	   echo `cat $DIR/$sw_ip.txt`
	   sleep 10
	   rm -f dir*
	;;

	*)
	 echo "sorry, you type wrong keys, pls type either sw or fw"
	sleep 1
	;;
	esac
        ;;
	
	
	2)
	echo " *** Compare (Custom) Config *** "
	echo "Type the date format: yyyy-mm-dd , e.g. 2016-01-13 "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1/Network-Tool/$MONTH/Compare-config-custom_$DATE
	
	mkdir -p $DIR
	echo " "

	read mydate
	
	# Checking whether the date avaiable
	# Put the codes here...
	list_dir=`ls -tr * / ~/script/logs/site_1/Switch/$MONTH`
	num_dir=`ls -tr * / ~/script/logs/site_1/Switch/$MONTH | wc -l`
	echo "$num_dir"
	for ((i=0; i=<$num_dir; i++))
	do
	   ls_date=`ls -tr * / ~/script/logs/site_1/Switch/$MONTH | head -i | tail -1 | cut -d _ f2`
	   if ($mydate != $ls_date)
	   then 
		echo "The date you entered is wrong"
	        echo "[Press key "3" to see entire directory-for your reference]"
	        echo "Exiting ..."      
	        sleep 3
 	   else
	        echo "Device IP address "
	        read network_device
	   fi
	done

	echo "Server saved into : $DIR"
        # Prepare the job
		

	# Start to do the job 
        
        echo ""
        ;;

        3)

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1/Network-Tool/$MONTH/ListFile-Backup_$DATE

	mkdir -p $DIR
	echo " "

	   echo " List of Switch Config Logs Directory "
	   echo ""
	   ls -tr ~/script/logs/Switch/$MONTH/ > $DIR/list_backup_directory.txt

	   echo `ls -tr ~/script/logs/Switch/$MONTH/`
	   echo ""
	   #echo `cat $DIR/list_backup_directory.txt`
	   echo " *** end of directory list ***"
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
	echo " *** Discovery Tool *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1-Netowrk-Tool/$MONTH/Discovery_$DATE

	
	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

	# Input
	echo "************************************************"
	echo -n "Input the network [E.g. 10.10.10.0]:"
        read network
        echo ""
        echo -n "Input the subnet [E.g. 24 is for (subnet /24)]:"
        read subnet
	echo "************************************************"

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
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_1-Network-Tool/$MONTH/SNMP_$DATE

	mkdir -p $DIR
	echo " "

	echo "Log being saved: $DIR"
        
	# Start to do the job 
       
        echo "This feature is not available yet ..."
        echo ""

        ;;


        b)
        echo "Back to Previous Menu ..."
        sleep 1
           ./Menu-site_1.sh
        ;;

	h)
        echo "Back to The Main Menu ..."
        sleep 1
           ./Menu.AFM.sh
        ;;

	*)
          echo " Wrong Input, please choose again"
        ;;

esac
