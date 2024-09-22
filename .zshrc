# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH

# Required for Expo and React Native local app development
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android specific paths after installing Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# To stop brew from auto updating
export HOMEBREW_NO_AUTO_UPDATE=1

# ZSH_THEME="robbyrussell"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    node
    vscode
)

source $ZSH/oh-my-zsh.sh
source /Users/amanhimself/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Custom scripts
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# aliases
## alias zshconfig="mate ~/.zshrc"
## alias ohmyzsh="mate ~/.oh-my-zsh"

## Compilation flags
export ARCHFLAGS="-arch x86_64"

## Opening GitHub directory
alias g="$HOME/Documents/GitHub/"

## Show touch on iOS simulator
alias showtouch="defaults write com.apple.iphonesimulator ShowSingleTouches 1"

## Hide touch on iOS simulator
alias hidetouch="defaults write com.apple.iphonesimulator ShowSingleTouches 0"

## Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

## Resize icons in launchpad
alias lcol="defaults write com.apple.dock springboard-columns -int 9"
alias lrow="defaults write com.apple.dock springboard-rows -int 8"
alias kdock="killall Dock"

## git shorthands
alias gall="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gs="git status"
alias gpush="git push -u origin"
alias glog="git log --oneline --graph --decorate --color"
alias gap="git add -p"
alias gck="git checkout"
alias gb="git branch"

## yarn
alias y="yarn"

## alias for opening expo/docs directory directly
alias ed="$HOME/Documents/GitHub/expo/docs"

eval "$(direnv hook zsh)"

################ END OF FILE configs ################
eval "$(starship init zsh)"
