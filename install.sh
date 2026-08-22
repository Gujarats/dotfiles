#!/usr/bin/env bash

# run from repo root so stow works regardless of cwd
cd "$(dirname "$0")" || exit 1

# install nix (skip if already installed)
command -v nix >/dev/null 2>&1 || curl -L https://nixos.org/nix/install | sh

# source nix (covers single-user and multi-user install layouts)
for f in \
  "$HOME/.nix-profile/etc/profile.d/nix.sh" \
  "/nix/var/nix/profiles/per-user/$USER/profile/etc/profile.d/nix.sh" \
  /etc/profile.d/nix.sh; do
  if [ -f "$f" ]; then
    . "$f"
    break
  fi
done

# install packages (skip ones already available)
need() { command -v "$2" >/dev/null 2>&1 || nix-env -iA "nixpkgs.$1"; }
need zsh     zsh
need git     git
need neovim  nvim
need tmux    tmux
need stow    stow
need yarn    yarn
need fzf     fzf
need ripgrep rg
need bat     bat
need gnumake make
need gcc     gcc
need direnv  direnv

zsh_path="$(command -v zsh)"

# add zsh as a login shell (avoid duplicate entries)
if [ -n "$zsh_path" ] && ! grep -qxF "$zsh_path" /etc/shells; then
  echo "$zsh_path" | sudo tee -a /etc/shells >/dev/null
fi

# use zsh as default shell (skip if already set)
if [ -n "$zsh_path" ] && [ "$(getent passwd "$USER" | cut -d: -f7)" != "$zsh_path" ]; then
  sudo chsh -s "$zsh_path" "$USER"
fi

# install p10k
[ -d "$HOME/powerlevel10k" ] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
stow p10k

# install oh-my-zsh (non-interactive)
[ -d "$HOME/.oh-my-zsh" ] || RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# symlink zsh
rm -f ~/.zshrc ~/.zshrc_plugins.txt
stow zsh || true
[ -n "$ZSH_VERSION" ] && . ~/.zshrc

# install tmux plugin manager and its config
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -f ~/.tmux.conf
stow tmux || true

# Use kitty terminal on MacOS
if [ "$(uname -s)" = 'Darwin' ]; then
  stow kitty
fi

# stow dotfiles
stow kitty
stow nvim
stow switchControl
stow vscodevimrc
stow gitconfig
