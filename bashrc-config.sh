#!/bin/bash/sh
#################
# Requires: Ubuntu distribution - This should work fine on versions 16.04 and below...	
#  
# A personal script to add some lovely bits and bobs to my .bashrc file. 
# This can obviously work for you too but make sure you check the BashRC.txt file and make any changes you require as lots of these are personal to myself. 
# This is mainly aimed at Ubuntu distributions however soon I will modify a checking system and seperate files based apon said check.
#
# UPDATED - 22/11/2016
# AURTHOR - Josh (JoshTickles) 
#
#
############# 

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


DoTheThing()
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
 	echo ./Ubuntu-BashRC.txt >> $save
	sleep 3
 	echo "Configuration has been added... You must exit your session for these to take effect."
}
#------------------------------------------------ START
WhichDistAmI
AmIroot
DoTheThing
