#!/bin/sh

# Install zsh
if ! command -v zsh &>/dev/null; then
    yay -S --no-confirm --needed zsh
fi
