-- Custom configuration rose-pine theme
require('rose-pine').setup({
  ---@usage 'main'|'moon'
  dark_variant = 'moon',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,
  ---@usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },
  -- Change specific vim highlight groups
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})

require('catppuccin').setup({
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = 'italic',
    conditionals = 'italic',
    loops = 'NONE',
    functions = 'NONE',
    keywords = 'NONE',
    strings = 'NONE',
    variables = 'NONE',
    numbers = 'NONE',
    booleans = 'NONE',
    properties = 'NONE',
    types = 'NONE',
    operators = 'NONE',
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = 'italic',
        hints = 'italic',
        warnings = 'italic',
        information = 'italic',
      },
      underlines = {
        errors = 'underline',
        hints = 'underline',
        warnings = 'underline',
        information = 'underline',
      },
    },
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
  }
})

vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha

-- Theme
local colorbuddy = require('colorbuddy')
local _, _, Group, groups, styles = colorbuddy.setup()

vim.o.termguicolors = true
vim.o.background = 'dark'

colorbuddy.colorscheme('kanagawa', vim.o.background == 'light')

Group.new('CmpItemAbbr', groups.Comment)
Group.new('CmpItemAbbrDeprecated', groups.Error)
Group.new('CmpItemAbbrMatchFuzzy', groups.Comment.fg:dark(), nil, styles.italic)
Group.new('CmpItemKind', groups.Special)
Group.new('CmpItemMenu', groups.NonText)
