#-------------------- COLORS  --------------------------
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

#-------------------- ZSH DEFAULT RC  --------------------------
# Path to your oh-my-zsh installation.
export ZSH=/home/jake/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="duellj"

#Good themes:
## candy
## duellj
## fino-time

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/jake/CNTK/build/release/bin:/usr/local/mpi/bin:/home/jake/CNTK/build/release/bin:/usr/local/mpi/bin:/home/jake/torch/install/bin:/home/jake/torch/install/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/jake/.local/bin/"
#export MANPATH="/usr/local/man:$MANPATH"
export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig:/home/jake/Downloads/glib-2.50.0/'
export LD_LIBRARY_PATH='/usr/local/lib'
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='emacs'
 else
   export EDITOR='emacs'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"
 export BROWSER="google-chrome"
 export TERM="xterm-256color"
#-------------------- ZSH SETTINGS --------------------------

## PROMPT ##
#PS1='\[\033[01;34m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\]'
# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt fade

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

## SET HISTORY SETTINGS ##

# Set history size, save 10,000 lines to .zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTIGNORE='ls *:clear:cd *'
# Ignore duplicates, multiple successive entries
setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# shopt -s checkwinsize
# Color prompt
force_color_prompt=yes

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


## ZSH ALIASES ##
# HELP COMMAND
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
#unalias run-help
alias zh=run-help

# OTHER
alias r='source ~/.zshrc'
. ~/.aliases
#-------------------- ENVIRONMENT  VARIABLES  --------------------------

## ACML ##
export ACML_FMA=0
export LD_LIBRARY_PATH=/opt/acml5.3.1/ifort64/lib:/opt/acml5.3.1/ifort64_mp/lib:$LD_LIBRARY_PATH

## MPI ##
export PATH=/usr/local/mpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/mpi/lib:$LD_LIBRARY_PATH

## CNTK ##
export PATH=$HOME/CNTK/build/release/bin:$PATH

#-------------------- AUTOCOMPLETE SETTINGS --------------------------

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#-------------------- WELCOME MESSAGE  --------------------------
# this will display the username, date, time, a calendar, the amount of users, and the up time.
clear
# Gotta love ASCII art with figlet
#figlet "Welcome, " $USER;

echo -e "${LIGHTCYAN}"; echo "----------------------------------------------------------------";
#echo -ne "${RED}Today is:\t\t${CYAN}" `date`; echo ""
if [[ $(date +%p) == 'AM' ]] #%p is either AM or PM called from date
  then echo -ne  "${WHITE}Good morning $USER. \t\t\t\t"  # note echo statements always end with newline char, printf doesn't
  else echo -ne  "${WHITE}Good afternoon $USER. \t\t\t\t"
fi
echo ""
echo -ne "${RED}Today is:\t\t${CYAN}" `date`; echo ""
echo -e "${RED}Kernel Information: \t${CYAN}" `uname -smr`
echo -ne "${PURPLE}"; upinfo; echo ""
echo -e "${GREEN}"; cal -3; echo ""
echo -e "${LIGHTCYAN}"; echo "----------------------------------------------------------------";

# Source syntax highlighting package
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
