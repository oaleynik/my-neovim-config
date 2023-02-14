-- Theme
vim.o.background = 'dark'

-- vim.cmd [[colorscheme kanagawa]]

require('noirbuddy').setup {
  -- preset = 'minimal',
  -- preset = 'miami-nights',
  preset = 'kiwi',
  -- preset = 'slate',
  -- preset = 'crt-green',
  -- preset = 'crt-amber',
  styles = {
    italic = true,
    -- bold = true,
    -- underline = true,
    -- undercurl = true,
  },
  colors = {
    background = '#161616',
  },
}
