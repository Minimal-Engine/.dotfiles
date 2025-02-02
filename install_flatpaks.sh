#!/bin/bash

# List of flatpaks to install
flatpak_apps=(
    org.gnome.World.PikaBackup
    net.ankiweb.Anki
    md.obsidian.Obsidian
    org.mozilla.Thunderbird
    org.freecad.FreeCAD
    org.gimp.GIMP
    org.videolan.VLC
    org.duckstation.DuckStation
    com.discordapp.Discord
    org.telegram.desktop 
    com.calibre_ebook.calibre
    com.yacreader.YACReader
    com.mattjakeman.ExtensionManager
    org.torproject.torbrowser-launcher
    org.keepassxc.KeePassXC
    net.pcsx2.PCSX2
    de.haeckerfelix.Shortwave
    com.transmissionbt.Transmission
    net.rpcs3.RPCS3
    io.bassi.Amberol
)

# Add Flathub remote repository if not added
if ! flatpak remote-list | grep -q "flathub"; then
    echo "Adding Flathub remote repository..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    if [ $? -ne 0 ]; then
        echo "Failed to add Flathub repository. Exiting."
        exit 1
    fi
fi

# Install each flatpak application
for app in "${flatpak_apps[@]}"; do
    echo "Installing $app..."
    flatpak install -y flathub "$app"
    if [ $? -eq 0 ]; then
        echo "$app installed successfully."
    else
        echo "Failed to install $app."
    fi
done

echo "All flatpaks installed successfully."
