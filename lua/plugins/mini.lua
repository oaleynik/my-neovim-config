return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.bracketed").setup({
				diagnostic = { suffix = "" },
				file = { suffix = "" },
				old = { suffix = "" },
				window = { suffix = "" },
				yank = { suffix = "" },
			})
			require("mini.cursorword").setup()
			require("mini.move").setup()
			require("mini.operators").setup()
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
		end,
	},
}
