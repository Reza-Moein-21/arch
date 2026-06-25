#!/usr/bin/env bash

set -euo pipefail

echo "Installing OpenConnect sudoers rule..."

USERNAME="${SUDO_USER:-$USER}"
SUDOERS_FILE="/etc/sudoers.d/openconnect"

sudo tee "$SUDOERS_FILE" >/dev/null <<EOF
$USERNAME ALL=(root) NOPASSWD: /usr/bin/openconnect
$USERNAME ALL=(root) NOPASSWD: /usr/bin/pkill openconnect
EOF

sudo chmod 440 "$SUDOERS_FILE"

sudo visudo -c

echo "Done."
