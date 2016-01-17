#!/bin/bash
# Script Name: AtoMiC ToolKit
# Author: htpcBeginner
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)
#

# DO NOT EDIT ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING.

# Set caller id and script path
export CALLER=$(ps ax | grep "^ *$PPID" | awk '{print $NF}')
export SCRIPTPATH=$(pwd)

cd $SCRIPTPATH
source inc/commons.sh

# Check if being run as root
if [ "$EUID" -ne 0 ]
  then 
  echo
  echo -e $RED'Please run as root using the command: '$ENDCOLOR'sudo bash setup.sh'
  echo
  exit 0
fi

source inc/header.sh

echo 'PWD '$(pwd)
echo 'SCRIPTPATH '$SCRIPTPATH
echo '2 '$2

source inc/consent.sh

source inc/usercheck.sh

sudo chmod -R 775 * >/dev/null 2>&1

echo -e $GREEN'AtoMiC ToolKit - HTPC / Home Server Setup Script'$ENDCOLOR
echo 
echo -e 'NOTE: At this point, this script has only been confirmed to work on Ubuntu variants.'
echo
echo -e $YELLOW'01. '$ENDCOLOR'Check and Update AtoMiC ToolKit'
echo -e $YELLOW'02. '$ENDCOLOR'Install .bash_aliases HTPC / Home Server administration'
echo -e $YELLOW'05. '$ENDCOLOR'Sick Beard - Install'
echo -e $YELLOW'06. '$ENDCOLOR'Sick Beard - Uninstall'
echo -e $YELLOW'07. '$ENDCOLOR'Sick Beard - Backup Database and Settings'
echo -e $YELLOW'08. '$ENDCOLOR'Sick Beard - Restore Database and Settings'
echo -e $YELLOW'10. '$ENDCOLOR'SickRage - Install'
echo -e $YELLOW'11. '$ENDCOLOR'SickRage - Uninstall'
echo -e $YELLOW'12. '$ENDCOLOR'SickRage - Backup Database and Settings'
echo -e $YELLOW'13. '$ENDCOLOR'SickRage - Restore Database and Settings'
echo -e $YELLOW'15. '$ENDCOLOR'SickGear - Install'
echo -e $YELLOW'16. '$ENDCOLOR'SickGear - Uninstall'
echo -e $YELLOW'17. '$ENDCOLOR'SickGear - Backup Database and Settings'
echo -e $YELLOW'18. '$ENDCOLOR'SickGear - Restore Database and Settings'
echo -e $YELLOW'20. '$ENDCOLOR'Sonarr (NzbDrone) - Install'
echo -e $YELLOW'21. '$ENDCOLOR'Sonarr (NzbDrone) - Uninstall'
echo -e $YELLOW'25. '$ENDCOLOR'CouchPotato - Install'
echo -e $YELLOW'26. '$ENDCOLOR'CouchPotato - Uninstall'
echo -e $YELLOW'27. '$ENDCOLOR'CouchPotato - Backup Database and Settings'
echo -e $YELLOW'28. '$ENDCOLOR'CouchPotato - Restore Database and Settings'
echo -e $YELLOW'30. '$ENDCOLOR'Transmission - Install (WebUI only, no Desktop GUI) (Broken)'
echo -e $YELLOW'31. '$ENDCOLOR'Transmission - Uninstall'
echo -e $YELLOW'35. '$ENDCOLOR'qBittorrent - Install (WebUI only, no Desktop GUI)'
echo -e $YELLOW'36. '$ENDCOLOR'qBittorrent - Uninstall'
echo -e $YELLOW'40. '$ENDCOLOR'SABNzbd - Install'
echo -e $YELLOW'41. '$ENDCOLOR'SABNzbd - Uninstall'
echo -e $YELLOW'45. '$ENDCOLOR'Headphones - Install'
echo -e $YELLOW'46. '$ENDCOLOR'Headphones - Uninstall'
echo -e $YELLOW'50. '$ENDCOLOR'Mylar - Install'
echo -e $YELLOW'51. '$ENDCOLOR'Mylar - Uninstall'
echo -e $YELLOW'55. '$ENDCOLOR'HTPC Manager - Install'
echo -e $YELLOW'56. '$ENDCOLOR'HTPC Manager - Uninstall'
echo -e $YELLOW'60. '$ENDCOLOR'Plex Server - Install'
echo -e $YELLOW'65. '$ENDCOLOR'Deluge - Install (In Progress)'
echo -e $YELLOW'70. '$ENDCOLOR'MusicBrainz - Install (In Progress)'
echo -e $YELLOW'75. '$ENDCOLOR'Webmin - Install'
echo -e $YELLOW'98. '$ENDCOLOR'See default port numbers, usernames, and passwords'
echo -e $YELLOW'99. '$ENDCOLOR'Exit'

