local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" } -- fuzzy finder
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua' -- shows color code
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'Numkil/ag.nvim'
  use 'ryanoasis/vim-devicons'

  -- my personal plugin
  use 'morhetz/gruvbox'
  use 'folke/tokyonight.nvim'
  --use 'tpope/vim-fugitive'
  --use 'scrooloose/nerdtree'
  --use 'Xuyuanp/nerdtree-git-plugin'
  --use 'airblade/vim-gitgutter'
  --use 'yggdroot/indentline'
  --use 'jiangmiao/auto-pairs'
  --use 'mileszs/ack.vim'
  use 'sainnhe/gruvbox-material'

  --GO Language
  use 'fatih/vim-go'
  --use 'nsf/gocode', {'rtp': 'nvim/'}

  --terminal
  use 'gujarats/split-term.vim'
end)
