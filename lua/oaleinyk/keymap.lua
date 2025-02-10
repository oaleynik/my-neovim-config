vim.cmd("noremap <C-b> :noh<cr>:call clearmatches()<cr>") -- clear matches Ctrl+b

-- Helper functions
local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map("n", shortcut, command)
end

local function imap(shortcut, command)
	map("i", shortcut, command)
end

local function vmap(shortcut, command)
	map("v", shortcut, command)
end

local function xmap(shortcut, command)
	map("x", shortcut, command)
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

imap("jk", "<ESC>")

-- Sane regexes
nmap("/", "/\\v")
vmap("/", "/\\v")

-- Keep search matches in the middle of the window
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- Keep half-screen movements centered
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

-- Paste in visual mode without replacing paste register
xmap("<leader>p", '"_dP')

-- Yank to system clipboard
nmap("<leader>y", '"+y')
vmap("<leader>y", '"+y')

-- Delete without update of paste register
nmap("<leader>d", '"_d')
vmap("<leader>d", '"_d')

-- Easy buffer navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Easy tabs management and navigation
nmap("<leader>tt", ":tabnew<CR>")
nmap("<leader>tx", ":tabclose<CR>")
nmap("]t", ":tabnext<CR>")
nmap("[t", ":tabprevious<CR>")

-- Reselect visual block after indent/outdent
vmap("<", "<gv")
vmap(">", ">gv")

-- Easily move lines in visual mode
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- Easy window split
nmap("vv", "<C-w>v")
nmap("ss", "<C-w>s")
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, move coursor to right pane
