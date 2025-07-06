local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("oaleinyk.settings")
require("oaleinyk.keymap")
require("lazy").setup({
	spec = "oaleinyk.lazy",
	change_detection = {
		enabled = true,
		notify = false,
	},
	checker = { enabled = true },
})

vim.o.background = "dark"

-- vim.cmd("colorscheme catppuccin-latte")
-- vim.cmd("colorscheme duskfox")
-- vim.cmd("colorscheme edge")
-- vim.cmd("colorscheme everforest")
-- vim.cmd("colorscheme github_dark_default")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme night-owl")
-- vim.cmd("colorscheme onedark")
vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme solarized")
-- vim.cmd("colorscheme sonokai")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme zenwritten")
-- vim.cmd("colorscheme vague")
