require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
	},
	install = {
		colorscheme = { "habamax" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
