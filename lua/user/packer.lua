-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Essentials
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'tjdevries/colorbuddy.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'voldikss/vim-floaterm'
  use 'tjdevries/cyclist.vim'
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'

  -- LuaLine
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Autopairs
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup{} end }
  use { 'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup{} end }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Zen
  use 'junegunn/limelight.vim'
  use 'junegunn/goyo.vim'

  -- Themes
  -- Light
  use 'morhetz/gruvbox'
  use 'NLKNguyen/papercolor-theme'
  use 'sainnhe/gruvbox-material'
  use 'sonph/onehalf'
  use 'sainnhe/everforest'
  use 'cocopon/iceberg.vim'
  use 'sainnhe/edge'
  use 'lifepillar/vim-gruvbox8'
  use 'rafi/awesome-vim-colorschemes'
  use 'altercation/vim-colors-solarized'
  use 'mcchrish/zenbones.nvim'
  use 'pbrisbin/vim-colors-off'
  use 'rakr/vim-one'
  use 'cormacrelf/vim-colors-github'
  use 'arzg/vim-colors-xcode'
  use 'FrenzyExists/aquarium-vim'
  use 'jsit/toast.vim'
  use 'lifepillar/vim-wwdc17-theme'
  use 'haystackandroid/shoji'
  use 'w0ng/vim-hybrid'

  --Dark
  use 'taDachs/kit.vim'
  use 'ayu-theme/ayu-vim'
  use 'sainnhe/everforest'
  use 'ocopon/iceberg.vim'
  use 'Rigellute/shades-of-purple.vim'
  use 'arcticicestudio/nord-vim'
  use 'bluz71/vim-nightfly-guicolors'
  use 'dracula/vim'
  use 'mbark-theme/vim'
  use 'sainnhe/sonokai'
  use 'sainnhe/edge'
  use 'tomasr/molokai'
  use 'sickill/vim-monokai'
  use 'haishanh/night-owl.vim'
  use 'rafi/awesome-vim-colorschemes'
end)
