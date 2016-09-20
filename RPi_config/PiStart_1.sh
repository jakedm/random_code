#!/bin/bash
#######################################################################
# Author: Jake Moorhead
# Date: 9/20/16
# This code is an automated setup script for the RW Raspberry Pi environment. It
#   sets up the basic config settings for the Raspberry Pi. Once the config options are
#   successfully set up, it shuts down.
#
# BEFORE RUNNING:
#   1) Install git, and download this repo (github.com/jakedm/random_code/RPi_config).
#   2) Make sure you have sudo permissions.
#
#######################################################################

# Bottom-level Config options (username, password, etc.)
printf "List of config options to set up:\n"
printf "\t1) Change password.\n"
printf "\t2) Enable Overscan (Under Advanced).\n"
printf "\t3) Enable SPI, load the SPI kernel (under Advanced).\n"
printf "\t4) Enable SSH (Under Advanced).\n"
sudo raspi-config
read -s -p -r "Are you satisfied with your configuration settings? (y or n)\n" ANS
IS_DONE=0
while [ "$IS_DONE" -lt 1 ]; do
    "$IS_DONE" = 0
    if test "$ANS" = "n"; then
        sudo raspi-config
        read -s -p -r "Are you satisfied with your configuration settings? (y or n)\n" ANS
    elif test "$ANS" = "y"; then
        let "$IS_DONE" = "$IS_DONE" + 1
    else
        printf "Input not understood; Please enter y or n.\n"
        read -s -p -r "Are you satisfied with your configuration settings? (y or n)\n" ANS
    fi
done
printf "\n\n"
printf "System shutting down.\n"
sudo shutdown 0
