sudo apt -y update && sudo apt -y upgrade
sudo apt -y install make cmake git mc curl

wget p.kmuk.lt/pi/_i_*.sh

wget p.kmuk.lt/pi/_i_webmin.sh
wget p.kmuk.lt/pi/_i_airvpn.sh
wget p.kmuk.lt/pi/_i_samba.sh
wget p.kmuk.lt/pi/_i_torrent.sh
wget p.kmuk.lt/pi/_i_lamp.sh

chmod +x _i_*.sh

# bash _i_webmin.sh
# bash _i_airvpn.sh
# bash _i_samba.sh
# bash _i_torrent.sh
# bash _i_lamp.sh
