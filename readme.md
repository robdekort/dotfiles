# Rob's Dotfiles

This repository contains my Dotfiles and anything else I use to setup and maintain my Macs. It simplifies the process of installing software on new Macs and it helps to keep my configuration the same on every machine I use.

Feel free to copy parts of this for your own dotfiles!

## Fresh macOS Setup

1. Update macOS to the latest version through the App Store
2. Install the Xcode CLI-tools using `xcode-select --install`
3. Clone this repository to `~/.dotfiles`
4. Run `sh install.sh` for all software
5. Run `sh macos.sh` for sane MacOS defaults
6. Login to all the things
7. Restore SSH key from 1Password
8. Authenticate Composer with GitHub: `composer config --global github-oauth.github.com token`
9. Restart Mac
