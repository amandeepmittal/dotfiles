# Specify directory to install
cask_args appdir: "/Applications"

# Install packages
tap 'homebrew/bundle'
brew 'direnv'
brew 'ffmpeg'
brew 'git-crypt'
brew 'git-lfs'
brew 'git'
brew 'readline'
brew 'scrcpy'
brew 'yarn'
brew 'watchman'
brew 'vale'
brew 'imageoptim'
brew 'expo-orbit'
brew 'cocoapods'
brew 'typos-cli'
brew "zsh-syntax-highlighting"


# Fonts
cask 'font-jetbrains-mono'
cask 'font-hack-nerd-font'

# Other apps
cask 'insomnia'
cask 'visual-studio-code'
cask 'google-chrome'
cask 'google-chrome@canary'
cask 'brave-browser'
cask 'arc'
