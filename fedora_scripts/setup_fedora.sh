# /bin/sh

# setup fastest mirror and parrallel downloads in dnf config
echo "fastestmirror=True
max_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf

# setup rpmfusion repos
# see: https://rpmfusion.org/Configuration
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# install essential software

## Install keepassxc
sudo dnf install keepassxc -y

## add mullvad-repo and install it
sudo dnf config-manager addrepo --from-repofile=https://repository.mullvad.net/rpm/stable/mullvad.repo
sudo dnf install mullvad-vpn -y

## Install VSCode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code -y

## Install essential tools
sudo dnf install tldr mpv nvim tmux alacritty vim nvim zsh stow yt-dlp vlc keepassxc unison -y

## Install steam
sudo dnf install steam -y

## install and configure git
sudo dnf install git -y
git config --global user.name "${USER}-${HOSTNAME}"
git config --global user.email "d.rzeszutek@icloud.com"
git config --global core.editor "nvim"


# install and setup additional codecs, fw and hw-acceleration for amd
# see https://rpmfusion.org/Howto/Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld

sudo dnf install rpmfusion-free-release-tainted
sudo dnf install libdvdcss

sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf --repo=rpmfusion-nonfree-tainted install "*-firmware"

# pull my dotfiles and stow them
## pull public dotfiles repo
git clone Minimal-Engine/.dotfiles
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
stow ~/.dotfiles/zsh

# install flatpak and some flatpaks
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
chmod +x ~/.dotfiles/fedora_scripts/install_flatpaks.sh
~/.dotfiles/fedora_scripts/install_flatpaks.sh

# setup wallpaper
gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/$(whoami)/.dotfiles/wallpaper/minimal_wallpaper.jpg'