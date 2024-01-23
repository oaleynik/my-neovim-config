return {
  'nvim-lua/plenary.nvim',
  'mattn/emmet-vim',
  'tpope/vim-fugitive',
  'github/copilot.vim',
  'ryanoasis/vim-devicons',
  'tjdevries/colorbuddy.nvim',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  'tpope/vim-unimpaired',

  {
    'kyazdani42/nvim-web-devicons',

    config = function ()
      require('nvim-web-devicons').setup({
        default = true,
        override = {},
      })
    end
  },

  {
    'sourcegraph/sg.nvim',

    build = 'nvim -l build/init.lua',

    config = function ()
      require('sg').setup({})
    end
  },

  {
    'numToStr/Comment.nvim',

    config = function ()
      require('Comment').setup()
    end
  },

  {
    'norcalli/nvim-colorizer.lua',

    config = function ()
      require('colorizer').setup({ '*'; })
    end
  },

  {
    'tjdevries/cyclist.vim',

    config = function ()
      vim.fn['cyclist#add_listchar_option_set']('limited', {
        conceal = '┊',
        eol = '↲',
        extends = '<',
        nbsp = '␣',
        precedes = '>',
        tab = '» ',
        trail = '·',
      })

      vim.fn['cyclist#add_listchar_option_set']('busy', {
        conceal = '┊',
        eol = '↲',
        extends = '☛',
        nbsp = '☠',
        precedes = '☚',
        space = '␣',
        tab = '»·',
        trail = '-',
      })

      vim.fn['cyclist#activate_listchars']('limited')
    end
  },

  {
    'windwp/nvim-ts-autotag',

    config = function ()
      require('nvim-ts-autotag').setup()
    end
  },
}

