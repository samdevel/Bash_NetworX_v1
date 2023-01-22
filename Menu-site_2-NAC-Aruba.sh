#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : NAC diagnostics Tool
# Script name    : Menu-site_2-NAC-Aruba.sh
# Site           : site_2 
# Developer      : sm@Devel
#--------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_2-Aruba

#input
echo " "
echo "#--Entering Network Tool Menu (Aruba - NAC) for site_2 site--#"
echo " "
echo "########################################"
echo "#    Welcome to  NetworX Management    #"
echo "#  ** NAC - Aruba Diagnostics Tool **  #"
echo "#              Site: site_2            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] Users Authentication"
echo "[2] Services Status"
echo "[3] All Status"
echo "**************************"
echo "[s] Restart the service"
echo "**************************"
echo "[b] Back to previous Menu"
echo "[h] Back to main "
echo " "
echo -n  "You are choosing :" 

read choose
echo " "

case $choose in
     1)
	echo " *** Users Authentication *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/NAC-Aruba/$MONTH/site_2-NAC-Aruba-Auth_$DATE

	NAC01=2.2.2.156
	
	mkdir -p $DIR
	echo " "

	echo "Config being stored into : $DIR"

        # Start to do the job 
        ./site_2-NAC-Aruba-Auth.exp $NAC01 $username $password > $DIR/2.2.2.6 2>&1
        echo "Auth at NAC01 backup logs done..."
        echo ""
        ;;

	2)
        echo "*** Services Status *** "
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/NAC-Aruba/$MONTH/site_2-NAC-Aruba-Services_$DATE
	
	mkdir -p $DIR
	echo ""
        echo "Service status log : $DIR"
	
        NAC01=2.2.2.156
	
	# Start to do the job 
        ./site_2-NAC-Aruba-Services.exp $NAC01 $username $password > $DIR/2.2.2.6 2>&1
        echo "Services at NAC01 done..."
        echo ""
        ;;
	
	
	3)
	echo " *** All Server Status *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/NAC-Aruba/$MONTH/site_2-NAC-Aruba-Service-All_$DATE

	NAC01=2.2.2.6
	
	mkdir -p $DIR
	echo ""

	echo "All Service logs : $DIR"
        
	# Start to do the job 
        ./site_2-NAC-Aruba-Service-All.exp $NAC01 $username $password > $DIR/2.2.2.6 2>&1
        echo "NAC01 backup logs done..."
        echo ""
        ;;

        s)
	echo " *** Restart the Service *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/NAC-Aruba/$MONTH/site_2-NAC-Aruba-restartService_$DATE

	NAC01=2.2.2.6
	NAC01=2.2.2.7

	mkdir -p $DIR
	echo " "

	echo "Server saved into : $DIR"
        
	# Start to do the job 
        ./site_2-NAC-Aruba-restartService.exp $NAC01 $username $password > $DIR/2.2.2.6 2>&1
        echo "NAC01 service restarted done..."
        echo ""

        ./site_2-NAC-Aruba-restartService.exp $NAC02 $username $password > $DIR/2.2.2.7 2>&1
        echo "NAC01 service restarted done..."
        echo ""

        ;;


        b)
        echo "Back to Previous Menu ..."
        sleep 1
           ./Menu-site_2-NAC.sh
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
