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
alias switch="git switch"
alias branch="git branch"
alias reset="git reset"
alias clone="git clone"
alias init="git init && git add . && git commit -m 'Initial commit'"
alias discard="git clean -df && git reset --hard"

# Other
alias pls="php please"
alias start="code . && php artisan cache:clear && npm run watch"
alias ccp="cd vendor/statamic/cms && npm i && npm run build && .... && php please install"
alias fc="rm composer.lock && rm -r vendor && composer install"
alias exportpeak="php please starter-kit:export ../statamic-peak"
