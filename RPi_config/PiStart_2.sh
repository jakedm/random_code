#!/bin/bash
#######################################################################
# Author: Jake Moorhead
# Date: 9/20/16
# This code is an automated setup script for the RW Raspberry Pi environment. It
#   installs the apache server, MySQL, PHP, GCC and G++, and whatever apps the
#   user wants to install. This is based on Jake's Github folder, which includes
#   a personalized .bashrc, .emacs/.emacs.d, and .tmux.conf. This script is built
#   to be run in the raspbian environment, and it (obviously) also assumes that
#   Git is installed correctly.
#
# BEFORE RUNNING:
#   1) Install git, and download this repo (github.com/jakedm/random_code/RPi_config).
#   2) Make sure you have sudo permissions.
#   3) Make sure you have ran PiStart_1.sh, and ensure that the system has been shutdown.
#
#######################################################################
APACHE="apache2 apache2-doc apache2-utils"
MYSQL="mysql-server mysql-client libmysqlclient-dev"
PHP="libapache2-mod-php5 php5 php-pear php5-xcache php5-mysql phpmyadmin"
OTHER="libmodmus-dev snmp"
USER_APPS="tmux htop emacs codeblocks codeblocks-contrib filezilla"

# Updating RPi system
printf "Updates and Upgrades.\n"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo rpi-update -y
printf "\n\n\n"

# SHOULD REBOOT HERE

printf "Installing Apache packages...\n"
sudo apt-get install "$APACHE" -y
printf "Done.\n"
printf "\n\n"

printf "Installing MySQL packages...\n"
sudo apt-get install "$MYSQL" -y
printf "Done.\n"
printf "\n\n"

printf "Installing PHP packages...\n"
sudo apt-get install "$PHP" -y
printf "Done.\n"
printf "\n\n"

printf "Installing misc. packages...\n"
sudo apt-get install "$OTHER" -y
printf "Done.\n"
printf "\n\n"

printf "Editing apache.conf file.\n"
echo "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf > /dev/null
printf "\n\n"

printf "Installing user applications...\n"
sudo apt-get install "$USER_APPS" -y
printf "Done.\n"
printf "\n\n"

# Move config files to correct location
printf "Moving conf files from local github repo to home dir.\n"
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.emacs ~
mv ~/Public/random_code/.emacs.d ~
mv ~/Public/random_code/.bashrc ~

sudo apt-get clean

read -s -p -r "You need to reboot for some of these settings to take place. Would you like to do that now? (y or n)\n" REBOOT
IS_DONE=0
while [ "$IS_DONE" -lt 1 ]; do
    if test "$REBOOT" = "y"; then
        sudo reboot
    elif  test "$REBOOT" = "n"; then
        let "$IS_DONE" = "$IS_DONE" + 1
        printf "\n\n\nScript finished.\n\n\n"
    else:
        printf "Input not understood; Please enter y or n.\n"
        read -s -p -r "You need to reboot for some of these settings to take place. Would you like to do that now? (y or n)\n" REBOOT
    fi
done
