#!/bin/bash
set -e

# Install zsh if not present
if ! command -v zsh &>/dev/null; then
    yay -S --noconfirm --needed zsh
fi

# Set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    echo "Zsh set as default shell. Please log out and back in."
fi
