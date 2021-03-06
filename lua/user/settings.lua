HOME = os.getenv('HOME')

-- Basic settings
vim.o.encoding = 'utf-8'
vim.o.backspace = 'indent,eol,start'
vim.o.completeopt = 'menuone,noselect'
vim.o.history = 5000
vim.o.startofline = true

-- Mapping waiting time
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

-- Display
vim.o.showmatch = true -- show matching brackets
vim.o.scrolloff = 7 -- always show 3 rows from edge of the screen
vim.o.synmaxcol = 2000
vim.o.laststatus = 3 -- always show status line

vim.o.list = false
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.wrap = false
vim.o.eol = false -- show if there is no eol char
vim.o.showbreak = '↪' -- character to show when line is broken

-- Sidebar
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 3
vim.o.signcolumn = 'auto:3' -- keep 1 column for coc.vim check
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
vim.o.formatoptions = 'qnj1' -- q - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab = true -- expand tab to spaces

-- Backup files
vim.o.backup = false -- use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- do not use swap file
vim.o.undodir = HOME .. '/.vim/tmp/undo//' -- undo files
vim.o.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
vim.o.directory = '/.vim/tmp/swap//' -- swap files

-- Commands mode
vim.o.wildmenu = true -- on TAB, complete options for system command
vim.o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode
vim.cmd([[
  augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
  augroup END
]])

vim.cmd([[
  autocmd ColorScheme * highlight! link SignColumn LineNr
]])

-- Theme
local colorbuddy = require('colorbuddy')
local _, _, Group, groups, styles = colorbuddy.setup()

vim.o.termguicolors = true
vim.o.background = 'light'

colorbuddy.colorscheme('pencil', vim.o.background == 'light')

Group.new('CmpItemAbbr', groups.Comment)
Group.new('CmpItemAbbrDeprecated', groups.Error)
Group.new('CmpItemAbbrMatchFuzzy', groups.Comment.fg:dark(), nil, styles.italic)
Group.new('CmpItemKind', groups.Special)
Group.new('CmpItemMenu', groups.NonText)

--Goyo
vim.cmd([[
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
  autocmd User GoyoEnter set nocursorline
  autocmd User GoyoLeave set cursorline
  autocmd User GoyoEnter set noshowcmd
  autocmd User GoyoLeave set showcmd
  autocmd User GoyoEnter set tw=100
  autocmd User GoyoLeave set tw=0
  autocmd User GoyoEnter set wrap
  autocmd User GoyoLeave set nowrap
]])

vim.g.limelight_conceal_ctermfg = 'Gray'
vim.g.goyo_width = 120
vim.g.goyo_height = '95%'
vim.g.goyo_linenr = 1
