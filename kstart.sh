#!/bin/sh

#Before running this, install git, and download this repo (random_code).
LIST_OF_APPS="tmux"

apt-get update
apt-get install emacs -y
#Set up emacs correctly
rm ~/.emacs
echo "(custom-set-variables
 '(custom-enabled-themes (quote (manoj-dark)))
 '(inhibit-startup-screen t))
(custom-set-faces)" > ~/.emacs
# Add terminal shortcut to list of shortcuts
sed -i '37 <property name="&lt;Primary&gt;&lt;Alt&gt;t" type="string" value="xfce4-terminal"/>' /root/.config/xfce4/xfconf/xfce-perchannel-xml
apt-get install $LIST_OF_APPS -y
# Move config files to correct location
mv ~/Public/random_code/.tmux.conf ~
mv ~/Public/random_code/.bashrc ~
source ~/.bashrc
