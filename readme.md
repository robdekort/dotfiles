# Rob's Dotfiles

This repository contains my Dotfiles and anything else I use to setup and maintain my Macs. It simplifies the process of installing software on new Macs and it helps to keep my configuration the same on every machine I use.

Feel free to copy parts of this for your own dotfiles!

## Fresh macOS Setup
### Before re-installing
First go through this checklist to make sure you don't forget anything before wiping clean your hard drive.

* [ ] Have you committed and pushed any changes/branches to Github?
* [ ] Have you remembered to run `mackup backup`?
* [ ] Has iCloud Drive finished syncing?
* [ ] Have you exported any databases that need to be exported and put them somewhere useful?

### Setting up your Mac
Now that you've made sure you've done all the things, setup your mac!

1. Update macOS to the latest version through the App Store
2. Install the Xcode CLI-tools using `xcode-select --install`
3. Clone this repository to `~/.dotfiles`
4. Run `sh install.sh` for all software
5. Run `sh macos.sh` for sane MacOS defaults
6. Login to all the things
7. Restore settings for apps by running `mackup restore`
8. Restore SSH key from 1Password
9. Restart Mac to make sure everything works

## ❤️
This is 100% inspired by the brilliant [Duncan](https://github.com/duncanmcclean/dotfiles).
