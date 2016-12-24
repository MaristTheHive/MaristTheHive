#!/bin/sh

#################################################################################################
#                                  MARIST SSH HONEYPOT v0.1                                     #
#                             MARIST COLLEGE NETWORKING DEPARTMENT                              #
#################################################################################################
STARTING_DIRECTORY=$(pwd)

# Checking to make sure that SSH port has been
# changed tosomething other than port 22 or 2222
if grep -Fxq "Port 22" /etc/ssh/sshd_config
then
	echo "The SSH Port is stil 22. Please change it to something not commonly used for SSH"
elif grep -Fxq "Port 2222" /etc/ssh/sshd_config
then
	echo "The SSH Port is still 2222. Please change it to something not commonly used for SSH"
else	
	# Downloading dependencies
	sudo apt-get install wget make zlib1g-dev libssl-dev policycoreutils

	# Setting up directories 
	echo "Creating directory /usr/local/source"
	mkdir -p /usr/local/source/openssh
	cd /usr/local/source/openssh
	echo "Creating directories /usr/local/source/openssh/openssh-22 & /usr/local/source/openssh/openssh-2222"
	mkdir openssh-22
	mkdir openssh-2222
	
	# Downloading OpenSSH
	cd openssh-22
	echo "Downloading OpenSSH package..."
	wget ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz
	echo "Extracting OpenSSH package..."
	tar -xf openssh-7.2p1.tar.gz
	mv openssh-7.2p1 openssh-7.2p1-22
	
	# Tailoring SSH to take down password for Port 22
	echo "Modifying for port 22"
	cd openssh-7.2p1-22
	echo "Creating copies of auth-passwd.c, sshd.c, & auth2-pubkey.c"
	mv auth-passwd.c auth-passwd.c.orig
	mv sshd.c sshd.c.orig
	mv auth2-pubkey.c auth2-pubkey.c.orig
	echo "Downloading tailored files from github..."
	cp ${STARTING_DIRECTORY}/auth-passwd.c auth-passwd.c
	cp ${STARTING_DIRECTORY}/sshd.c sshd.c
	cp ${STARTING_DIRECTORY}/auth2-pubkey.c auth2-pubkey.c
	cp ${STARTING_DIRECTORY}/sshd_config-22 /usr/local/etc/sshd_config-22
	echo "Copying sshd_config-22 to /usr/local/etc"
	
	echo "Running ./configure for openssh port 22"
	./configure
	echo "Running make for openssh port 22"
	make 
	echo "Running make install for openssh port 22"
	make install
	
	echo "Copying sshd to /usr/local/sbin/sshd-22"
	cp sshd /usr/local/sbin/sshd-22
	chmod a+rx sshd /usr/local/sbin/sshd-22
	cd ..
	
	# Downloading OpenSSH
	cd /usr/local/source/openssh
	cd openssh-2222
	echo "Downloading OpenSSH package..."
	wget ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz
	echo "Extracting OpenSSH package..."
	tar -xf openssh-7.2p1.tar.gz
	mv openssh-7.2p1 openssh-7.2p1-2222
	
	# Tailoring SSH to take down password for Port 2222
	echo "Modifying for port 2222"
	cd openssh-7.2p1-2222
	echo "Creating copies of auth-passwd.c, sshd.c, & auth2-pubkey.c"
	mv auth-passwd.c auth-passwd.c.orig
	mv sshd.c sshd.c.orig
	mv auth2-pubkey.c auth2-pubkey.c.orig
	echo "Downloading tailored files from github..."
	cp ${STARTING_DIRECTORY}/auth-passwd-2222.c auth-passwd.c
	cp ${STARTING_DIRECTORY}/sshd.c sshd.c
	cp ${STARTING_DIRECTORY}/auth2-pubkey-2222.c auth2-pubkey.c
	cp ${STARTING_DIRECTORY}/sshd_config-2222 /usr/local/etc/sshd_config-2222
	echo "Renaming files to fit ssh program"
	
	echo "Running ./configure for openssh port 2222"
	./configure
	echo "Running make for openssh port 2222"
	make
	
	echo "Copying sshd to /usr/local/sbin/sshd-2222"
	cp sshd /usr/local/sbin/sshd-2222
	chmod a+rx sshd /usr/local/sbin/sshd-2222
	cd ..

	# Finalizing Modifications
	echo "/usr/local/sbin/sshd-22 -f /usr/local/etc/sshd_config-22 " >> /etc/rc.local
	echo "/usr/local/sbin/sshd-2222 -f /usr/local/etc/sshd_config-2222 " >> /etc/rc.local
	/usr/local/sbin/sshd-22 -f /usr/local/etc/sshd_config-22
	/usr/local/sbin/sshd-2222 -f /usr/local/etc/sshd_config-2222
fi