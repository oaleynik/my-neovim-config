-- Custom configuration rose-pine theme
require('rose-pine').setup({
  ---@usage 'main'|'moon'
  dark_variant = 'main',
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

-- Theme
local colorbuddy = require('colorbuddy')
local _, _, Group, groups, styles = colorbuddy.setup()

vim.o.termguicolors = true
vim.o.background = 'dark'

colorbuddy.colorscheme('melange', vim.o.background == 'light')

Group.new('CmpItemAbbr', groups.Comment)
Group.new('CmpItemAbbrDeprecated', groups.Error)
Group.new('CmpItemAbbrMatchFuzzy', groups.Comment.fg:dark(), nil, styles.italic)
Group.new('CmpItemKind', groups.Special)
Group.new('CmpItemMenu', groups.NonText)