echo
echo -n "What would you like to do [00-99]: "
read option
case $option in
	1 | 01)
		sudo bash update.sh "$CALLER" "$SCRIPTPATH"
		;;
	2 | 02)
         	sudo bash system/bash_aliases-installer.sh "$CALLER" "$SCRIPTPATH"
		;;
		
    5 | 05)
		sudo bash sickbeard/sickbeard-installer.sh "$CALLER" "$SCRIPTPATH"
		;;
    6 | 06) 
    		sudo bash sickbeard/sickbeard-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    7 | 07)
    		sudo bash sickbeard/sickbeard-backup.sh "$CALLER" "$SCRIPTPATH"
    		;;
	8 | 08)
    		sudo bash sickbeard/sickbeard-restore.sh "$CALLER" "$SCRIPTPATH"
    		;;
    	
    10)
    		sudo bash sickrage/sickrage-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    11)
    		sudo bash sickrage/sickrage-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    12)
    		sudo bash sickrage/sickrage-backup.sh "$CALLER" "$SCRIPTPATH"
    		;;
    13)
    		sudo bash sickrage/sickrage-restore.sh "$CALLER" "$SCRIPTPATH"
    		;;
			
    15)
    		sudo bash sickgear/sickgear-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    16)
    		sudo bash sickgear/sickgear-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    17)
    		sudo bash sickgear/sickgear-backup.sh "$CALLER" "$SCRIPTPATH"
    		;;
    18)
    		sudo bash sickgear/sickgear-restore.sh "$CALLER" "$SCRIPTPATH"
    		;;
			
    20)
    		sudo bash sonarr/sonarr-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    21)
    		sudo bash sonarr/sonarr-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
			
    25)
    		sudo bash couchpotato/couchpotato-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    26) 
    		sudo bash couchpotato/couchpotato-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    27)
    		sudo bash couchpotato/couchpotato-backup.sh "$CALLER" "$SCRIPTPATH"
    		;;
    28) 
    		sudo bash couchpotato/couchpotato-restore.sh "$CALLER" "$SCRIPTPATH"
    		;;
			
    30)
    		sudo bash transmission/transmission-webui-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    31)
    		sudo bash transmission/transmission-webui-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    		
	35)
			sudo bash qbittorrent/qbittorrent-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    36)
    		sudo bash qbittorrent/qbittorrent-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    		
	40)
    		sudo bash sabnzbd/sabnzbd-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
	41)
    		sudo bash sabnzbd/sabnzbd-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;

	45)
    		sudo bash headphones/headphones-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
	46)
    		sudo bash headphones/headphones-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
    
	50)
    		sudo bash mylar/mylar-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
	51)
    		sudo bash mylar/mylar-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;
			
	55)
    		sudo bash htpcmanager/htpcmanager-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
	56)
    		sudo bash htpcmanager/htpcmanager-uninstaller.sh "$CALLER" "$SCRIPTPATH"
    		;;

	60)
    		sudo bash plex/plex-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;

	65)
    		sudo bash deluge/deluge-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;

	70)
    		sudo bash musicbrainz/musicbrainz-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    	
    	75)
    		sudo bash webmin/webmin-installer.sh "$CALLER" "$SCRIPTPATH"
    		;;
    		
    98)
    		sudo bash defaults.sh "$CALLER" "$SCRIPTPATH"
    	;;
    99)
		echo 'Exiting...'
		
		source inc/thankyou.sh
		
		sleep 2
		#URL=http://www.htpcbeginner.com/atomic-thanks
		#[[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
		#path=$(which xdg-open || which gnome-open) && exec "$path" "$URL" >/dev/null 2>&1
		;;
    	*)
        	echo -e $RED'Invalid Option'$ENDCOLOR
		ScriptLoc=$(readlink -f "$0")
		sleep 1
		exec $ScriptLoc
esac
