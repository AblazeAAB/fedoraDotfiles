#!/bin/bash

echo "=== Starting Arithra's Fedora Setup ==="

if [ -f "$HOME/.fedora-packages.txt" ]; then
    echo "Installing DNF packages..."
    sudo dnf install -y $(cat $HOME/.fedora-packages.txt)
fi

if [ -f "$HOME/.flatpak-apps.txt" ]; then
    echo "Installing Flatpak apps..."
    flatpak install -y flathub $(cat $HOME/.flatpak-apps.txt)
fi

if [ -f "$HOME/.gnome-extensions-settings.ini" ]; then
    echo "Restoring GNOME extension configurations..."
    dconf load /org/gnome/shell/extensions/ < $HOME/.gnome-extensions-settings.ini
fi

echo "=== Setup complete! Please restart your GNOME session or reboot. ==="

if [ -f "$HOME/.gnome-interface-settings.ini" ]; then
    echo "Restoring GNOME look and feel..."
    dconf load /org/gnome/desktop/interface/ < $HOME/.gnome-interface-settings.ini
fi
