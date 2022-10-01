vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
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

  -- LuaLine
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'

  -- Autopairs
  use { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup {} end }
  use { 'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup {} end }

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Emmet
  use 'mattn/emmet-vim'

  -- 'EditorConfig'
  use 'editorconfig/editorconfig-vim'

  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup { '*'; } end }

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
end)

return
