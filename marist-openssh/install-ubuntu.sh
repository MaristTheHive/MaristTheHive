#!/bin/bash

#################################################################################################
#                           MARIST SSH HONEYPOT INSTALL SCRIPT v0.1                             #
#                             MARIST COLLEGE NETWORKING DEPARTMENT                              #
#################################################################################################


############################## Initializing Global Variables#####################################

STARTING_DIRECTORY=$(pwd)
echo $STARTING_DIRECTORY
CURRENT_SSH_PORT=$(grep -Eo 'Port *[0-9]+' /etc/ssh/sshd_config | grep -o '[0-9]*')
MOD_SSH_DIR=
MOD_SSH_22_DIR=
MOD_SSH_2222_DIR=
IS_RUNNING=true

# ASCII Art Variables
BLACK='\e[0;30m'     
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m' 
BLUE='\e[0;34m' 
PURPLE='\e[0;35m' 
CYAN='\e[0;36m' 
WHITE='\e[0;37m'
RESET='\e[0m'

#################################################################################################

# Check if user is root
if [ "$EUID" -ne 0 ]
then 
	echo -e "${RED}Please run as root${RESET}"
	exit 1
fi

# Display Title Screen
function display_intro {
	cat<<EOF

                              /\      /\

                              |\\____//|

                              (|/    \/ )

                              / (    ) \
                              
                ${RED}|||||||${RESET}\\\  )   %)  (%   (  ///${RED}|||||||
                ||           ${RESET})  \\  |/  (           ${RED}||
                ||            ${RESET})  \\ |/  (           ${RED}||
                 ||           ${RESET}/-- \@)--\         ${RED}||
                 ||       |              |       ||
                ||         ||            ||         ||
                ||         |||          |||         ||
                ||         ||||        ||||         ||
                |||||||||||||  \|    |/  |||||||||||||${RESET}

EOF

}

# Install dependencies 
function install_dependencies {
	echo "Installing dependencies..."
	apt-get update
	apt-get install wget make zlib1g-dev libssl-dev policycoreutils
}

# Create directory structure
function create_dir {
	mkdir -p /usr/local/source/openssh
	mkdir /usr/local/source/openssh/openssh-22
	mkdir /usr/local/source/openssh/openssh-2222
	MOD_SSH_DIR="/usr/local/source/openssh"
	MOD_SSH_22_DIR="/usr/local/source/openssh/openssh-22"
	MOD_SSH_2222_DIR="/usr/local/source/openssh/openssh-2222"
	echo "Created ${MOD_SSH_DIR};${MOD_SSH_22_DIR};${MOD_SSH_2222_DIR}"
}

# Function to tailor OpenSSH 22
function configure_ssh_22 {
	# Downloading OpenSSH
	wget -P ${MOD_SSH_22_DIR} ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz
	cd ${MOD_SSH_22_DIR}
	tar -xf ${MOD_SSH_22_DIR}/openssh-7.2p1.tar.gz 
	mv ${MOD_SSH_22_DIR}/openssh-7.2p1 ${MOD_SSH_22_DIR}/openssh-7.2p1-22
	
	# Copying original files
	mv ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth-passwd.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth-passwd.c.orig
	mv ${MOD_SSH_22_DIR}/openssh-7.2p1-22/sshd.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/sshd.c.orig
	mv ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth2-pubkey.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth2-pubkey.c.orig
	
	# Tailoring SSH to take down password for Port 22
	echo "Copying SSH files..."
	cp ${STARTING_DIRECTORY}/auth-passwd.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth-passwd.c
	cp ${STARTING_DIRECTORY}/sshd.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/sshd.c
	cp ${STARTING_DIRECTORY}/auth2-pubkey.c ${MOD_SSH_22_DIR}/openssh-7.2p1-22/auth2-pubkey.c
	cp ${STARTING_DIRECTORY}/sshd_config-22 /usr/local/etc/sshd_config-22
	
	echo "Compiling & nstalling SSH..."
	cd ${MOD_SSH_22_DIR}/openssh-7.2p1-22
	./configure
	make
	make install
	cp sshd /usr/local/sbin/sshd-22
	chmod a+rx sshd /usr/local/sbin/sshd-22
}

# Function to tailor OpenSSH 2222
function configure_ssh_2222 {
	# Downloading OpenSSH
	wget -P ${MOD_SSH_2222_DIR} ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz
	cd ${MOD_SSH_2222_DIR}
	tar -xf ${MOD_SSH_2222_DIR}/openssh-7.2p1.tar.gz
	mv ${MOD_SSH_2222_DIR}/openssh-7.2p1 ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222
	
	# Copying original files
	mv ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth-passwd.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth-passwd.c.orig
	mv ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/sshd.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/sshd.c.orig
	mv ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth2-pubkey.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth2-pubkey.c.orig
	
	# Tailoring SSH to take down password for Port 2222
	echo "Copying SSH-2222 files..."
	echo "${STARTING_DIRECTORY} "
	cp ${STARTING_DIRECTORY}/auth-passwd-2222.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth-passwd.c
	cp ${STARTING_DIRECTORY}/sshd.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/sshd.c
	cp ${STARTING_DIRECTORY}/auth2-pubkey-2222.c ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222/auth2-pubkey.c
	cp ${STARTING_DIRECTORY}/sshd_config-2222 /usr/local/etc/sshd_config-2222
	
	echo "Compiling & installing SSH-2222..."
	cd ${MOD_SSH_2222_DIR}/openssh-7.2p1-2222
	./configure
	make
	cp sshd /usr/local/sbin/sshd-2222
	chmod a+rx sshd /usr/local/sbin/sshd-2222
}

# Finalizing configurations
function finalize_configuration {
	# Finalizing Modifications
	echo "/usr/local/sbin/sshd-22 -f /usr/local/etc/sshd_config-22 " >> /etc/rc.local
	echo "/usr/local/sbin/sshd-2222 -f /usr/local/etc/sshd_config-2222 " >> /etc/rc.local
	
	cd $STARTING_DIRECTORY
}

# Running the script 
display_intro
while [ $IS_RUNNING ]
do
	echo -n "Please specify the port that SSH should be changed to (we recommend 48000-65535):"
	read SSH_PORT
	sed -i "0,/RE/s/Port .*/Port ${SSH_PORT}/g" /etc/ssh/sshd_config
	CURRENT_SSH_PORT=$SSH_PORT
	
	if [ "$CURRENT_SSH_PORT" -ne 22 ] || [ "$CURRENT_SSH_PORT" -ne 2222 ]
	then
		service ssh restart
		
		install_dependencies
		create_dir
		configure_ssh_22
		configure_ssh_2222
		finalize_configuration
		IS_RUNNING=false
		break
	fi
done

#################################################################################################

exit