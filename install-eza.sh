#!/bin/bash
set -e

# Install eza if not present
if ! command -v eza &>/dev/null; then
    yay -S --noconfirm --needed eza
fi
