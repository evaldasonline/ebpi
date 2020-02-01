#----------------------------------------------------------------------------------
#TORRENT ---------------------------------------------------------------------------
cd ~
sudo apt-get -y update && sudo apt-get -y install qbittorrent-nox
sudo cp ./script/qbittorrent.service /etc/systemd/system/qbittorrent.service


#start to accept license agreements
echo ------------------
echo exit with ctrl+C   return to your user
sudo runuser -l  qbtuser -c 'echo y | qbittorrent-nox'

#sudo usermod -s /usr/sbin/nologin qbtuser

sudo systemctl daemon-reload
sudo systemctl start qbittorrent
sudo systemctl enable qbittorrent

sudo systemctl status qbittorrent

# http://ip-of-server:8080
sudo systemctl start qbittorrent
sudo systemctl status qbittorrent
