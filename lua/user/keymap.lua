vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b

-- Helper functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

map('', '<Space>', '<Nop>') 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

imap('jk', '<ESC>')

-- Sane regexes
nmap('/', '/\\v')
vmap('/', '/\\v')

-- Keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- Easy window split
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, move coursor to right pane

-- PLUGINS

-- Find files using Telescope command-line sugar
nmap('<C-p>', '<cmd>Telescope find_files<cr>')
nmap('<leader>f', '<cmd>Telescope live_grep<cr>')
nmap('<leader>bb', '<cmd>Telescope buffers<cr>')
nmap('<leader>hh', '<cmd>Telescope help_tags<cr>')

-- NvimTree
map('', '<C-k>b', '<cmd>NvimTreeToggle<cr>')
map('', '<leader>n', '<cmd>NvimTreeFocus<cr>')

-- Terminal
map('t', 'jk', '<C-\\><C-n>') -- exit terminal insert mode
map("t", "<leader>tt", '<C-\\><C-n> :FloatermToggle <CR>') -- toggle terminal
map("n", "<Leader>tt", ":FloatermToggle <CR>")
map("t", "<leader>t[", '<C-\\><C-n> :FloatermPrev <CR>') -- switch terminals
map("t", "<leader>t]", '<C-\\><C-n> :FloatermNext <CR>')
map("n", "<leader>t[", ':FloatermPrev <CR>')
map("n", "<leader>t]", ':FloatermNext <CR>')
map("n", "<Leader>tn", ":FloatermNew <CR>") -- open new terminal
map("n", "<Leader>td", ":FloatermKill <CR>") -- kill terminal

-- LazyGit
local lazygit_cmd = ":FloatermNew --height=0.9 --width=0.9 --wintype=float --name=lazygit --autoclose=2 lazygit <CR>"
map("n", "<leader>gg", lazygit_cmd)
map("n", "<leader>gb", ":G blame <CR>")

-- Emmet
vim.g.user_emmet_leader_key = '<leader>e'
