#!/bin/bash
set -e

# Install oh-my-posh
yay -S --noconfirm --needed oh-my-posh-bin

# Create config directory
mkdir -p "$HOME/.config/omp"

# Download star theme
curl -fsSL https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/star.omp.json \
    -o "$HOME/.config/omp/star.omp.json"

echo "Oh My Posh installed. Add to your .zshrc:"
echo '  eval "$(oh-my-posh init zsh --config ~/.config/omp/star.omp.json)"'
