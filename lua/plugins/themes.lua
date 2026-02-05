return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},

	{ "EdenEast/nightfox.nvim", lazy = true },

	{ "rebelot/kanagawa.nvim", lazy = true },

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = {
			variant = "auto",
			styles = { italic = false },
		},
	},

	{ "catppuccin/nvim", name = "catppuccin", lazy = true },

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = true,
		config = function() require("github-theme").setup() end,
	},
}
