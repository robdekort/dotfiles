#!/bin/bash
set -euo pipefail

# Display message 'Setting up your Mac...'
echo "Setting up your Mac..."
sudo -v

# Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Configure symlinks
rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
mkdir ~/.ssh
ln -sf ~/.dotfiles/.ssh/config ~/.ssh/config
rm -f ~/.gitconfig
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
rm -f ~/.p10k.zsh
ln -s ~/.dotfiles/.p10k.zsh  ~/.p10k.zsh

# Homebrew - Installation
echo "Installing Homebrew"
if test ! $(which brew); then
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Update homebrew recipes
brew update

# Install Homebrew Packages
cd ~
echo "Installing Homebrew packages"

homebrew_packages=(
 "gh"
 "mysql"
 "php"
 "node"
 "mailpit"
 "mas"
 "pkg-config"
 "wp-cli"
)

for homebrew_package in "${homebrew_packages[@]}"; do
 brew install "$homebrew_package"
done

# Install Casks
echo "Installing Homebrew cask packages"

homebrew_cask_packages=(
  "appcleaner"
  "discord"
  "codekit"
  "firefox"
  "handbrake"
  "iterm2"
  "microsoft-edge"
  "poedit"
  "sequel-ace"
  "signal"
  "sketch"
  "transmit"
  "toggl-track"
  "tower"
  "transmission"
  "visual-studio-code"
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
  brew install "$homebrew_cask_package"
done

# Install MAS apps
echo "Installing App Store apps"
# Add affinity, color drop picker
mas install 905953485 #NordVPN
mas install 409183694 #Keynote
mas install 1254981365 #Contrast
mas install 904280696 #Things
mas install 1365531024 #1Blocker
mas install 409201541 #Pages
mas install 1529448980 #Reeder
mas install 409203825 #Numbers
mas install 1289583905 #Pixelmator Pro
mas install 1136220934 #Infuse

# Configure Tower to use PHP in git hooks: https://www.git-tower.com/help/guides/integration/environment/mac
cp ~/.dotfiles/environment.plist ~/Library/Application\ Support/com.fournova.Tower3/

# Install Composer
echo "Installing Composer"
curl -sS https://getcomposer.org/installer | php
mkdir -p /usr/local/bin/composer
mv composer.phar /usr/local/bin/composer
rm ~/.composer/config.json
ln -sf ~/.dotfiles/.composer/config.json ~/.composer/config.json
rm ~/.composer/composer.json
ln -sf ~/.dotfiles/.composer/composer.json ~/.composer/composer.json

# Install Global Composer Packages
echo "Installing Global Composer Packages"
composer global require laravel/installer statamic/cli

# Install Laravel Valet
echo "Installing Laravel Valet"
$HOME/.composer/vendor/bin/valet install
valet trust

# Create Sites directory
echo "Creating a Sites directory"
mkdir $HOME/Sites

# Start Mailpit for the first time
echo "Starting Mailpit for the first time"
brew services start mailpit

# Installing Global Node Dependecies
echo "Installing Global Node Dependecies"
npm install -g cross-env
npm install -g npm-check-updates

# Register the Global Gitignore file
git config --global core.excludesfile $HOME/.dotfiles/.gitignore_global

# Set nano as default editor.
git config --global core.editor "nano"

# Hide 'Last Logged In' in terminal
touch ~/.hushlogin

# Complete
echo "Installation Complete"
