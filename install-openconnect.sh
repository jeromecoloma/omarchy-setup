#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install openconnect and NetworkManager integration
echo "Installing OpenConnect VPN client..."
yay -S --noconfirm --needed openconnect networkmanager-openconnect libsecret

# Verify installation
if command -v openconnect &>/dev/null; then
    echo "OpenConnect installed successfully."
    openconnect --version
else
    echo "OpenConnect installation failed."
    exit 1
fi

# Install vpn-connect script to ~/bin
mkdir -p "$HOME/bin"
cp "$SCRIPT_DIR/bin/vpn-connect" "$HOME/bin/vpn-connect"
chmod +x "$HOME/bin/vpn-connect"

echo ""
echo "VPN wrapper script installed at ~/bin/vpn-connect"
echo ""
echo "Commands:"
echo "  vpn-connect <profile>          Connect to a VPN profile"
echo "  vpn-connect --add              Add a new profile"
echo "  vpn-connect --remove <p>       Remove a profile"
echo "  vpn-connect --set-password <p> Store password in keyring"
echo "  vpn-connect --list             List all profiles"
echo ""

# Prompt to add initial profile
read -p "Would you like to add a VPN profile now? [y/N] " add_response
if [[ "$add_response" =~ ^[Yy]$ ]]; then
    "$HOME/bin/vpn-connect" --add
    echo ""
    echo "To add more profiles later, run: vpn-connect --add"
fi
