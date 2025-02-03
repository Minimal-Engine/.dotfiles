# /bin/sh

# Script für meine Fedora-Installation

# zusätzliche Paketquellen hinzufügen:

## RPM-Fusion

echo "Adding RPM-Fusion Repo"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

## Mullvad repo and installation

echo "adding Mullvad Repo for VPN"
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install mullvad-vpn -y

## Install VSCode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code

## Install steam

sudo dnf install steam -y

## Install additional packages

sudo dnf install nvim tmux alacritty nvim zsh stow yt-dlp -y

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

sudo dnf install git -y
git config --global user.name "${USER}-${HOSTNAME}"
git config --global user.email "d.rzeszutek@icloud.com"
git config --global core.editor "nvim"

## pull dotfiles

cd ~
git clone git@github.com:Minimal-Engine/.dotfiles.git


# stow my dotfiles 

cd ~/.dotfiles


# install my flatpaks

chmod +x ~/.dotfiles/install_flatpaks.sh
sh  ~/.dotfiles/install_flatpaks.sh

# set up gnome
sudo dnf install gnome-tweaks -y
gsettings set org.gnome.desktop.background picture-uri file:/home/${USER}/.dotfiles/wallpapers/minimal_wallpaper.jpg