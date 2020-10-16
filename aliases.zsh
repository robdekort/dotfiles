# Shortcuts
alias plz="php please"
alias g="git"
alias c="composer"
alias ci="composer install"
alias cr="composer require"
alias n="npm"
alias ni="npm install"
alias cl="clear"

# Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Git
alias add="git add"
alias all="git add ."
alias push="git push"
alias pull="git pull"
alias commit="git commit -m"
alias check="git checkout"
alias branch="git branch"
alias reset="git reset"
alias clone="git clone"
alias init="git init && git add . && git commit -m 'Initial commit'"

# Other
alias start='code . && git pull && npm run watch'
