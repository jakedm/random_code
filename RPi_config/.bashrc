# Set some colors
BLACK='\e[0;30m'
BLUE='\e[0;35m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m'              # No Color
#-------------------- BASH SETTINGS --------------------------
export TERM=xterm
export BROWSER=/usr/bin/google-chrome
#export BROWSER=/usr/bin/firefox
export EDITOR="emacs"
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
#-------------------- CUSTOMIZATION --------------------------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Color prompt
force_color_prompt=yes

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Aliases (Alii?)
#alias rm='mv -t ~/.local/share/Trash/files' # For Ubuntu only
alias r='source ~/.bashrc'
. ~/.aliases


#------------------------------------------////
# PROMPT:
#------------------------------------------////
PS1='\[\033[01;34m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\]'
#PS1=''

#------------------------------------------
#------WELCOME MESSAGE---------------------
# customize this first message with a message of your choice.
# this will display the username, date, time, a calendar, the amount of users, and the up time.
clear
# Gotta love ASCII art with figlet
#figlet "Welcome, " $USER;
#echo -e "${LIGHTBLUE}"; echo "Welcome, " $USER;
#for i in `seq 1 15` ; do spin; done ;
#echo -ne "${WHITE} Welcome, " $USER;
#for i in `seq 1 15` ; do spin; done ;echo "";
echo -e "${LIGHTCYAN}"; echo "----------------------------------------------------------------";
#echo -ne "${RED}Today is:\t\t${CYAN}" `date`; echo ""
if [[ $(date +%p) == 'AM' ]]                   #%p is either AM or PM called from date
  then echo -ne  "${WHITE}Good morning $USER. \t\t\t\t"  # note echo statements alway end with newline char, printf doesn't
  else echo -ne  "${WHITE}Good afternoon $USER. \t\t\t\t"
fi
echo ""
echo -ne "${RED}Today is:\t\t${CYAN}" `date`; echo ""
echo -e "${RED}Kernel Information: \t${CYAN}" `uname -smr`
echo -ne "${PURPLE}"; upinfo; echo ""
#echo -ne "${CYAN}"; uptime; echo ""
echo -e "${GREEN}"; cal -3; echo ""
#echo -e "${RED}"; weather; echo ""
echo -e "${LIGHTCYAN}"; echo "----------------------------------------------------------------";
