#!/usr/bin/env bash

echo "Setting default using xdg-mime"

xdg-mime default org.gnome.Nautilus.desktop inode/directory

xdg-mime default org.gnome.Loupe.desktop image/png image/jpeg image/webp image/gif image/bmp image/tiff image/avif image/heic image/svg+xml

echo "Done." 
