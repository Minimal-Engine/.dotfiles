#!/bin/bash

# system-settings

## deactivate SIRI

## deavtivate STAGE-MANAGER

## set up hot corners

### lower left for desktop view

### top left for screen lock

## set up dock, on lower part, autohide, switch off animations.


# generate a new pair of ssh-keys


# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"



# setup git and pull my .dotfiles

## stow my settings

## install the programms from my brewfile

## set the jpeg from my brewfiles as centered desktop background

# set some programs to autostart and as permanent into the dock

# setup mpvacious for mpv and Anki

mkdir -p ~/.config/mpv/scripts/
git clone 'https://github.com/Ajatt-Tools/mpvacious.git' ~/.config/mpv/scripts/subs2srs
cd ~/.config/mpv/scripts/subs2srs && git pull