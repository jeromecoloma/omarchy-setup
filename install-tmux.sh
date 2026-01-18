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

# Install TPM (Tmux Plugin Manager)
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM already installed."
fi

# Install tmux plugins
echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"



