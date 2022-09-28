# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

# Only add them for Android development/Android Studio installed
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Only if using nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

ZSH_THEME="spaceship"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

plugins=(
  git
  node
  vscode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /Users/amanhimself2/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

########################### Aliases that I use ###########################

# Open GitHub directory
alias g="$HOME/Documents/GitHub/"

# Open current directory in VSCode
alias code='open -a Visual\ Studio\ Code.app'

# Override "ls" with "ls -a"
alias ls="ls -a"

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

# alias for yarn
alias y="yarn"
alias ya="yarn add"

# alias for expo (installing dependencies)
alias e="expo"
alias ei="expo install"

# alias for npm run
alias nr="npm run"

# npkill - delete node_modules
alias npkill="npx npkill"

# check outdated global dependencies
alias npmcheck="npx npm-check -gu"

# Create React Native App
alias crna="create-react-native-app"

# alias for opening expo/docs directory directly
alias ed="$HOME/Documents/GitHub/expo/docs"

# alias for checking outdated global packages via npm-check
alias nnc="sudo npx npm-check -gu"

########################### End of file stuff ###########################

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
