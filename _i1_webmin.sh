#----------------------------------------------------------------------------------
# WEBMIN ---------------------------------------------------------------------------

sudo chmod a+w /etc/apt/sources.list
sudo echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
sudo apt-get update
sudo apt-get -y install webmin
