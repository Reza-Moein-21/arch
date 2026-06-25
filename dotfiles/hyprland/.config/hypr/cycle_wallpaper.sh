#!/usr/bin/env bash
# cycle_wallpaper.sh - Cycle through wallpapers (next or previous)
# Usage: ./cycle_wallpaper.sh [next|prev]

WALLPAPER_DIR="$HOME/.config/wallpapers"
STATE_FILE="/tmp/hyprpaper_counter"
DIRECTION="${1:-next}"  # Default to 'next'

# Get all wallpapers (sorted alphabetically)
mapfile -t WALLPAPERS < <(find -L "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.webp" \) | sort)

TOTAL=${#WALLPAPERS[@]}

if [ $TOTAL -eq 0 ]; then
    echo "No wallpapers found!"
    exit 1
fi

# Read current index, or start at 0
if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT=0
fi

# Calculate next/previous index
if [ "$DIRECTION" = "prev" ]; then
    NEXT=$(( (CURRENT - 1 + TOTAL) % TOTAL ))
else
    NEXT=$(( (CURRENT + 1) % TOTAL ))
fi

# Save the new index
echo "$NEXT" > "$STATE_FILE"

# Set the wallpaper
hyprctl hyprpaper wallpaper ",${WALLPAPERS[$NEXT]}"

echo "Wallpaper ${NEXT}/${TOTAL}: ${WALLPAPERS[$NEXT]}"
