# If you come from bash you might have to change your $PATH.
export HOME=/Users/amanhimself
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export PATH=~/bin:$PATH
export ANDROID_HOME=/Users/amanhimself/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=${PATH}:/usr/local/mysql/bin


alias sudo='nocorrect sudo'


# Path to your oh-my-zsh installation.
export ZSH=/Users/amanhimself/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs node_version time)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true




#POWERLEVEL9K_HOST_ICON="\uF109"
#POWERLEVEL9K_SSH_ICON="\uF489"

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"


POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
  git
  zsh-autosuggestions

)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#### Navigation
alias g="$HOME/Documents/github/"
alias desktop="$HOME/Desktop"
alias backup="$HOME/Documents/backup-live/"
alias n="cd /usr/local/lib/node_modules/ && ls"

# Reload Profile
alias src="source .zshrc"

# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty Trash on main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias empty="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Recursively delete `.DS_Store` files
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

########## npm commands #####################
# visit 'https://docs.npmjs.com/getting-started/fixing-npm-permissions' to enable permission
alias ni="time npm install"
alias nout="npm outdated -g --depth=0"
alias ninit="npm init --yes"
alias nconfig="npm config list"
alias ncache="time npm --cache-min 999999 install"
alias nu="time npm uninstall"
alias nr="npm run"

### yarn commands
alias ya="yarn add"
alias yr="yarn run"

#### React Ecosystem ####
alias crna="create-react-native-app"
alias cra="create-react-app"
alias rn="react-native"

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

##### EXPO #######
alias einit="expo-cli init"
alias estart="expo-cli start"

##### React Native ######
alias run-ios="react-native run-ios"
alias run-android="react-native run-android"