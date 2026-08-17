export PATH=/opt/homebrew/bin:$PATH

# Required for Expo and React Native local app development
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android specific paths after installing Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# To stop brew from auto updating
export HOMEBREW_NO_AUTO_UPDATE=1

## Compilation flags
export ARCHFLAGS="-arch x86_64"

## Enable AUTO_CD to automatically change to a directory when you `cd` into it
setopt AUTO_CD

## Opening various directory
alias g="cd $HOME/github/"
alias n="cd $HOME/github/notes/"

## Show touch on iOS simulator
alias showtouch="defaults write com.apple.iphonesimulator ShowSingleTouches 1"

## Hide touch on iOS simulator
alias hidetouch="defaults write com.apple.iphonesimulator ShowSingleTouches 0"

## Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

## Resize icons in launchpad
alias lcol="defaults write com.apple.dock springboard-columns -int 12"
alias lrow="defaults write com.apple.dock springboard-rows -int 10"
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
alias gslog="git shortlog -s"
alias lg="lazygit"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship
eval "$(starship init zsh)"

# mise
eval "$(mise activate zsh)"

# Enable syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.local/bin:$PATH"
