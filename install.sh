#!/bin/bash
set -euo pipefail

# Display message 'Setting up your Mac...'
echo "Setting up your Mac..."
sudo -v

# Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Configure symlinks
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.mackup.cfg ~/.mackup.cfg

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
 "mysql"
 "php"
 "node"
 "mackup"
 "mailhog"
 "mas"
 "wp-cli"
)

for homebrew_package in "${homebrew_packages[@]}"; do
 brew install "$homebrew_package"
done

# Install Casks
echo "Installing Homebrew cask packages"

homebrew_cask_packages=(
  "1password"
  "appcleaner"
  "discord"
  "codekit"
  "figma"
  "firefox"
  "google-chrome"
  "handbrake"
  "iina"
  "iterm2"
  "macmediakeyforwarder"
  "microsoft-edge"
  "opera"
  "poedit"
  "sequel-pro"
  "telegram"
  "transmit"
  "toggl"
  "tower"
  "transmission"
  "virtualbox"
  "visual-studio-code"
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
  brew cask install "$homebrew_cask_package"
done

# Install MAS apps
echo "Installing App Store apps"
mas install 1116599239 #NordVPN
mas install 824171161 #Affinity Designer
mas install 409183694 #Keynote
mas install 1482454543 #Twitter
mas install 1173932628 #Drop
mas install 1254981365 #Contrast
mas install 904280696 #Things
mas install 1107421413 #1Blocker
mas install 409201541 #Pages
mas install 1449412482 #Reeder
mas install 409203825 #Numbers
mas install 1289583905 #Pixelmator Pro

# Install Composer
echo "Installing Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install Global Composer Packages
echo "Installing Global Composer Packages"
/usr/local/bin/composer global require laravel/installer laravel/valet statamic/cli

# Install Laravel Valet
echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install

# Create Sites directory
echo "Creating a Sites directory"
mkdir $HOME/Sites

# Start MySQL for the first time
echo "Starting MySQL for the first time"
brew services start mysql

# Configure Laravel Valet
cd ~/Sites
valet park && cd ~
echo "Configuring Laravel Valet"
cd ~
valet restart

# Installing Global Node Dependecies
echo "Installing Global Node Dependecies"
npm install -g @vue/cli
npm install -g cross-env

# Register the Global Gitignore file
git config --global core.excludesfile $HOME/.dotfiles/.gitignore_global

# Hide 'Last Logged In' in terminal
touch .hushlogin

# Complete
echo "Installation Complete"
