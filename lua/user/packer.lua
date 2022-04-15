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
  use 'rhysd/vim-grammarous'
  use 'andymass/vim-matchup'
  use 'rhysd/git-messenger.vim'

  -- GitSigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
      })
    end
  }

  -- General dev
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/nvim-compe'
  use 'scrooloose/nerdcommenter'

  require'lspsaga'.init_lsp_saga {
    error_sign = '!',
    warn_sign = '^',
    hint_sign = '?',
    infor_sign = '~',
    border_style = 'round',
    code_action_prompt = {
      enable = false,
    }
  }

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

  -- JavaScript
  use { 'HerringtonDarkholme/yats.vim', ft = 'typescript' }
  use 'posva/vim-vue'
  use 'othree/javascript-libraries-syntax.vim'

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
