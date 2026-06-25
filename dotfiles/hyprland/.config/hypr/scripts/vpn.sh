#!/usr/bin/env bash

declare -A VPN_SERVERS=(
    ["󰖂 Global"]="cmho.goodfst.com"
    ["󰖟 USA"]="cmhous.goodfst.com"
    ["󰕑 Netherlands"]="cmhonl.goodfst.com"
    ["󰇧 Canada"]="cmhoca.goodfst.com"
    ["󰀶 Turkey"]="cmhotr.goodfst.com"
    ["󰖠 Germany"]="cmhode.goodfst.com"
)

if pgrep -x openconnect >/dev/null; then
    CHOICE=$(printf "Disconnect VPN\nCancel" | wofi --dmenu --prompt "VPN")

    if [[ "$CHOICE" == "Disconnect VPN" ]]; then
        sudo pkill openconnect
        notify-send "VPN" "Disconnected"
    fi

    exit 0
fi

SERVER_NAME=$(
    printf "%s\n" "${!VPN_SERVERS[@]}" |
    sort |
    wofi --dmenu --prompt "VPN Server"
)

[[ -z "$SERVER_NAME" ]] && exit 0

VPN_HOST="${VPN_SERVERS[$SERVER_NAME]}"

notify-send "VPN" "Connecting to $SERVER_NAME"

echo -n "$VPN_PASS" | sudo openconnect \
    --user="$VPN_USER" \
    "$VPN_HOST" \
    --passwd-on-stdin
