#! /bin/bash
#
# Coded By N4ND4
#
# Telegram - https://t.me/n4vpn
#
# Auto installer script for 
# dropbear
#
#

clear
cd /tmp
echo " Dropbear One Click Auto Script By N4 "
echo "================================================="
echo "" 
echo "Starting Installation N4 Dropbear ..."
apt-get update  > /dev/null 2>&1
echo ""
echo "NOW Installation N4 Dropbear"
echo ""
apt-get -y install dropbear ssh
sed -i 's/NO_START\=1/NO_START\=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT\=443/DROPBEAR_PORT\=22/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS\=/DROPBEAR_EXTRA_ARGS\=\"\-p 443 \-p 8 \-p 88 \-p 84 \-p 143 \-p 11\"/g' /etc/default/dropbear
sed -i 's/#PermitRootLogin prohibit\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without\-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl enable sshd
systemctl restart sshd
service restart dropbear
echo ""
echo ""
echo "Successfully Installed N4 Dropbear"
echo "Listening Dropbear ports: 443, 8, 88, 84, 143, 110"
echo "Script By N4ND4"
echo ""
echo " Server Restarting Now...."
echo ""
sleep 5 ; reboot
