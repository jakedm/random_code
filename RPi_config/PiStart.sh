#!/bin/sh
#######################################################################
# Author: Jake Moorhead
# Date: 9/20/16
# This code is an automated setup script for the RW Raspberry Pi environment. It
#   installs the apache server, MySQL, PHP, GCC and G++, and whatever apps the
#   user wants to install. This is based on Jake's Github folder, which includes
#   a personalized .bashrc, .emacs/.emacs.d, and .tmux.conf.
#
# BEFORE RUNNING: Install git, and download this repo (github.com/jakedm/random_code/RPi_config).
#
#
#######################################################################
APACHE="apache2 apache2-doc apache2-utils"
MYSQL="mysql-server mysql-client libmysqlclient-dev"
PHP="libapache2-mod-php5 php5 php-pear php5-xcache php5-mysql phpmyadmin"
OTHER="libmodmus-dev snmp gcc-6 g++-6"
USER_APPS="tmux htop emacs filezilla"
#ALT_APPS="codeblocks filezilla"

# Bottom-level Config options (username, password, etc.)
sudo raspi-config
echo "Are you satisfied with your configuration settings? (y or n)\n"
while [ read INPUT ]; do
    break 3
    if [ "$INPUT" == "n" ]; then
        sudo raspi-config
        echo "Are you satisfied with your configuration settings? (y or n)\n"
    else
        break
    fi
done
echo "\n\n"

# Updating RPi system
echo "Updates and Upgrades."
sudo apt-get update -y
sudo apt-get upgrade -y
sudo rpi-update -y
echo "\n\n\n"

echo "Installing Apache packages..."
sudo apt-get install $APACHE -y
echo "Done."
echo "\n\n"

echo "Installing MySQL packages..."
sudo apt-get install $MYSQL -y
echo "Done."
echo "\n\n"

echo "Installing PHP packages..."
sudo apt-get install $PHP -y
echo "Done."
echo "\n\n"

echo "Installing misc. packages..."
sudo apt-get install $OTHER -y
echo "Done."
echo "\n\n"

echo "Editing apache.conf file."
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf > /dev/null
echo "\n\n"

echo "Installing user applications..."
sudo apt-get install $USER_APPS -y
echo "Done."
echo "\n\n"

# Move config files to correct location
echo "Moving conf files from local github repo to home dir."
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.emacs ~
mv ~/Public/random_code/.emacs.d ~
mv ~/Public/random_code/.bashrc ~

sudo apt-get clean

read -s -p "You need to reboot for some of these settings to take place. Would you like to do that now? (y or n)\n" REBOOT
DONE=0
while [ DONE == 0 ]; do
if [ test "$REBOOT" == "y" ]; then
    sudo reboot
else if [ test "$REBOOT" == "n" ]; then
    let DONE = DONE + 1
else:
    echo "Input not understood; Please enter y or n.\n"
    read -s -p "You need to reboot for some of these settings to take place. Would you like to do that now? (y or n)\n" REBOOT
