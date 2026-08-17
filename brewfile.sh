# Specify directory to install
cask_args appdir: "/Applications"

# Install packages
brew 'mas'
brew 'git'
brew 'git-crypt'
brew 'git-lfs'
brew 'lazygit'
brew 'git-delta'
brew 'mise'
brew 'readline'
brew 'scrcpy'
brew 'bun'
brew 'starship'
brew 'tmux'

# Images, Video
brew 'ffmpeg'

# Fonts
cask 'font-blex-mono-nerd-font'

# Other apps
cask 'visual-studio-code'
cask 'google-chrome'
cask 'google-chrome@canary'
cask 'brave-browser'
cask 'imageoptim'
cask "cleanshot"
cask 'lm-studio'

## App Store apps
mas "Telegram", id: 747648890
mas "Slack", id: 803453959
mas 'HiddenMe', id: 467040476
mas 'Bandwidth+', id: 490461369
mas 'Obsidian', id: 1557175442