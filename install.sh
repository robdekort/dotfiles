#!/bin/bash
set -euo pipefail

# Display message 'Setting up your Mac...'
echo "Setting up your Mac..."
sudo -v

# Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Configure symlinks
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.mackup.cfg ~/.mackup.cfg

# Homebrew - Installation
echo "Installing Homebrew"

if test ! $(which brew); then
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Homebrew Packages
cd ~
echo "Installing Homebrew packages"

homebrew_packages=(
 "imagemagick"
 "mysql"
 "php"
 "node"
 "mackup"
 "mailhog"
 "mas"
 "pkg-config"
 "wp-cli"
)

for homebrew_package in "${homebrew_packages[@]}"; do
 brew install "$homebrew_package"
done

# Install Casks
echo "Installing Homebrew cask packages"

# Add cask for PHP mon
brew tap homebrew/homebrew-cask

homebrew_cask_packages=(
  "1password"
  "appcleaner"
  "discord"
  "codekit"
  "figma"
  "font-fira-code"
  "firefox"
  "google-chrome"
  "handbrake"
  "iterm2"
  "macmediakeyforwarder"
  "microsoft-edge"
  "opera"
  "poedit"
  "phpmon"
  "redis"
  "sequel-ace"
  "sketch"
  "telegram"
  "transmit"
  "toggl"
  "tower"
  "transmission"
  "visual-studio-code"
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
  brew install "$homebrew_cask_package"
done

# Install MAS apps
echo "Installing App Store apps"
mas install 775737590 #IAWriter
mas install 1116599239 #NordVPN
mas install 824171161 #Affinity Designer
mas install 409183694 #Keynote
mas install 1173932628 #Drop
mas install 1254981365 #Contrast
mas install 904280696 #Things
mas install 1107421413 #1Blocker
mas install 409201541 #Pages
mas install 1529448980 #Reeder
mas install 409203825 #Numbers
mas install 1289583905 #Pixelmator Pro
mas install 1136220934 #Infuse

# Install Composer
echo "Installing Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install Global Composer Packages
echo "Installing Global Composer Packages"
/usr/local/bin/composer global require laravel/valet statamic/cli schmidfelix/ploi-cli

# Install Laravel Valet
echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install
valet trust

# Create Sites directory
echo "Creating a Sites directory"
mkdir $HOME/Sites

# Start MySQL for the first time
echo "Starting MySQL for the first time"
brew services start mysql

# Start Mailhog for the first time
echo "Starting Mailhog for the first time"
brew services start mailhog

# Configure Laravel Valet
cd ~/Sites
valet park && cd ~
echo "Configuring Laravel Valet"
cd ~
valet proxy mailhog http://127.0.0.1:8025
pecl install imagick
valet restart

# Installing Global Node Dependecies
echo "Installing Global Node Dependecies"
npm install -g cross-env
npm install -g npm-check-updates

# Register the Global Gitignore file
git config --global core.excludesfile $HOME/.dotfiles/.gitignore_global

# Hide 'Last Logged In' in terminal
touch .hushlogin

# Complete
echo "Installation Complete"
