# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/amanhimself/.oh-my-zsh"
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
)

source $ZSH/oh-my-zsh.sh

# aliases
alias g="$HOME/Documents/GitHub/"

# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

alias code="open -a /Applications/Visual\ Studio\ Code.app"

# git shorthands
alias gall="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpush="git push origin master"
alias glog="git log --oneline --graph --decorate --color"

## The function tip is give by (thanks to) Catalin Miron (https://twitter.com/mironcatalin)
function peersInstall() {
  echo "Running install with $@";
  echo "- react-native-gesture-handler\n- react-native-reanimated\n- react-native-screens\n- react-native-safe-area-context\n- @react-native-community/masked-view\n"
  $@ install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view;
}

## OR

alias exponav="expo install react-native-gesture-handler react-native-reanimated react-native-screens react-native-safe-area-context @react-native-community/masked-view"

alias rnav="react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view"