#!/bin/bash
set -e

# Install uv if not present
if ! command -v uv &>/dev/null; then
    yay -S --noconfirm --needed uv
fi
