#!/bin/sh

#Before running this, install git, and download this repo (random_code).
LIST_OF_APPS="tmux htop emacs"

#Download zsh
sudo apt-get install zsh
sudo chsh -s $(which zsh)
#Reboot without rebooting
source /etc/profile
#Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#Download and install google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

#apt-get install emacs -y
##Set up emacs correctly
#echo "(custom-set-variables
# '(custom-enabled-themes (quote (manoj-dark)))
# '(inhibit-startup-screen t))
#(custom-set-faces)" > ~/.emacs
apt-get install $LIST_OF_APPS -y

# Move config files to correct location
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.emacs ~
mv ~/Public/random_code/.emacs.d ~
mv ~/Public/random_code/.zshrc ~ 
