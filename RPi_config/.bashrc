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
                                                                           
# Keeping things organized                                                 
#alias rm='mv -t ~/.local/share/Trash/files' # For Ubuntu only
alias net='${BROWSER} 2>/dev/null &'                                       

alias hardware='inxi -Fx'
                                                                           
#alias ls='ls -hF --color'    # add colors for filetype recognition        
# enable color support of ls and also add handy aliases                    
if [ "$TERM" != "dumb" ]; then                                             
    eval `dircolors -b`                                                    
    alias ls='ls -hF --color=auto'                                         
    #alias ls='du -s */* | sort -n'                                        
    alias dir='ls --color=auto --format=vertical'                          
    alias vdir='ls --color=auto --format=long'                             
                                                                           
    alias grep='grep --color=auto'                                         
    alias fgrep='fgrep --color=auto'                                       
    alias egrep='egrep --color=auto'                                       
fi                                                                         
                                                                           
alias r='source ~/.bashrc'                                                 
#------------------------------------------////                            
# FUNCTIONS:                                                               
#------------------------------------------////
                                                                          
mkhead ()                                                                  
{                                                                          
    if [[ $1 =~ \.py$ ]]; then                                             
        touch "header_${1%.py}.txt";                                       
        echo "//--- Header file created by mkhead() ---//" > "${1%.py}_header.txt";                                                                  
        cat $1 | grep "def" >> "${1%.py}_header.txt"                       
    fi                                                                     
}                                                                          
                                                                           
upinfo ()                                                                  
{                                                                          
    echo -ne "Upinfo: \t "; uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}

function my_ip() # get IP adresses                                         
{                                                                          
    MY_IP=$(/sbin/ifconfig eth0 | awk "/inet/ { print $2 } " | sed -e s/addr://)                                                                     
    MY_ISP=$(/sbin/ifconfig eth0 | awk "/P-t-P/ { print $3 } " | sed -e s/P-t-P://)                                                                  
}                                                                          
                                                                           
function ii() # get current host related info                              
{                                                                          
    #echo -e "\n${BLUE}You are logged on $HOST"                            
    echo -e "\nAdditionnal information:$NC " ; uname -a                    
    echo -e "\n${RED}Users logged on:$NC " ; w -h                          
    echo -e "\n${RED}Current date :$NC " ; date                            
    echo -e "\n${RED}Machine stats :$NC " ; uptime                         
    echo -e "\n${RED}Memory stats :$NC " ; free                            
    my_ip 2>&. ;                                                           
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:."Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:."Not connected"}   
    echo                                                                   
}  

# Get weather (replace the 71822 in the url with your own zipcode, call it by typing weather)                                                        
weather ()                                                                 
{                                                                          
    declare -a WEATHERARRAY                                                
    WEATHERARRAY=( `elinks -dump "http://www.google.com/search?hl=en&lr=&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&q=weather+98229&btnG=Search" | grep -A 5 -m 1 "Weather for" | grep -v "Add to "`)                 
    echo ${WEATHERARRAY[@]}                                                
}                                                                          
                                                                           
                                                                           
function myip {                                                            
    myip=`elinks -dump http://checkip.dyndns.org:8245/`                    
    echo "${myip}"                                                         
}  

#------------------------------------------////                            
# Encryption/Decryption:                                                   
                                                                           
# requires gpg                                                             
# the proper way to use these functions is simply to enter "encrypt filename" or "decrypt filename"                                                  
encrypt ()                                                                 
{                                                                          
gpg -ac --no-options "$1"                                                  
}                                                                          
                                                                           
decrypt ()                                                                 
{                                                                          
gpg --no-options "$1"                                                      
}                                                                          
                                                                           
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
                                                                           
                          
