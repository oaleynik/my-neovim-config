return {
	{
		"echasnovski/mini.nvim",
		version = false,
		enabled = false,
		init = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.comment").setup()
			require("mini.move").setup()
			require("mini.pairs").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
		end,
	},
}
