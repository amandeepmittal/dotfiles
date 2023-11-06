# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH

# Android specific
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Oh my zsh config
ZSH_THEME="spaceship"
DISABLE_AUTO_UPDATE="true"

plugins=(
  git
  node
  vscode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /Users/amanhimself/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Only if using nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

########################### Aliases that I use ###########################

# Open GitHub directory
alias g="$HOME/Documents/GitHub/"

# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# Show touch on iOS simulator
alias showtouch="defaults write com.apple.iphonesimulator ShowSingleTouches 1"

# Hide touch on iOS simulator
alias hidetouch="defaults write com.apple.iphonesimulator ShowSingleTouches 0"

# git shorthands
alias gall="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpush="git push -u origin"
alias glog="git log --oneline --graph --decorate --color"
alias gap="git add -p"
alias gck="git checkout"
alias gb="git branch"

# alias for upgrading outdated packages and cleaning up outdated files
alias hbc="brew update && brew upgrade && brew cleanup"


# for work

# alias for opening expo/docs directory directly

alias ed="$HOME/Documents/GitHub/expo/docs"

################ END OF FILE configs ################

eval "$(direnv hook zsh)"
