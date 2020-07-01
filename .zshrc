# If you come from bash you might have to change your $PATH.
export HOME=/Users/amanhimself
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export PATH=~/bin:$PATH
export ANDROID_HOME=/Users/amanhimself/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=${PATH}:/usr/local/mysql/bin

# Working Directory
# cd $HOME/Desktop

alias please='sudo' 

# Path to your oh-my-zsh installation.
export ZSH=/Users/amanhimself/.oh-my-zsh

ZSH_THEME="spaceship"

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

SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_COLOR_FAILURE="red"

plugins=(
  git  
  vscode
)

source $ZSH/oh-my-zsh.sh

## file/direcotry navigation
alias g="$HOME/Documents/github/"
alias desktop="$HOME/Desktop"


# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty Trash on main SSD
# Also, clear Apple’s System Logs to improve shell startup speed
alias empty="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Recursively delete `.DS_Store` files
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# npm shorthands
alias npminit="npm init --yes"
alias npmconfig="npm config list"
alias nr="npm run"

# yarn shorthands
alias ya="yarn add"
alias yr="yarn run"

# git shorthands
alias gc="git commit -m"
alias gs="git status"
alias gpush="git push origin master"
alias gall="git add ."
alias ga="git add"
alias gam="git commit -am"
alias glog="git log --oneline --graph --decorate --color"
alias gheroku="git push heroku master"
alias gt="git tag"

# expo shorthands
alias expo="expo-cli"

# react native shorthands
alias run-ios="react-native run-ios"
alias run-android="react-native run-android"

# VSCode shorthands
alias code="open -a /Applications/Visual\ Studio\ Code.app"
alias insiders="open -a /Applications/Visual\ Studio\ Code\ -\ Insiders.app"

# Catalina MongoDB path alias
alias mongod="mongod --dbpath ~/data/db"

# Android emulator trigger without Android Studio
alias simdroid="/Users/amanhimself/Library/Android/sdk/emulator/emulator -avd Pixel_2_API_29 -netdelay none -netspeed full"

# react-navigation library alias

## The function tip is give by (thanks to) Catalin Mironh (https://twitter.com/mironcatalin_
function peersInstall() {
  echo "Running install with $@";
  echo "- react-native-gesture-handler\n- react-native-reanimated\n- react-native-screens\n- react-native-safe-area-context\n- @react-native-community/masked-view\n"
  $@ install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view;
}

## OR

alias exponav="expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view"

alias rnav="react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view"

# iOS simulator

## to record while iOS simualtor is open
alias iosrecord="xcrun simctl io booted recordVideo default-preview.mp4"
