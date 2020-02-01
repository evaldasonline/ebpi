sudo apt -y update && sudo apt -y upgrade
sudo apt -y install make cmake git mc curl htop net-tools

sudo adduser --quiet --disabled-password --shell /bin/bash --home /home/qbtuser --gecos "User" qbtuser
sudo mkdir /home/qbtuser/Downloads
sudo chmod -R 777 /home/qbtuser/Downloads
#echo "qbtuser:newpassword" | chpasswd

echo
echo
echo -----------------------------
echo  To continue, you must acuire  AirVPN.tar.gz - airvpn connection and key File
echo
echo

# bash _i1_webmin.sh
# bash _i2_airvpn.sh
# bash _i3_samba.sh
# bash _i4_torrent.sh
# bash _i5_lamp.sh
