# /bin/sh


# Script für meine Fedora-Installation

# zusätzliche Paketquellen hinzufügen:

## RPM-Fusion

echo "Adding RPM-Fusion Repo"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## Mullvad repo

echo "adding Mullvad Repo for VPN"
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo

## Virtualbox repo

echo "adding Virtual Box repo for Virtualbox"
sudo dnf config-manager addrepo --from-repofile=​https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

## Install additional packages

sudo dnf install google-chrome-stable nvim tmux alacritty nvim zsh stow git

# Dotfiles herunterladen:

## generate a new ssh key for the new machine and open firefox to add it to github

echo "Generating new ssh-keypair"
ssh-keygen -t ed25519 -C "d.rzeszutek@icloud.com" -f ~/.ssh/${USER}-${HOSTNAME}
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/${USER}-${HOSTNAME}
echo ""
echo "Copy this PublicKey:"
cat ~/.ssh/${USER}-${HOSTNAME}.pub

## open Firefox to add Public Key to GitHub

echo "Opening Github. Please add generated Key and quit Firefox afterwards."
firefox "https://github.com/settings/keys"

## install and configure git

sudo dnf install git
git config --global user.name|user.email "${USER}-${HOSTNAME}|d.rzeszutek@icloud.com"
git confing --global core.editor "vim"

## pull dotfiles

cd 
git clone git@github.com:Minimal-Engine/.dotfiles.git


# stow my dotfiles 

cd
cd dotfiles


# install my flatpaks

chmod +x install_my_flatpaks.sh
sh  ~/.dotfiles/install_my_flatpaks.sh

# set my desktop wallpaper

