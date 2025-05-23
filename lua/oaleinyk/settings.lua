HOME = os.getenv("HOME")

-- Basic settings
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = "menuone,noselect"
vim.o.history = 5000
vim.o.startofline = true
-- vim.o.mouse = 0

-- Mapping waiting time
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100
vim.o.updatetime = 1000

-- Display
vim.o.termguicolors = true
vim.o.showmatch = true -- show matching brackets
vim.o.scrolloff = 25 -- always show 3 rows from edge of the screen
vim.o.synmaxcol = 2000
vim.o.laststatus = 3 -- always show status line

vim.o.list = false
vim.o.foldenable = false
vim.o.foldlevel = 10 -- limit folding to 4 levels
vim.o.foldmethod = "manual" -- use language syntax to generate folds
vim.o.wrap = false
vim.o.eol = false -- show if there is no eol char
vim.o.showbreak = "↪" -- character to show when line is broken

-- Sidebar
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.signcolumn = "auto:6" -- keep 1 column for coc.vim check
vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar

-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ingore letter case when searching
vim.o.smartcase = true -- case insensitive unless capitals used in search
vim.o.matchtime = 2 -- delay before showing matching paren

-- White characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2 -- 1 tab = 2 spaces
vim.o.shiftwidth = 2 -- indent rule
vim.o.shiftround = true
vim.o.formatoptions = "qnj1" -- q - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab = true -- expand tab to spaces
vim.o.virtualedit = "onemore"

-- Backup files
vim.o.backup = false -- use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- do not use swap file
vim.o.undodir = HOME .. "/.vim/tmp/undo//" -- undo files
vim.o.backupdir = HOME .. "/.vim/tmp/backup//" -- backups
vim.o.directory = "/.vim/tmp/swap//" -- swap files

-- built-in plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1

-- Commands mode
vim.o.wildmenu = true -- on TAB, complete options for system command
vim.o.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

vim.o.winborder = "rounded"

-- Show cursorline only in current window and in normal mode
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

-- Restore cursor position when opening files
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	callback = function()
		local last_pos = vim.fn.line("'\"")
		if last_pos > 0 and last_pos <= vim.fn.line("$") then vim.cmd('normal! g`"') end
	end,
})
