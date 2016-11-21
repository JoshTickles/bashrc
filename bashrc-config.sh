#!/bin/bash/sh
#
# Requires Ubuntu distribution - This should work fine on versions 16.04 and below...	
# 
#
currentver="0.62"
currentverdate="1sh July 2016"

WhichDistAmI()
{
	# Check for Ubuntu - This should work fine on versions 16.04 and below...	
	if [ -f "/usr/bin/lsb_release" ];
	then
		ubuntuVersion=`lsb_release -s -d`

		case $ubuntuVersion in
			*"Ubuntu"*)
				OS="Ubuntu"
				export OS
			;;

			*)
				echo -e "Script is for Ubuntu OS only. Exiting."
				exit 1
			;;
		esac
	fi
}

AmIroot()
{
	# Check for root, quit if not present with a warning.
	if [ "$(id -u)" != "0" ];
	then
		echo "\nScript needs to be run as root. Please elevate and run again!"
		exit 1
	else
		echo "\nScript running as root. Starting..."
	fi
	}


WhichUser()
{ 
	# Ask which user .bashrc to append
 	echo "Please enter your account username: "
		read Username
	echo "You entered: $Username"
	sleep 3
	echo "Applying configuration to $Username's .bashrc..."
 	sleep 3
 		save="/home/$Username/.bashrc"
 	echo "" >> $save #Create New line in .bash_aliases
 	echo ./bashrc.txt >> $save
	sleep 3
 	echo "Configuration has been added... You must exit your session for these to take effect."
	
	}
