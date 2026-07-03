#!/usr/bin/env bash

set -euo pipefail

echo "Updating system..."

sudo pacman -Syu --noconfirm

echo "Installing packages..."

packages=(
    # System Tools & Shell Enhancements
    base-devel btop bash-completion zip unzip unrar-free
    ntfs-3g uwsm libnewt less zsh zsh-completions 
    wl-clipboard dunst pipewire wireplumber udisks2 udiskie
    zsh eza bat fd fzf zoxide ripgrep stow starship fontconfig man-db tmux remmina freerdp
    power-profiles-daemon 
    # ghostty ghostty-nautilus

    # GNOME Desktop
    gnome-shell gdm gnome-session gnome-control-center
    gnome-settings-daemon nautilus gnome-keyring
    xdg-desktop-portal-gtk gvfs gtk3 gtk4 glib2
    qt5-wayland qt6-wayland

    # Themes
    nwg-look pop-gtk-theme pop-icon-theme inter-font

    # Graphics
    nvidia-dkms linux-headers nvidia-utils intel-media-driver

    # Hyprland
    hyprlock hypridle hyprpaper brightnessctl xdg-desktop-portal-hyprland

    # Networking
    networkmanager networkmanager-openconnect openconnect tor 

    # Multimedia
    mpv celluloid chromium yazi waybar loupe photoflare

    # Docker
    docker docker-compose lazydocker

    # Development
    base-devel lldb gdb pkgconf cmake rust rust-analyzer ollama 
    git github-cli lazygit neovim nvm
)

sudo pacman -S --needed --noconfirm "${packages[@]}"

echo "Running post-install scripts..."

source ./nopass-openconnect.sh
source ./defaults-mime.sh
source ./docker-setup.sh
source ./zsh-setup.sh

echo "Done."
