return {
	{
		"echasnovski/mini.nvim",
		version = false,
		init = function()
			require("mini.move").setup()
			require("mini.splitjoin").setup()
			require("mini.surround").setup()
		end,
	},
}
