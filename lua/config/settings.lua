local HOME = os.getenv("HOME")

vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = "menuone,noselect"
vim.o.history = 5000
vim.o.startofline = true

vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100
vim.o.updatetime = 250

vim.o.termguicolors = true
vim.o.showmatch = true
vim.o.scrolloff = 25
vim.o.synmaxcol = 2000
vim.o.laststatus = 3

vim.o.list = false
vim.o.foldenable = false
vim.o.foldlevel = 10
vim.o.foldmethod = "manual"
vim.o.wrap = false
vim.o.eol = false
vim.o.showbreak = "↪"

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.signcolumn = "yes"
vim.o.modelines = 0
vim.o.showcmd = true

vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.matchtime = 2

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.formatoptions = "qnj1"
vim.o.expandtab = true
vim.o.virtualedit = "onemore"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = HOME .. "/.vim/tmp/undo//"
vim.o.backupdir = HOME .. "/.vim/tmp/backup//"
vim.o.directory = HOME .. "/.vim/tmp/swap//"

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1

vim.o.wildmenu = true
vim.o.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

vim.o.winborder = "rounded"

local cline = vim.api.nvim_create_augroup("Cursorline", { clear = true })
vim.api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
	group = cline,
	pattern = "*",
	callback = function() vim.wo.cursorline = false end,
})
vim.api.nvim_create_autocmd({ "WinEnter", "InsertLeave" }, {
	group = cline,
	pattern = "*",
	callback = function() vim.wo.cursorline = true end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 0 and last_pos <= vim.fn.line("$") then vim.cmd('normal! g`"') end
	end,
})
