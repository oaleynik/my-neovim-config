local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {
  word_diff = true,
  on_attach = function(bufnr)
    local opts = { noremap = true, silent = true }

    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']h', '<cmd>lua require"gitsigns".next_hunk()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[h', '<cmd>lua require"gitsigns".prev_hunk()<CR>', opts)
  end
}
