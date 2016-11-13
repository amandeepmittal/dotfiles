export PATH=~/bin:$PATH
 
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
 
#print_before_the_prompt () {
#    printf "\n$txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt)"
#}
 
#PROMPT_COMMAND=print_before_the_prompt

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}



export PS1="\[\033[37m\]\A\[$(tput sgr0) \[\033[33;1m\]{\[\033[33;1m\]\w\[\033[m\]\[\033[33;1m\]} \[\033[35m\]\$(parse_git_branch)\[\033[00m\]\n\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


#----------------------------
# Aliases Commands
#----------------------------

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

# Navigation Shortcuts
alias p="cd ~/projects"
alias n="cd /usr/local/lib/node_modules/"
alias g="cd ~/github_clones"
alias h="history"
alias f="open -a Finder"
alias safari="open -a safari"
alias chrome="open -a google\ chrome"
alias gh="open -a google\ chrome 'http://github.com/amandeepmittal'"
alias o="cd ~/old_code"


# Show/Hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty Trash on main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias empty="sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get my IP
alias ip="curl icanhazip.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Recursively delete `.DS_Store` files
alias killds="find . -type f -name '*.DS_Store' -ls -delete"

# npm commands
# visit 'https://docs.npmjs.com/getting-started/fixing-npm-permissions' to enable permission 
alias npmg="npm install -g"
alias npmi="npm install"
alias npmu="npm update"
alias npmug="sudo npm update -g"
alias npmcache="npm --cache-min 9999999 install"
alias npmr="npm uninstall"
alias npmrg="npm uninstall -g"
alias npml="npm list"
alias npmlg="npm list -g --depth=0"
alias npmout="npm outdated -g --depth=0"
alias npmconfig="npm config list"
alias npmy = npm init --yes

#git commands
alias gts="git status"
alias gta="git add ."
alias gtaa="git add"
alias gtc="git commit -m"
alias gtpom="git push origin master"

