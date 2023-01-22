#!/bin/bash

clear

#--------------------------------------------#
# Script Purpose : Switch-NAC diagnostics Tool
# Script name    : Menu-site_2-NAC-Sw.sh
# Site           : site_2 
# Developer	 : ~sm~
#--------------------------------------------#

#Verify login into the machine
. ~/script/Login-site_2-Sw

show_menu ()
{
#input
echo " "
echo "#--Entering Network Tool Menu for NAC-Sw Diagnostics site--#"
echo " "
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#   ** NAC Diagnotics Tools - SW **    #"
echo "#              Site: site_2            #"
echo "########################################"
echo " "
echo " "
echo "**************************"
echo "Please select your choice:"
echo "**************************"
echo "[1] List Of NAC Ports Configured for All Switches"
echo "[2] List Of NAC Ports Configured fo Individual Switch"
echo "[3] List Of Authenticated NAC Users for All Switches"
echo "[4] List Of Authenticated NAC Users for Individual Switch"
echo "[5] List of Mac Address for All Switches"
echo "[6] List of Mac Address for Individual Switch"
echo "[7] Search for Mac Address" 
echo "[8] List Vlan Port for All Switches"
echo "[9] List Vlan Port for Individual Switch"
echo "********************************************"
echo "[c]  Config From Normal Port to NAC Port at Switch for A Port"
echo "[cx] Config From Normal Port to NAC Port at Switch for Multiple Port"
echo "[r]  Revert-Config From NAC To Normal Switch Port"
echo "[rx] Revert-Config From NAC To Normal Switch Port"
echo "[v]  Verify the current Switch Port"
echo "********************************************"
echo "[b] Back to previous Menu "
echo "[h] Back to Main Menu "
echo " "
echo -n "You are choosing: " 

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
	echo " *** List Of NAC Ports Configured for All Switches *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Port-All_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"

	# Routine
	
	line=`cat IP-site_2.txt | wc -l`
	echo "Number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
             do

	     address=`cat IP-site_2.txt | head -$num | tail -1`
                
	     echo "$num.Switch IP: $address ... config read"
             ./site_2-NAC-Sw-Port.exp $address $username $password > $DIR/$address 2>&1
	     num=$(( $num + 1 ));
	     sleep 1
	     done
        echo "Listing NAC Ports ... DONE!"
	echo ""
	sleep 3     
        ;;
	   
        2)
	echo " *** List Of NAC Port Configured fo Individual Switch *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Port-Indv_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"
          
        # Input
	echo "*************************************** "
	echo -n "Input Switch IP Address: "
	read  address
	echo "*************************************** "

           ./site_2-NAC-Sw-Port.exp $address $username $password > $DIR/$address 2>&1

        # result
	ref_ip=2.225.72.23
        countNACPort=`cat $DIR/$address | wc -l`
	sleep 1

        if [ $ref_ip ==  $address ]
        then
           countEnd=$(($countNACPort - 34))
	   sleep 1
        else
           countEnd=$(($countNACPort - 18))
	   sleep 1
        fi

        viewNACPort=`cat $DIR/$address | tail -$countEnd`

        echo ""
        echo "Data being pulled from the logs  ..."
        sleep 1
        echo "Showing NAC Port being Configured"
	echo "*********************************"
	echo ""
        echo "$DIR/$viewNACPort"
        sleep 2
        ;;
	   
        3)
        echo "*** List Of User NAC Authenticated for All Switches *** "
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Auth-All_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"

     	# Routine
	line=`cat IP-site_2.txt | wc -l`
	echo "Number of Devices: $line"

	num=1

	#echo $line
	while [ $num -le $line ]
	     do

	     address=`cat IP-site_2.txt | head -$num | tail -1`

	     echo "$num.Switch IP: $address ... data read"
             ./site_2-NAC-Sw-Auth.exp $address $username $password > $DIR/$address 2>&1
		
	     num=$(( $num + 1 ));
	     sleep 1
	     done

        echo "Listing User NAC Authenticated ... DONE!"
	echo ""
	sleep 3     
        ;;
    
	4)
	echo " *** List Of USer NAC Port Authenticated for Individual Switch *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Auth-Indv_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"
          
        # Input
	echo "************************************* "
	echo -n " Input Switch IP Address: "
	read  address
	echo "************************************* "
            ./site_2-NAC-Sw-Auth.exp $address $username $password > $DIR/$address 2>&1

        # result
	ref_ip=2.2.7.23
        countNACAuth=`cat $DIR/$address | wc -l`

        if [ $address == $ref_ip ]
        then
           countEnd=$(($countNACAuth - 34))
           else
               countEnd=$(($countNACAuth - 18))
        fi

        viewNACAuth=`cat $DIR/$address | tail -$countEnd`
        echo ""
        echo "Data being pulled from the logs ..."
        sleep 1
        echo "Showing NAC Port being Authenticated"
	echo "************************************"
	echo ""
        echo "$DIR/$viewNACAuth"
        sleep 2

        ;;
	
	5)
	echo " *** List Of Mac-Address On All Switch *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Mac-List-All_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"

	# Routine
	
	line=`cat IP-site_2.txt | wc -l`
	echo "number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
	     do

	     address=`cat IP-site_2.txt | head -$num | tail -1`
                
	     echo "$num.Switch IP: $address ... Data read"
             ./site_2-Sw-Mac-List.exp $address $username $password > $DIR/$address 2>&1

	     num=$(( $num + 1 ));
	     sleep 1
	     done

        echo "Listing User Mac-Address ... DONE!"
	echo ""
	sleep 3     	
        ;;
    
	6)
	echo " *** List Of Mac-Address On Individual Switch *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Mac-List-Indv_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored: $DIR"
          
        # Input
	echo "************************************* "
	echo -n "Input Switch IP Address: "
	read address
	echo "************************************* "

           ./site_2-Sw-Mac-List.exp $address $username $password > $DIR/$address 2>&1

        # result
	ref_ip=2.225.72.23     
        countMacList=`cat $DIR/$address | wc -l`
		
        if [ $address == $ref_ip ]
        then
           countEnd=$(($countMacList - 34))
           else
               countEnd=$(($countMacList - 18))
        fi

        viewMacList=`cat $DIR/$address | tail -$countEnd`
        echo ""
        echo "Data being pulled from the logs  ..."
        sleep 1
        echo "Showing MAC List"
        echo "$DIR/$viewMacList"
        sleep 2
        ;;

        7)
        echo "*** Search for A Mac-Address *** "
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-Mac-Search_$DATE
        
        mkdir -p $DIR
	echo " "

	echo "Logs being save:$DIR"

	# Input
	echo "*********************************** "
	echo -n "Input Switch IP Address: "
	read address
	echo "Input A Mac-Address of the Machine"
        echo -n "E.g. 11:22:33:44:55:66:77:88): "
	read mac
	echo "*********************************** "

           ./site_2-Sw-Mac-List-Search.exp $address $username $password $mac > $DIR/$address 2>&1
        
        # result
        viewMac=`cat $DIR/$Address | tail -42`
        echo ""
        echo "MAC Address being searched and showing the finding ..."
        sleep 2

        # result
	ref_ip=2.225.72.23     
        countMacList=`cat $DIR/$address | wc -l`
		
        if [ $address == $ref_ip ]
        then
           countEnd=$(($countMacList - 34))
           else
               countEnd=$(($countMacList - 18))
        fi

        viewMacFound=`cat $DIR/$address | tail -$countEnd`
        echo ""
        echo "$DIR/$viewMacFound"
        sleep 2

        ;;
    
	8)
	echo " *** List of Vlan Ports for All Switches *** "

	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-VlanPortList-All_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"

	# Routine
	
	line=`cat IP-site_2.txt | wc -l`
	echo "Number of Devices: $line"
	
	num=1

	#echo $line
	while [ $num -le $line ]
             do

	     address=`cat IP-site_2.txt | head -$num | tail -1`
                
	     echo "$num.Switch IP: $address ... saved"
             ./site_2-Sw-VlanList.exp $address $username $password > $DIR/$address 2>&1

	     num=$(( $num + 1 ));
	     sleep 1
	     done

        echo "Listing Vlan Ports ... DONE!"
	echo ""
	sleep 3     	
        ;;
    
	9)
	echo " *** List Vlan Port for Individual Switch *** "
        
	DATE=`date +%F`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-Sw-VlanPortList-Indv_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being saved: $DIR"
          
        # Input
	echo "********************************** "
	echo "Input Switch IP Address: "
	read address
	echo "********************************** "
            ./site_2-Sw-VlanList.exp $address $username $password > $DIR/$address 2>&1

        echo "Listing Vlan Ports ... DONE!"
	echo ""
	sleep 3     	
        ;;
	
	c)
	echo " *** Config From Standard Port to NAC Port @Switch Port *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-logsw-config_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored: $DIR"
	
        # Input
	echo "************************************ "
	echo -n "Input Switch IP Address:" 
	read address
	echo -n "Input A Switch Port [E.g. 1/20]: " 
	read port
	echo "************************************ "

           ./site_2-NAC-ConfigSw.exp $address $username $password $port > $DIR/$address 2>&1
	
	echo "Config From Standard Port to NAC Port @Switch Port ... DONE!"
	sleep 3	
	;;


	cx)
	echo " *** Config From Standard Port to NAC Port @Switch for List of Ports *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-logsw-config-ext_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored: $DIR"
	echo " "

        # Input
	# 1-read file
	FILE=IP-NAC-config.txt
	if [ ! -f $FILE ]
	then 
	   echo "Ensure IP-NAC-config.txt exists in /script directory"
	   sleep 5
	else
	   echo "File Found, waiting for configuration"
	   echo "*************************************"
	   address=`cat $FILE | head -1`
	   
	   echo "Switch IP is $address"
	   count=`cat $FILE | wc -l`
	
	   counter=$(($count-1))
	   echo "Number of Ports: $counter"
           
 	   #portlist=`cat $FILE | tail -$counter` > tmp/ports
	   
	   echo "Start Configuring $counter Ports in Sw: $address" 	
           echo ""	
	   sleep 3
	
	   # Loop
	   for (( i=$counter; i>=1; i--))
	   	do
		   port=`cat $FILE | tail -$i | head -1` 
	     	   #echo "number-$i:  port: $port"
	     	   
          ./site_2-NAC-ConfigSw.exp $address $username $password $port > $DIR/$address 2>&1

	  echo "Port: $port ... configured"
	  sleep 1
	  done
	  echo "NAC config ports completed !" 
	  sleep 3
	fi
	;;


    
	r)
	echo " *** Revert-Config From NAC To Standard Switch Port *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-logsw-Revert_$DATE

	mkdir -p $DIR
	echo " "

	echo "Logs being stored: $DIR"
          
        # Input
	echo "***************************************************** "
	echo -n "Input Switch IP Address: " 
	read address
	echo -n "Input A Switch Port [E.g. 1/20]: " 
	read port
	echo "*[Note: User @12&04 Floor is 21 and User @13F is 22]*" 
	echo -n "Input User Vlan [e.g. 21 or 22]: " 
	read vlan
	echo "***************************************************** "

         ./site_2-NAC-ConfigSw-Revert.exp $address $username $password $port $vlan > $DIR/$address 2>&1		

	echo "NAC port reverted to the normal port ...DONE!"
	echo "The config logs are here: $DIR"
	sleep 3
	echo ""
        ;;
    
	v)
	echo " *** Verify the current Switch Port *** "
        
	DATE=`date +%F_%H%M`
	MONTH=`date +%b-%y`
	DIR=~/script/logs/site_2-NAC-Sw/$MONTH/site_2-NAC-logsw-VerifyPort_$DATE

	mkdir -p $DIR
	echo " "

	echo "The log details here: $DIR"
          
        # Input
	echo "******************************************* "
	echo -n "Input Switch IP Address: " 
	read address

	echo -n "Input A Switch Port [e.g. 1/20]: " 
	read port
	echo "******************************************* "

        ./site_2-NAC-ConfigSw-VerifyPort.exp $address $username $password $port > $DIR/$address 2>&1
	
	# result
	ref_ip=2.2.2.23
        countNACAuth=`cat $DIR/$address | wc -l`

        if [ $address == $ref_ip ]
        then
           countEnd=$(($countNACAuth - 30))
           else
               countEnd=$(($countNACAuth - 14))
        fi

        viewNACAuth=`cat $DIR/$address | tail -$countEnd`
        echo ""
        echo "Data being pulled from the logs ..."
        sleep 1
        echo "Verifying Port being configured"
	echo "********************************"
	echo ""
        echo "$DIR/$viewNACAuth"
        sleep 7

        ;;
	
        b)
        echo "Back to Previous Menu ..."
           sleep 1
           ./Menu-site_2-NAC.sh
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

done
