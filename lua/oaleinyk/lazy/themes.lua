return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },

  {
    'EdenEast/nightfox.nvim',
    lazy = true,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = true,
  },

  {
    'savq/melange',
    lazy = true,
  },

  {
    'dracula/vim',
    lazy = true,
  },

  {
    'rose-pine/neovim',

    name = 'rose-pine',
    lazy = true,
    config = function ()
      require('rose-pine').setup({
        variant = 'moon', -- auto, main, moon, or dawn
        styles = {
          italic = false,
        },
      })
    end
  },

  {
    'catppuccin/nvim',

    lazy = true,
    name = 'catppuccin',
  },

  {
    'mcchrish/zenbones.nvim',

    lazy = true,
    name = 'zenbones',
    dependencies = {
      'rktjmp/lush.nvim'
    },
  },

  {
    'projekt0n/github-nvim-theme',

    lazy = true,
    config = function ()
      require('github-theme').setup()
    end
  },

  {
    'sainnhe/gruvbox-material',

    lazy = false,
    priority = 1000,
    config = function ()
      vim.g.gruvbox_material_background = 'hard' -- medium, hard
      vim.g.gruvbox_material_better_performance = 1
    end
  },

  {
    'sainnhe/everforest',

    lazy = true,
    config = function ()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_better_performance = 1
    end
  },
}

