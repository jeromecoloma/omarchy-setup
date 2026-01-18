# omarchy-setup

Setup scripts for Arch Linux shell environment.

## Quick Start

```bash
cd ~/omarchy-setup
./install-all.sh
```

## Individual Scripts

| Script | Description |
|--------|-------------|
| `install-all.sh` | Run all install scripts |
| `install-stow.sh` | GNU Stow (dotfile symlinks) |
| `install-eza.sh` | eza (modern ls replacement) |
| `install-tmux.sh` | tmux + TPM plugin manager |
| `install-zsh.sh` | zsh + plugins, set as default shell |
| `install-omp.sh` | Oh My Posh prompt with star theme |
| `install-shell-tools.sh` | fzf, wl-clipboard, xclip, yazi |
| `install-fonts.sh` | JetBrainsMono Nerd Font |

## Companion Repository

This project works alongside [omarchy-dotfiles](https://github.com/jeromecoloma/omarchy-dotfiles), which contains the actual dotfile configurations managed by GNU Stow.

## Requirements

- Arch Linux with `yay` AUR helper
- Git (for TPM clone)

## Notes

- Scripts use `--noconfirm --needed` for idempotent runs
- `install-zsh.sh` changes default shell (requires re-login)
- `install-omp.sh` prompts before modifying `.zshrc`
