#!/bin/bash

flatpak_apps=(
    org.gnome.World.PikaBackup
    net.ankiweb.Anki
    org.mozilla.Thunderbird
    org.freecad.FreeCAD
    org.gimp.GIMP
    org.duckstation.DuckStation
    com.discordapp.Discord
    org.telegram.desktop 
    com.calibre_ebook.calibre
    com.yacreader.YACReader
    com.mattjakeman.ExtensionManager
    org.torproject.torbrowser-launcher
    net.pcsx2.PCSX2
    de.haeckerfelix.Shortwave
    com.transmissionbt.Transmission
    net.rpcs3.RPCS3
    org.freefilesync.FreeFileSync
    com.github.tenderowl.frog
    io.bassi.Amberol
    org.libretro.RetroArch
    com.obsproject.Studio
    app.zen_browser.zen
)

# Add Flathub remote to user scope
if ! flatpak remote-list --user | grep -q "flathub"; then
    flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

for app in "${flatpak_apps[@]}"; do
    flatpak install --user -y flathub "$app"
done