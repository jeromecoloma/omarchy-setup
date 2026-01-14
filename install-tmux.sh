#!/bin/bash

set -e 

# Install tmux
yay -S --noconfirm --needed tmux

# Verify installation
if command -v tmux >/dev/null 2>&1; then
    echo "tmux installed successfully."
    tmux -V
else
    echo "tmux installation failed."
    exit 1
fi



