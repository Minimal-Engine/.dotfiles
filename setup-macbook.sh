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

# autohide the dock
defaults write com.apple.dock autohide -bool true

# generate a new pair of ssh-keys


# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# setup git and pull my .dotfiles



## stow my settings

## install the programms from my brewfile

## set the jpeg from my brewfiles as centered desktop background and adapt color settings



# set some programs to autostart and as permanent into the dock

# setup mpvacious for mpv and Anki

mkdir -p ~/.config/mpv/scripts/
git clone 'https://github.com/Ajatt-Tools/mpvacious.git' ~/.config/mpv/scripts/subs2srs
cd ~/.config/mpv/scripts/subs2srs && git pull