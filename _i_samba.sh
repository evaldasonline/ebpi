#----------------------------------------------------------------------------------
# SAMBA ---------------------------------------------------------------------------
cd ~
sudo apt -y install samba

sudo cp /etc/samba/smb.conf  /etc/samba/smb.ok
echo \# >  ~/q.tmp
echo [share] >>  ~/q.tmp
echo     comment = Ubuntu File Server Share >>  ~/q.tmp
echo     path = /home/qbtuser/Downloads >>  ~/q.tmp
echo     browsable = yes >>  ~/q.tmp
echo     guest ok = yes >>  ~/q.tmp
echo     read only = no >>  ~/q.tmp
echo     create mask = 0755 >>  ~/q.tmp


sudo chmod -R 777 /home/qbtuser/Downloads
sudo chmod a+w /etc/samba/smb.conf
sudo cat ~/q.tmp >> /etc/samba/smb.conf
sudo chmod a-w /etc/samba/smb.conf

sudo systemctl daemon-reload
sudo systemctl restart smbd.service nmbd.service


