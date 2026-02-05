return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = { default = true },
	},

	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				css = true,
				tailwind = false,
				mode = "background",
			},
		},
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = false,
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module "render-markdown"
		---@type render.md.UserConfig
		opts = {},
	},
}
