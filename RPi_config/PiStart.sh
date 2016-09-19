#!/bin/sh
APACHE="apache2 apache2-doc apache2-utils"
MYSQL="mysql-server mysql-client libmysqlclient-dev"
PHP="libapache2-mod-php5 php5 php-pear php5-xcache php5-mysql phpmyadmin"
OTHER="libmodmus-dev snmp gcc-6 g++-6"
#Before running this, install git, and download this repo (random_code).
LIST_OF_APPS="tmux htop emacs filezilla"

# Bottom-level Config options (username, password, etc.)
sudo raspi-config

# Updating RPi system
sudo apt-get update -y
sudo apt-get upgrade -y
sudo rpi-update -y

sudo apt-get install $APACHE -y
sudo apt-get install $MYSQL -y
sudo apt-get install $PHP -y
sudo apt-get install $OTHER -y

echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf > /dev/null

sudo apt-get install $LIST_OF_APPS -y

# Move config files to correct location
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.emacs ~
mv ~/Public/random_code/.emacs.d ~
mv ~/Public/random_code/.bashrc ~

sudo apt-get clean
sudo reboot
