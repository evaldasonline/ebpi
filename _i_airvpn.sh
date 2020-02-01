#----------------------------------------------------------------------------------
# AIRVPN ---------------------------------------------------------------------------
cd ~
wget p.kmuk.lt/pi/AirVPN.tar.gz

sudo apt -y install openvpn
tar xvzf AirVPN.tar.gz
sudo cp ~/AirVPN_Netherlands_UDP-443.ovpn /etc/openvpn/auto.ovpn
sudo  ln -s /etc/openvpn/auto.ovpn /etc/openvpn/auto.conf

#sudo nohup openvpn AirVPN_Netherlands_UDP-443.ovpn & 


echo sudo nohup openvpn AirVPN_Netherlands_UDP-443.ovpn \& > ~/start-vpn
echo curl 'https://api.ipify.org?format=json' >> ~/start-vpn
echo \# xxxxxx   add static roputes to local DNS if needed >> ~/start-vpn
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


#If we want to make this configuration permanent the best way to do it is using the file /etc/sysctl.conf 
# where we can add a line containing net.ipv4.ip_forward = 1

rm vpn.sh
wget p.kmuk.lt/pi/vpn.sh
sudo mv vpn.sh /etc/init.d/
sudo chmod +x /etc/init.d/vpn.sh
sudo ln -s /etc/init.d/vpn.sh

rm ~/iptables.save
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo iptables -I  FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables-save > ~/iptables.save
sudo mv -f ~/iptables.save /etc/iptables.save
sudo ln -s /etc/iptables.save



rm delay-send
wget p.kmuk.lt/pi/delay-send
#wget p.kmuk.lt/pi/sendEmail
#sudo chmod +x sendEmail
#sudo cp -a sendEmail /usr/local/bin
sudo apt -y install sendemail
sudo mv -f delay-send /etc/openvpn/
sudo chmod +x /etc/openvpn/delay-send

sudo systemctl status openvpn.service
~/vpn.sh start

