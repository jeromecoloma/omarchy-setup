#!/bin/bash
set -e

# Install MS Teams (optional)
read -p "Do you want to install MS Teams? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    yay -S --noconfirm --needed teams-for-linux
fi
