# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH

# Required for Expo and React Native local app development
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android specific paths after installing Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
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

## yarn
alias y="yarn"

## alias for opening expo/docs directory directly
alias ed="$HOME/Documents/GitHub/expo/docs"
alias ex="$HOME/Documents/GitHub/expo"

# For Expo CLI

alias nexpo="/Users/amanhimself/Documents/GitHub/expo/packages/@expo/cli/build/bin/cli"

################ END OF FILE configs ################

# ============================================
# THEME CONFIGURATION - Single source of truth
# Usage: theme light | theme dark | theme (toggles)
# ============================================

# Licht Light Theme Colors
typeset -A THEME_LIGHT=(
    [bg]="#ffffff"
    [fg]="#000000"
    [cursor]="#000000"
    [ansi0]="#111111"   # black
    [ansi1]="#dd3c2f"   # red
    [ansi2]="#00a33f"   # green
    [ansi3]="#c5be0e"   # yellow
    [ansi4]="#3b68fc"   # blue
    [ansi5]="#bb28c7"   # magenta
    [ansi6]="#5ebec5"   # cyan
    [ansi7]="#919191"   # white
    [ansi8]="#686868"   # bright black
    [ansi9]="#eb5543"   # bright red
    [ansi10]="#58c05b"  # bright green
    [ansi11]="#c5be0e"  # bright yellow
    [ansi12]="#4668f6"  # bright blue
    [ansi13]="#dd46f7"  # bright magenta
    [ansi14]="#86bac2"  # bright cyan
    [ansi15]="#b9b9b9"  # bright white
    # Starship prompt colors
    [dir_blue]="#4B69C6"
    [git_purple]="#7A3E9D"
    [git_green]="#448C27"
    [git_red]="#AA3731"
    [git_gray]="#8190A0"
)

# Nord Dark Theme Colors
typeset -A THEME_DARK=(
    [bg]="#2e3440"
    [fg]="#eceff4"
    [cursor]="#d8dee9"
    [ansi0]="#3b4252"   # black (Nord1)
    [ansi1]="#bf616a"   # red (Nord11)
    [ansi2]="#a3be8c"   # green (Nord14)
    [ansi3]="#ebcb8b"   # yellow (Nord13)
    [ansi4]="#81a1c1"   # blue (Nord9)
    [ansi5]="#b48ead"   # magenta (Nord15)
    [ansi6]="#88c0d0"   # cyan (Nord8)
    [ansi7]="#e5e9f0"   # white (Nord5)
    [ansi8]="#4c566a"   # bright black (Nord3)
    [ansi9]="#bf616a"   # bright red (Nord11)
    [ansi10]="#a3be8c"  # bright green (Nord14)
    [ansi11]="#ebcb8b"  # bright yellow (Nord13)
    [ansi12]="#81a1c1"  # bright blue (Nord9)
    [ansi13]="#b48ead"  # bright magenta (Nord15)
    [ansi14]="#8fbcbb"  # bright cyan (Nord7)
    [ansi15]="#eceff4"  # bright white (Nord6)
    # Starship prompt colors
    [dir_blue]="#88C0D0"
    [git_purple]="#B48EAD"
    [git_green]="#A3BE8C"
    [git_red]="#BF616A"
    [git_gray]="#D8DEE9"
)

function theme() {
    local starship_config="$HOME/.config/starship.toml"
    local current_theme=$(grep '^palette = ' "$starship_config" | sed 's/palette = "\([^"]*\)".*/\1/')
    local new_theme=""

    if [[ "$1" == "light" ]]; then
        new_theme="licht"
    elif [[ "$1" == "dark" ]]; then
        new_theme="nord"
    else
        # Toggle
        if [[ "$current_theme" == "licht" ]]; then
            new_theme="nord"
        else
            new_theme="licht"
        fi
    fi

    # Select theme colors
    local -A colors
    if [[ "$new_theme" == "nord" ]]; then
        colors=("${(@kv)THEME_DARK}")
    else
        colors=("${(@kv)THEME_LIGHT}")
    fi

    # Update Starship config
    sed -i '' "s/^palette = \"[^\"]*\"/palette = \"$new_theme\"/" "$starship_config"

    # Apply terminal colors via OSC escape sequences
    echo -ne "\033]11;${colors[bg]}\007"      # background
    echo -ne "\033]10;${colors[fg]}\007"      # foreground
    echo -ne "\033]12;${colors[cursor]}\007"  # cursor

    # ANSI colors 0-15
    for i in {0..15}; do
        echo -ne "\033]4;$i;${colors[ansi$i]}\007"
    done

    echo "Switched to $new_theme theme"
}

# conda
eval "$(/Users/amanhimself/miniforge3/bin/conda shell.zsh hook)"

# direnv
eval "$(direnv hook zsh)"

# Starship
eval "$(starship init zsh)"

# rbenv
eval "$(rbenv init -)"