#!/bin/bash

FLAGS="-y --show-progress"
GUI=( "mate-desktop-environment-core" "xfce4 xfce4-terminal" "raspberrypi-ui-mods" )
DEFAULT=1

echo Default GUI is ${GUI[$DEFAULT]}, reset script to change.
sleep 5

echo Installing Xorg:
sudo apt-get install $FLAGS xserver-xorg
echo
echo

echo Installing Xinit:
sudo apt-get install $FLAGS xinit
echo
echo

echo Installing Xinit:
sudo apt-get install $FLAGS xinit
echo
echo

echo Installing ${GUI[$DEFAULT]}:
sudo apt-get install $FLAGS ${GUI[$DEFAULT]}
echo
echo

echo Installing lightdm:
sudo apt-get install $FLAGS lightdm
