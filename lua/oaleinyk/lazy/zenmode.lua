return {
  'folke/zen-mode.nvim',

  dependencies = {
    'folke/twilight.nvim',
  },

  config = function ()
    require('zen-mode').setup({
      plugins = {
        gitsigns = { enabled = true; },
        kitty = { enabled = true; },
        tmux = { enabled = true; },
        twilight = { enabled = true; },
      },
    })

    -- vim.cmd [[
    --   autocmd User ZenModeEnter * ++once setlocal signcolumn=no
    --   autocmd User ZenModeLeave * ++once setlocal signcolumn=yes
    -- ]]

    vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<CR>', {
      noremap = true,
      silent = true,
    })
  end
}
