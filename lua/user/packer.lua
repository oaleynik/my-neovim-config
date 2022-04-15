-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Essentials
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'

  -- General dev
  use 'scrooloose/nerdcommenter'
  use 'mattn/emmet-vim'

  -- Search
  use 'tpope/vim-eunuch'
  use 'tpope/vim-surround'

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua'

  -- LuaLine
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Themes
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
