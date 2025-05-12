return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
  },

  {
    "oxfist/night-owl.nvim",
    lazy = true,
    config = function() require("night-owl").setup() end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- auto, main, moon, or dawn
        styles = {
          italic = false,
        },
      })
    end,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },

  {
    "mcchrish/zenbones.nvim",
    name = "zenbones",
    lazy = true,
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    init = function() require("github-theme").setup() end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
      local mod = require("gruvbox")
      local config = vim.tbl_extend("force", mod.config, { contrast = "hard" })

      mod.setup(config)
    end,
  },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_disable_italic_comment = 1
    end,
  },

  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      vim.g.everforest_background = "soft"
      vim.g.everforest_better_performance = 1
    end,
  },

  {
    "sainnhe/edge",
    lazy = true,
    config = function()
      vim.g.edge_style = "aura"
      vim.g.edge_better_performance = 1
    end,
  },

  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_style = "default"
      vim.g.sonokai_better_performance = 1
    end,
  },

  {
    "maxmx03/solarized.nvim",
    lazy = true,
    opts = {},
    config = function(_, opts) require("solarized").setup(opts) end,
  },

  {
    "vague2k/vague.nvim",
    lazy = true,
  },
}
