return {
  'nvim-treesitter/nvim-treesitter',

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
  },

  build = ':TSUpdate',

  config = function ()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      ensure_installed = {
        -- 'comment', -- comments are slowing down TS bigtime, so disable for now
        'css',
        'gitcommit',
        'gitignore',
        'go',
        'html',
        'http',
        'javascript',
        'lua',
        'markdown',
        'markdown_inline',
        'nix',
        'rust',
        'scss',
        'sql',
        'typescript',
        'vimdoc',
        'vue',
      },
      ignore_install = {},
      auto_install = true,
      sync_install = false,
      autopath = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      playground = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
        },
        move = {
          enable = true,
        },
      },
    })
  end
}
