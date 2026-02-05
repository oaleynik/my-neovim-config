local map = vim.keymap.set

map("i", "jk", "<ESC>", { noremap = true, silent = true })

map({ "n", "v" }, "/", "/\\v")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("x", "<leader>p", '"_dP', { desc = "Paste without replacing register" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to Left Window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to Right Window" })
map("t", "jk", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
	pattern = "term://*",
	callback = function() vim.cmd("startinsert") end,
})

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map({ "i", "n", "s" }, "<esc>", function()
	vim.cmd("noh")
	return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>cp", function() vim.fn.setreg("+", vim.fn.expand("%:.")) end, { desc = "Copy relative path" })
map("n", "<leader>cP", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Copy absolute path" })

map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function()
	vim.treesitter.inspect_tree()
	vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
