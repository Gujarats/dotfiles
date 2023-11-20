# ingore error continue command until finish
set -e
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
	nixpkgs.direnv \
    nixpkgs.nodePackages.npm

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
stow p10k

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# symlink zsh
rm -rf ~/.zshrc || true
rm -rf ~/.zshrc_plugins.txt || true
stow zsh || true
source ~/.zshrc || true

# install tmux plugin manager and its config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
rm -rf ~/.tmux.conf
stow tmux

# install vundle nvim plugin manager
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
#Packer nvim plguin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Use kitty terminal on MacOS
[ `uname -s` = 'Darwin' ] && stow kitty

# stow dotfiles
stow kitty
stow nvim
stow switchControl
stow vscodevimrc
