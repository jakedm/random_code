#!/bin/sh

#Before running this, install git, and download this repo (random_code).
LIST_OF_APPS="tmux"

apt-get update
apt-get install emacs -y
#Set up emacs correctly
echo "(custom-set-variables
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces)" > ~/.emacs
apt-get install $LIST_OF_APPS -y
# Move config files to correct location
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.bashrc ~
source ~/.bashrc
