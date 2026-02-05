return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		config = function()
			require("mini.ai").setup()
			require("mini.align").setup()
			require("mini.comment").setup()
			require("mini.diff").setup()
			require("mini.move").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
		end,
	},
}
