local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Essentials
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'tjdevries/colorbuddy.nvim'
  use 'tjdevries/cyclist.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup {} end }

  -- LuaLine
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- Autopairs
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Emmet
  use 'mattn/emmet-vim'

  -- 'EditorConfig'
  use 'editorconfig/editorconfig-vim'

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Themes
  use 'EdenEast/nightfox.nvim'
  use 'Konstantin8105/gomin'
  use 'NLKNguyen/papercolor-theme'
  use 'elvessousa/sobrio'
  use 'folke/tokyonight.nvim'
  use 'gosukiwi/vim-atom-dark'
  use 'jacoborus/tender.vim'
  use 'joshdick/onedark.vim'
  use 'pbrisbin/vim-colors-off'
  use 'preservim/vim-colors-pencil'
  use 'projekt0n/github-nvim-theme'
  use 'rebelot/kanagawa.nvim'
  use 'rockerBOO/boo-colorscheme-nvim'
  use 'savq/melange'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }
end)

return
