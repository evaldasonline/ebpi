#----------------------------------------------------------------------------------
# AIRVPN ---------------------------------------------------------------------------

sudo apt -y install openvpn
sudo apt -y install sendemail
sudo apt install libio-socket-ssl-perl libnet-ssleay-perl net-tools

# !!!  must acuire  AirVPN.tar.gz -
tar xvzf ~/AirVPN.tar.gz
sudo cp AirVPN_Netherlands_UDP-443.ovpn /etc/openvpn/auto.ovpn
sudo  ln -s /etc/openvpn/auto.ovpn /etc/openvpn/auto.conf

echo sudo nohup openvpn /etc/openvpn/auto.ovpn \& > ~/start-vpn
echo curl 'https://api.ipify.org?format=json' >> ~/start-vpn
echo \# xxxxxx   add static routes to local DNS if needed >> ~/start-vpn
chmod +x ~/start-vpn
echo curl -k 'https://api.ipify.org?format=json' >> ~/myip
chmod +x ~/myip


sudo systemctl enable openvpn.service
sudo systemctl start openvpn.service


cat /proc/sys/net/ipv4/ip_forward
sudo bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
cat /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
sudo sysctl net.ipv4.ip_forward
sudo bash -c 'echo net.ipv4.ip_forward=1  >> /etc/sysctl.conf'
sudo sysctl -p

sudo cp ./script/vpn.sh /etc/init.d/vpn.sh
sudo chmod +x /etc/init.d/vpn.sh
sudo ln -s /etc/init.d/vpn.sh ~/vpn.sh

#########################
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo iptables -I  FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables-save > /etc/iptables.save
sudo rm ~/iptables.save
sudo ln -s /etc/iptables.save ~/iptables.save

#############################
sudo cp -f ./script/delay-send /etc/openvpn/delay-send
sudo chmod +x /etc/openvpn/delay-send

sudo systemctl status openvpn.service
~/vpn.sh start
