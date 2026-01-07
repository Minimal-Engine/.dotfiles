#!/bin/bash

#go to dotfiles directory
cd ~/.dotfiles

##stow the first part
stow alacritty
stow vim
stow yt-dlp
stow tmux 

##setup vundle and install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

## setup mpvacious 
mkdir -p ~/.config/mpv/scripts/
git clone 'https://github.com/Ajatt-Tools/mpvacious.git' ~/.config/mpv/scripts/subs2srs
cd ~/.dotfiles
stow mpvacious

## setup zsh and ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm ~/.zshrc
cd ~/.dotfiles
stow zsh