return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		---@type TSConfig
		---@diagnostic disable:missing-fields
		opts = {
			auto_install = true,
			ignore_install = {
				"comment",
			},
			ensure_installed = {
				"css",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"http",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"nix",
				"rust",
				"scss",
				"sql",
				"typescript",
				"vimdoc",
				"vue",
			},
			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = { enable = true },
			playground = { enable = true },
		},
	},
}
