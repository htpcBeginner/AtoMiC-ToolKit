#!/bin/bash
# Script Name: AtoMiC Access Switch
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
source $SCRIPTPATH/inc/commons.sh
source $SCRIPTPATH/inc/header.sh

echo -e $GREEN'AtoMiC '$APPTITLE' Access Fix'$ENDCOLOR

source $SCRIPTPATH/inc/pause.sh

if [ ! -f $APPSETTINGS ]; then
	echo -e $RED $APPSETTINGS 'Doesnt exist please open '$APPNAME', and try saving the config first else you may need to reinstall '$ENDCOLOR
else

  echo 
  sleep 2
  source $SCRIPTPATH/inc/app-stop.sh
  sleep 2
  echo

  if grep -Fxq "${ACCESSPORT}localhost" $APPSETTINGS
  then
    echo -e $YELLOW'--->Making '$APPTITLE' accessible from network...'$ENDCOLOR
    sudo sed -i "s@${ACCESSPORT}localhost@${ACCESSPORT}0.0.0.0@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSPORT' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
  else
    echo -e $YELLOW'--->Making '$APPTITLE' only accessible from localhost...'$ENDCOLOR
    sudo sed -i "s@${ACCESSPORT}0.0.0.0@${ACCESSPORT}localhost@g" $APPSETTINGS  || { echo -e $RED'Modifying '$ACCESSPORT' in '$APPSETTINGS' file failed.'$ENDCOLOR; exit 1; }
  fi

  sleep 2
  source $SCRIPTPATH/inc/app-start.sh
  sleep 2
  echo
  echo -e $GREEN'--->All done. '$APPTITLE' access switch complete.'$ENDCOLOR
fi

source $SCRIPTPATH/inc/thankyou.sh
source $SCRIPTPATH/inc/exit.sh