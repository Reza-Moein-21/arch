#!/usr/bin/env bash

echo "config /etc/zsh/zshenv"

sudo tee /etc/zsh/zshenv >/dev/null <<'EOF'
if [[ -z "$XDG_CONFIG_HOME" ]]
then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]
then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
EOF

echo "Create required directories"

mkdir -p ~/.local/state/zsh   # history
mkdir -p ~/.cache/zsh         # completion cache

echo "All Done." 
