#!/bin/bash
set -e

# Install openssh
echo "Installing openssh..."
yay -S --noconfirm --needed openssh

# Check if sshd is already running
if systemctl is-active --quiet sshd; then
    echo "sshd is already running."
else
    # Prompt before enabling sshd (security-sensitive)
    read -p "Would you like to enable SSH access to this machine? [y/N] " enable_response
    if [[ "$enable_response" =~ ^[Yy]$ ]]; then
        # Ensure UFW allows SSH
        if command -v ufw &>/dev/null; then
            echo "Ensuring UFW allows SSH..."
            sudo ufw allow ssh
        fi

        # Enable and start sshd
        echo "Enabling and starting sshd service..."
        sudo systemctl enable --now sshd

        # Verify sshd is running
        if systemctl is-active --quiet sshd; then
            echo "sshd is running successfully."
        else
            echo "Failed to start sshd."
            exit 1
        fi
    else
        echo "Skipping sshd setup."
    fi
fi

# Optional: Generate SSH key
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    read -p "Would you like to generate an SSH key? [y/N] " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        mkdir -p "$HOME/.ssh"
        ssh-keygen -t ed25519 -N "" -f "$HOME/.ssh/id_ed25519"
        echo "SSH key generated at ~/.ssh/id_ed25519"

        # Optional: Add to authorized_keys
        read -p "Add public key to authorized_keys for local SSH access? [y/N] " auth_response
        if [[ "$auth_response" =~ ^[Yy]$ ]]; then
            cat "$HOME/.ssh/id_ed25519.pub" >> "$HOME/.ssh/authorized_keys"
            chmod 600 "$HOME/.ssh/authorized_keys"
            echo "Public key added to authorized_keys."
        fi
    fi
else
    echo "SSH key already exists at ~/.ssh/id_ed25519"
fi
