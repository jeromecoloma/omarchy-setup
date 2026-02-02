#!/bin/bash
set -e

# Install Kubernetes tools
yay -S --noconfirm --needed \
    kubectl \
    kind \
    helm \
    k9s \
    kubectx \
    stern

echo "Kubernetes tools installed:"
echo "  kubectl  - Kubernetes CLI"
echo "  kind     - Local Kubernetes clusters"
echo "  helm     - Package manager"
echo "  k9s      - Terminal UI"
echo "  kubectx  - Context switcher (includes kubens)"
echo "  stern    - Multi-pod log tailing"
