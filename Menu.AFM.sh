#!/bin/bash

clear

########################################
#     Welcome to NetworX Management    #
#        Developed by sm@ADevel        #
#           Version : cc-1.00          #
########################################

# Function # 

#  Function site_1
site_1 ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_1.sh script
./Menu-site_1.sh
echo ""
echo "----000----"
echo ""
}


# Function site_2
site_2 ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_2.sh script
./Menu-site_2.sh
echo ""
echo "----000----"
echo ""
}

# Function site_3
site_3 ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu site_3.sh script
./Menu-site_3.sh
echo ""
echo "----000----"
echo ""
}

# Function site_4
site_4 ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_4.sh script
./Menu-site_4.sh
echo ""
echo "----000----"
echo ""
}


# Function Release Notes
release ()
{

clear
sleep 1
echo ""
echo ""
#./ReleaseNotes.sh
cat ReleaseNotes.txt
echo ""
sleep 3
}

#end of function

clear 

show_menu ()
{
echo ""
echo "########################################"
echo "#   Welcome to  NetworX Management     #"
echo "#        Developed by  sm@Devel       #"
echo "#           Version cc-1.00            #"
echo "########################################"
echo ""
echo "------- MENU --------"
echo -n "Please Select the Site:  "
echo "" 
echo "[1] Site_1" 
echo "" 
echo "[2] Site_2" 
echo "" 
echo "[3] Site_3" 
echo "" 
echo "[4] Site_4" 
echo "" 
echo "[r] Release Notes"
echo "[x] Exit" 
echo "------******-----"
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
         #echo "Site_1"
         site_1
         ;;
         2)
         #echo "Site_2 "
         site_2
         ;;
         3) 
         #echo "Site_3"
         site_3
         ;; 
         4) 
         #echo "Site_4"
         site_4
         ;; 
         r)
         release
         ;; 
         x)
         #echo "Exit ..."
         exit 0
         ;; 
         *)
         echo "" 
         echo "You press wrong choice, Please try again"
         echo "" 
         ;; 
    esac
done  
