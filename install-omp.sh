#!/bin/bash
set -e

# Install oh-my-posh
yay -S --noconfirm --needed oh-my-posh-bin

# Create config directory
mkdir -p "$HOME/.config/omp"

# Download star theme
curl -fsSL https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/star.omp.json \
    -o "$HOME/.config/omp/star.omp.json"

OMP_INIT='eval "$(oh-my-posh init zsh --config ~/.config/omp/star.omp.json)"'

# Check if oh-my-posh is already in .zshrc
if grep -q "oh-my-posh init" "$HOME/.zshrc" 2>/dev/null; then
    echo "Oh My Posh already configured in .zshrc"
else
    echo "Oh My Posh is not configured in your .zshrc"
    read -p "Would you like to add it? [y/N] " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "" >> "$HOME/.zshrc"
        echo "# Oh My Posh prompt" >> "$HOME/.zshrc"
        echo "$OMP_INIT" >> "$HOME/.zshrc"
        echo "Added Oh My Posh to .zshrc. Restart your shell or run: source ~/.zshrc"
    else
        echo "Skipped. To add manually, put this in your .zshrc:"
        echo "  $OMP_INIT"
    fi
fi
