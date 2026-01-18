#!/bin/bash
set -e

# Install shell tools referenced in .zshrc
yay -S --noconfirm --needed \
    fzf \
    wl-clipboard \
    xclip \
    yazi
