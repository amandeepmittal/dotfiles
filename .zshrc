# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/amanhimself/.oh-my-zsh/oh-my-zsh.sh"

export PATH=/opt/homebrew/bin:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

ZSH_THEME="spaceship"

plugins=(
  git  
  node
  vscode
  zsh-syntax-highlighting
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source /Users/amanhimself/.oh-my-zsh/oh-my-zsh.sh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias g="$HOME/Documents/GitHub/"

alias insiders='code-insiders'
alias code='open -a Visual\ Studio\ Code.app'



# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# git shorthands
alias gall="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpush="git push -u origin"
alias glog="git log --oneline --graph --decorate --color"

## React Native dev build shorthands
alias run-ios="npx react-native run-ios"

# React Navigation (v5)
## The function tip is give by (thanks to) Catalin Miron (https://twitter.com/mironcatalin)
function peersInstall() {
  echo "Running install with $@";
  echo "- react-native-gesture-handler\n- react-native-reanimated\n- react-native-screens\n- react-native-safe-area-context\n- @react-native-community/masked-view\n"
  $@ install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view;
}

## OR

alias exponav="expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view"

alias rnav="react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view"

alias addnavtoexpo="yarn add @react-navigation/native @react-navigation/stack @react-navigation/bottom-tabs && expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view"

# for the time being
arch="arch -x86_64"

# for running target iOS simulator
alias iphonesim="npx react-native run-ios --simulator='iPhone 12 mini'"

# run git log watcher inside a .git repo
alias gwl="git-watch-log | lolcat"

# other lolcat piped aliases
alias ls="ls | lolcat"
alias lsal="ls -al | lolcat"
