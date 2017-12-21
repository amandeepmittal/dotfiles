export PATH=~/bin:$PATH
export ANDROID_HOME=/Users/amandeepmittal/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

#print_before_the_prompt () {
#    printf "\n$txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
#}

# random element
rand() {
  printf $((  $1 *  RANDOM  / 32767   ))
}
rand_element () {
  local -a th=("$@")
  unset th[0]
  printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}

#PROMPT_COMMAND=print_before_the_prompt

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[37m\]\A\[$(tput sgr0) \[\033[33;1m\]{\[\033[33;1m\]\w\[\033[m\]\[\033[33;1m\]} \[\033[35m\]\$(parse_git_branch)\[\033[00m\]\n$(rand_element 🚀 🖖 ⚡️️)  $ ";
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


#----------------------------
# Aliases Commands
#----------------------------

# Navigation
alias ..="cd .."
alias ~="cd ~"

# Navigation Shortcuts
alias n="cd /usr/local/lib/node_modules/ && ls"
alias g="cd ~/github"

# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty Trash on main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias empty="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Recursively delete `.DS_Store` files
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# Reload Bash Profile
alias reload="source ~/.bash_profile"

########## GIT ALIASES ######################
alias gc="git commit -m"
alias gs="git status"
alias gp="git pull"
alias gf="git fetch"
alias gpush="git push origin master"
alias gd="git diff"
alias gall="git add ."
alias ga="git add"
alias gam="git commit -am"
alias glog="git log --oneline --graph --decorate --color"
alias gheroku="git push heroku master"
alias gt="git tag"

########## npm commands #####################
# visit 'https://docs.npmjs.com/getting-started/fixing-npm-permissions' to enable permission
alias ni="time npm install"
alias nout="npm outdated -g --depth=0"
alias ninit="npm init --yes"
alias nconfig="npm config list"
alias ncache="time npm --cache-min 999999 install"
alias nu="time npm uninstall"
alias nr="npm run"

#### Hexo #####
# alias hexod="hexo deploy"
# alias hexog="hexo generate"

#### React Ecosystem ####
alias crna="create-react-native-app"
alias cra="create-react-app"