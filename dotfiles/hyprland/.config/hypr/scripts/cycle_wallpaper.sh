#!/usr/bin/env bash
# cycle_wallpaper.sh - Simple wallpaper cycler

WALLPAPER_DIR="/usr/share/backgrounds/"
STATE_FILE="/tmp/hyprpaper_counter"

# Get all wallpapers (sorted alphabetically)
mapfile -t WALLPAPERS < <(find -L "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.webp" \) | sort)

TOTAL=${#WALLPAPERS[@]}

if [ $TOTAL -eq 0 ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

# Read current index, or start at 0
if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT=0
fi

# Move to next wallpaper (cycle back to 0 if at end)
NEXT=$(( (CURRENT + 1) % TOTAL ))

# Save the new index
echo "$NEXT" > "$STATE_FILE"

# Set the wallpaper on all monitors
hyprctl hyprpaper wallpaper ",${WALLPAPERS[$NEXT]}"
