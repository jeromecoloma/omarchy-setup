#!/bin/bash
set -e

# Install rsync if not present
if ! command -v rsync &>/dev/null; then
    yay -S --noconfirm --needed rsync
fi
