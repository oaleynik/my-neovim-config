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
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'

  -- Comments
  -- use 'tpope/vim-commentary'
  use { 'numToStr/Comment.nvim' }

  -- LSP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind.nvim'
  use { 'glepnir/lspsaga.nvim', branch = 'main' }
  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'

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

  -- Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- AI
  use 'github/copilot.vim'
  use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'leoluz/nvim-dap-go'

  -- Themes
  use 'EdenEast/nightfox.nvim'
  use 'folke/tokyonight.nvim'
  use { 'projekt0n/github-nvim-theme' }
  use 'rebelot/kanagawa.nvim'
  use 'savq/melange'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
  use { 'sonph/onehalf', rtp = 'vim' }
  use 'sainnhe/gruvbox-material'
  use 'sainnhe/everforest'
  use 'navarasu/onedark.nvim'
  use 'dracula/vim'
end)

return
