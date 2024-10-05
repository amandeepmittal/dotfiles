# Specify directory to install
cask_args appdir: "/Applications"

# Tap Homebrew
tap 'homebrew/bundle'
tap "homebrew/core"

# Install packages
brew 'mas'
brew 'direnv'
brew 'git'
brew 'git-crypt'
brew 'git-lfs'
brew 'readline'
brew 'scrcpy'
brew 'yarn'
brew 'watchman'
brew 'vale'
brew 'cocoapods'
brew 'typos-cli'
brew 'starship'

# Images, Video
brew 'ffmpeg'

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
cask 'imageoptim'
cask 'expo-orbit'

## App Store apps
mas "1Password 7", id: 1333542190
mas "Telegram", id: 747648890
mas "Slack", id: 803453959
mas 'HiddenMe', id: 467040476
mas 'Bandwidth+', id: 490461369