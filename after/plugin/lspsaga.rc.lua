local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.setup {
  lightbulb = {
    sign = false,
    debounce = 100,
  },
}

local keymap = vim.keymap.set

keymap({ 'n', 't' }, '<A-d>', '<cmd>Lspsaga term_toggle<CR>')
keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
keymap('n', 'gh', '<cmd>Lspsaga finder<CR>')
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')
keymap('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')
keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')
keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')
keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')
keymap('n', '[E', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap('n', ']E', '<cmd>Lspsaga diagnostic_jump_next<CR>')
keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
keymap('n', '<Leader>ci', '<cmd>Lspsaga incoming_calls<CR>')
keymap('n', '<Leader>co', '<cmd>Lspsaga outgoing_calls<CR>')
keymap('n', '[e', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap('n', ']e', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

