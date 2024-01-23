return {
  'folke/tokyonight.nvim',
  'EdenEast/nightfox.nvim',
  'rebelot/kanagawa.nvim',
  'savq/melange',
  'dracula/vim',

  {
    'rose-pine/neovim',

    name = 'rose-pine',

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

    name = 'catppuccin',
  },

  {
    'mcchrish/zenbones.nvim',

    dependencies = {
      'rktjmp/lush.nvim'
    },
  },
  
  {
    'projekt0n/github-nvim-theme',

    config = function ()
      require('github-theme').setup()
    end
  },

  {
    'sainnhe/gruvbox-material',

    config = function ()
      vim.g.gruvbox_material_background = 'hard' -- medium, hard
      vim.g.gruvbox_material_better_performance = 1
    end
  },

  {
    'sainnhe/everforest',

    config = function ()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_better_performance = 1
    end
  },
}

