# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/share/npm/lib/node_modules/karma/bin:/Users/tladendo/bin
set -o vi
source ~/bin/neil-script.sh

TOMCAT_HOME="/usr/local/Cellar/tomcat6/6.0.37"

# aliases
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias c='clear'
alias ez='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ev='vim ~/.vimrc'
alias temp='/Applications/TemperatureMonitor.app/Contents/MacOS/tempmonitor'
alias dtf='cd ~/.homesick/repos/dotfiles.git/home'
alias gpom='git push origin master'
alias serveme='python -m SimpleHTTPServer'
alias serveme-shutup='python -m SimpleHTTPServer &> /dev/null &'
alias smsu='serveme-shutup'
alias serve-cgi='python -m CGIHTTPServer'
alias scsu='serve-cgi &> /dev/null &'
alias stopserving="ps -e | ack --output='\$1' '^\s*(\d+)\s[\d\w\?]+\s+[\d:.]+\spython\s-m' | xargs kill"
alias sl='ls -r'
alias tc="cd $TOMCAT_HOME"
alias d='sdcv -u "WordNet"'

# functions
function h() {
  find /usr/local/Cellar | ack /$1$ | read x
  $x "${@[@]:2}"
}
function cleandate() {
  date | ack -o '\d{2}:\d{2}:\d{2}'
}
function tr() {
  if [ `ls -l | ack '\.trash'` ];
  then
    mkdir .trash
  fi
  if [ $# -lt 1 ];
  then
    mkdir .trash
  else
    for x in "$@"
    do
      mv $x .trash
    done
  fi
}
CLEAN_PROMPT='false'
function toggle_prompt() {
  if [ $CLEAN_PROMPT = 'false' ];
  then
    function preexec() {
      clear;
    }
    CLEAN_PROMPT='true'
  else
    function preexec() {

    }
    CLEAN_PROMPT='false'
  fi
}
alias tp='toggle_prompt'
