local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('oaleinyk.settings')
require('oaleinyk.keymap')
require('lazy').setup({
  spec = 'oaleinyk.lazy',

  change_detection = {
    notify = false,
  },
})

vim.o.background = 'dark'

vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme tokyonight-night')
-- vim.cmd('colorscheme catppuccin-latte')
-- vim.cmd('colorscheme melange')
-- vim.cmd('colorscheme kanagawa-lotus')
-- vim.cmd('colorscheme vimbones')
-- vim.cmd('colorscheme github_dark_dimmed')
-- vim.cmd('colorscheme gruvbox-material')
-- vim.cmd('colorscheme dayfox')
-- vim.cmd('colorscheme everforest')
-- vim.cmd('colorscheme dracula')
