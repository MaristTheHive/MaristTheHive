# Deploying an Ubuntu SSH Honeypot

### Requirements
* Ubuntu Server 14.04 LTS or later version
* Packages:
	* <code>wget</code>
	* <code>make</code>
	* <code>zlib1g-dev</code>
	* <code>libssl-dev</code>
	* <code>policycoreutils</code>
	> NOTE: Wait until the <code>Steps</code> section to download OpenSSH from the link below
	* OpenSSH Version from <code>http://www.openssh.com/portable.html#ftp</code>
	
### Steps
1. Deploy Ubuntu Server
	* Go through typical setup
	* Provide at least <code>2 GB</code> or RAM and <code>2 Cores</code>
	* When setting up Ubuntu make sure to download <code>OpenSSH-Server</code>: It should look like this--> <code>[*]OpenSSH-Server</code>
2. Log into the server IP through the console on vSphere or SSH Client
3. Change SSH Port
	* <code>vi /etc/ssh/sshd_config</code>
	* Change the <code>Port</code> number to the desired high port number (i.e. 48001)
	* <code>:wq</code> the file
	* <code>service ssh restart</code>
4. Set up directories:
	* <code>mkdir -p /usr/local/source/openssh</code>
	* <code>cd /usr/local/source/openssh</code>
	* <code>mkdir openssh-22</code>
	* <code>mkdir openssh-2222</code>
5. Download OpenSSH 
	* <code>cd openssh-22</code>
	* <code>wget  ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz</code>
	* <code>tar -xf openssh-7.2p1.tar.gz</code>
	* <code>mv openssh-7.2p1 openssh-7.2p1-22</code>
> NOTE: you should change <code>openssh-7.2p1.tar.gz</code> depending on what version you want to use.
6. Modify OpenSSH with Tailored Code for Port 22
	* <code>cd openssh-7.2p1-22</code> //Or whatever version you are using
	* <code>mv auth-passwd.c auth-passwd.c.orig</code>
	* <code>mv sshd.c sshd.c.orig</code>
	* <code>mv auth2-pubkey.c auth2-pubkey.c.orig</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/auth-passwd.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/sshd.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/auth2-pubkey.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/sshd_config-22</code>
	* Verify that the files that you downloaded are all there
	* <code>cp sshd_config-22 /usr/local/etc</code>
	* <code>./configure</code>
	* <code>make</code>
	* <code>make install</code>
	* <code>cp sshd /usr/local/sbin/sshd-22</code>
	* <code>chmod a+rx sshd /usr/local/sbin/sshd-22</code>
	* <code>cd ..</code>
> NOTE: You should now be in the <code>/usr/local/source/openssh/openssh-22</code> directory
7. Modify OpenSSH with Tailored Code for Port 2222
	* <code>cd /usr/local/source/openssh</code>
	* <code>cd openssh-2222</code>
	* <code>wget  ftp://ftp4.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.2p1.tar.gz</code> (Depending on which version you are using).
	* <code>tar -xf openssh-7.2p1.tar.gz</code>
	* <code>mv openssh-7.2p1 openssh-7.2p1-2222</code>
	* <code>cd openssh-7.2p1-2222</code>
	* <code>mv auth-passwd.c auth-passwd.c.orig</code>
	* <code>mv sshd.c sshd.c.orig</code>
	* <code>mv auth2-pubkey.c auth2-pubkey.c.orig</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/auth-passwd-2222.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/sshd.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/auth2-pubkey-2222.c</code>
	* <code>wget https://raw.githubusercontent.com/wedaa/LongTail-Openssh-honeypot-v2/master/sshd_config-2222</code>
	* <code>cp auth-passwd-2222.c auth-passwd.c</code>
	* <code>cp auth2-pubkey-2222.c auth2-pubkey.c</code>
	* <code>cp sshd_config-2222 /usr/local/etc</code>
	* <code>./configure</code>
	* <code>make</code>
	* <code>cp sshd /usr/local/sbin/sshd-2222</code>
	* <code>chmod a+rx sshd /usr/local/sbin/sshd-2222</code>
	* <code>cd ..</code>
8. Finalize Modifications
	* <code>echo "/usr/local/sbin/sshd-22 -f /usr/local/etc/sshd_config-22 " >> /etc/rc.local</code>
	* <code>echo "/usr/local/sbin/sshd-2222 -f /usr/local/etc/sshd_config-2222 " >> /etc/rc.local</code>
	* <code>/usr/local/sbin/sshd-22 -f /usr/local/etc/sshd_config-22</code>
	* <code>/usr/local/sbin/sshd-2222 -f /usr/local/etc/sshd_config-2222</code>