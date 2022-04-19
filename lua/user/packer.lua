-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Essentials
  use 'kyazdani42/nvim-web-devicons'
  use 'mattn/emmet-vim'
  use 'nvim-lua/plenary.nvim'
  use 'ryanoasis/vim-devicons'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'voldikss/vim-floaterm'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

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
