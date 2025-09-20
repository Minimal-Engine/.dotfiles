#!/bin/bash

# system-settings

## deactivate SIRI
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

## deavtivate STAGE-MANAGER
defaults write com.apple.WindowManager GloballyEnabled -bool false

## disable all hot-corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

## autohide the dock, remove recent apps
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool NO
killall Dock

## always hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true


# install brew, install oh-my-zsh, stow my settings, install programs from my brewfile
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## stow my macos settings
cd ~/.dotfiles
stow macos_config

## install the programms from my brewfile
brew bundle --file=~/Brewfile

## stow settings for installed programs
cd ~/.dotfiles
stow git
stow aerospace
stow alacritty
stow tmux

## setup vim

## setup zsh

## setup mpvacious for mpv and Anki
mkdir -p ~/.config/mpv/scripts/
git clone 'https://github.com/Ajatt-Tools/mpvacious.git' ~/.config/mpv/scripts/subs2srs
cd ~/.config/mpv/scripts/subs2srs && git pull

# setup ssh keys for github
chmod +x ~/.dotfiles/macos_scripts/mac_generate_keypair.sh
sh ~/.dotfiles/macos_scripts/mac_generate_keypair.sh
