# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv

# stow dotfiles
stow kitty
stow nvim
stow p10k
stow switchControl
stow tmux
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install vundle nvim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# install neovim plugins
nvim --headless +PlugInstall +qall

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty

