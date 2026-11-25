#!/usr/bin/env bash

#Sect1:

display_usage() {
	cat << END
usage:	./kali_audit.sh <username>
	./kali_audit.sh help

 This script checks system privileges, searches for a target user account, 
 runs a quick interactive challenge, and records the audit results.
	Enter Username Arguement.
END
}


#Functions - All Functions:

root_privcheck() {                                                               
        if [ "$UID" -eq 0 ];
	then                                                                             	echo "Active User: $USER, Hostname: $HOSTNAME" >> audit_log.txt                          
        echo "Script Was Executed With ROOT Privileges, so ..."                  
      	echo "You have ROOT Privileges." >> audit_log.txt                         
		
elif [ "$UID" -gt 0 ];
then 
	echo "Active User: $USER, Hostname: $HOSTNAME" >> audit_log.txt 

	echo "You have Standard User Privileges, buddy."

	echo "You have Standard User Privileges, buddy." >> audit_log.txt                        
else
	echo "FuckOff! - !?an error?! (Probably from u bud)"
fi      

}

userdir_audit() {
if [ "$1" = "root" ] && [ -d "/root" ];
then
	echo "Account Exists, Home/Root Directory Exists:                              	 	/home/ , /root"
	echo "Account Exists, Home Directory Exists:
		/home/ , /root" >> audit_log.txt
elif 	grep -q "^$1:" /etc/passwd && [ -d "/home/$1" ];
then
	echo "Account Exists, Home Directory Exists:
	      /home/$1"
elif	grep -q "^$1:" /etc/passwd || [ -d "/home/$1" ];
then
	echo "HAHA, You Don't Have A Home Directory!" 
	echo "HAHA, You Don't Have A Home Directory!" >> audit_log.txt
else
	echo "Error, Perhaps you're slow, ? !"
fi

}

gen_num() {
	 i=$(( RANDOM % 10 + 1))
	 

	 read -p "Guess a number 1 - 10: " number 

while [ "$number" -ne "$i" ];
do
	read -p "Guess a number 1 - 10: " number		
if ! [[ "$number" =~ ^[0-9]+$ ]];
then
	echo "Guess, 1 - 10! : "
	number=0
	continue
fi

if [ "$number" -eq "$i" ]; 
then
	echo "Correct!"
	echo "To Play again, re-run the script"
	echo "
	Otherwise, You can Fuck Off! now"
elif [ "$number" -gt $i ]
	then
		echo "The Correct Answer Is Below Your Guess"
	elif [ "$number" -lt "$i" ]
	then
		echo "The Correct Answer Is Above Your Guess"
	else 
		echo "Fuck Off!"
fi
done

}
		
#Combining All - Sects  - 'main ()'

if [ "$#" -ne 1 ] || [ "$1" = "help" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ];
then
	display_usage
exit 1

fi

if grep -q "^$1:" /etc/passwd; 
then
	echo "$1 found in /etc/passwd !"
else 
	echo "$1 NOT found in /etc/passwd !"

fi	

	echo "Verifying Your Privileges..."
	sleep 1
	root_privcheck
	sleep 3

	echo "Continue to User / Directory Audit?:" 	
	read -p " Y/N?: " answer

if [ "$answer" = "Y" ] || [ "$answer" = "y" ];
then
	echo "Running User & Directory Audit..."
	sleep 2
	userdir_audit "$1"
	sleep 4
	echo "Everything done, see .txt audit_log                                 "
	sleep 2
	echo "Let's Play a little game..."
	gen_num
else 
	echo "You're done here, I guess"
fi
# # END OF SCRIPT # #
