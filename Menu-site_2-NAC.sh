#!/bin/bash

clear

#Filename: Menu-site_2-NAC.sh

#######################################
#   Welcome  to  NetworX Management   #
#     ** NAC Tool Diagnostics  **     #
#            Site : site_2            #
#       Developed by sm@Devel         #   
#######################################

# Functions # 

#  *** Function:Switch Diagnostics ***
switch_diagnostics ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_2-NAC-Sw.sh script
./Menu-site_2-NAC-Sw.sh
echo ""
echo "Switch NAC diagnostics done ..."
echo ""
echo "----000----"
echo ""
}

# *** Function:Aruba Diagnostics ***
aruba_diagnostics ()
{
echo ""
echo "-- ################################## --"
echo ""

# Call Menu-site_2-NAC-Aruba.sh script
./Menu-site_2-NAC-Aruba.sh
echo ""
echo "Aruba NAC diagnostics done ..."
echo ""
echo "----000----"
}


# Function: Others
Other_diagnostics ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call site_2-NAC-Others.sh script
   #site_2-NAC-Others.exp
echo ""
echo "This service Not Available at this release ..."
echo ""
echo "----000----"
sleep 3
}

# Function: Monitoring
monitoring ()
{
echo ""
echo "-- ################################# --"
echo ""

# Call site_2-NAC-Others.sh script
  # site_2-NAC-Others.exp
echo ""
echo "This service Not Available at this release ..."
echo ""
}
#end of function

clear 

show_menu ()
{
echo ""
echo "#######################################"
echo "#   Welcome  to  NetworX Management   #"
echo "#    ** NAC Tool Diagnostics  **      #"
echo "#            Site: site_2             #"
echo "#######################################"
echo ""
echo "------- MENU --------"
echo -n "Please Select Options:  "
echo "" 
echo "[1] Switch Diagnostics " 
echo "" 
echo "[2] Aruba Diagnostics " 
echo "" 
echo "[m] Monitoring" 
echo "" 
echo "[b] Back to Previous Menu"
echo "[h] Back to Main Menu" 
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
         #echo "backup Switch"
         switch_diagnostics
         ;;
         2)
         #echo "backup Firewall"
         aruba_diagnostics
         ;;
         3)
         #echo Other Diagnostics"
         Other_diagnostics
         ;; 
         m)
         #echo "Config"
         monitoring 
         ;;
         b)
         echo "back to Main Menu ..."
         ./Menu-site_2.sh 
         ;; 
         h)
         echo "back to Main Menu ..."
         ./Menu.AFM.sh 
         ;; 
         *)
         echo "" 
         echo "You press wrong choice, Please try again"
         echo "" 
         ;; 
    esac
done
