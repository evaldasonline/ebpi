#----------------------------------------------------------------------------------
# lamp  ---------------------------------------------------------------------------
sudo apt-get -y install apache2
sudo apt-get -y install mysql-server mysql-client
sudo apt-get -y install php libapache2-mod-php php-mysql

sudo service apache2 restart
sudo /etc/init.d/apache2 restart

sudo cp ./script/p.php /var/www/html/p.php
php -r 'echo "\n\nYour PHP installation is working fine.\n\n\n";'

echo  ------------------------------
echo set password for web access ...
sudo htpasswd -c /etc/apache2/.htpasswd w
