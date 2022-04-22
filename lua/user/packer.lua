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
  use 'rktjmp/lush.nvim'
  use 'morhetz/gruvbox'
  use 'altercation/vim-colors-solarized'
  use 'NLKNguyen/papercolor-theme'
  use 'sickill/vim-monokai'
  use 'challenger-deep-theme/vim'
  use 'arzg/vim-colors-xcode'
  use 'ghifarit53/tokyonight-vim'
  use 'google/vim-colorscheme-primary'
  use 'dikiaap/minimalist'
  use 'endel/vim-github-colorscheme'
  use 'mcchrish/zenbones.nvim'
  use 'owickstrom/vim-colors-paramount'
  use 'logico/typewriter'
  use 'axvr/photon.vim'
  use 'ajgrf/parchment'
  use 'rafi/awesome-vim-colorschemes'
  use 'matveyt/vim-modest'
  use 'christophermca/meta5'
end)
