return {
	"nvim-lua/plenary.nvim",
	"ryanoasis/vim-devicons",
	"tjdevries/colorbuddy.nvim",

	{
		"folke/todo-comments.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function() require("todo-comments").setup({}) end,
	},

	{
		"nvim-tree/nvim-web-devicons",

		config = function()
			require("nvim-web-devicons").setup({
				default = true,
				override = {},
			})
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",

		config = function() require("colorizer").setup({ "*" }) end,
	},

	{
		"tjdevries/cyclist.vim",

		config = function()
			vim.fn["cyclist#add_listchar_option_set"]("limited", {
				conceal = "┊",
				eol = "↲",
				extends = "<",
				nbsp = "␣",
				precedes = ">",
				tab = "» ",
				trail = "·",
			})

			vim.fn["cyclist#add_listchar_option_set"]("busy", {
				conceal = "┊",
				eol = "↲",
				extends = "☛",
				nbsp = "☠",
				precedes = "☚",
				space = "␣",
				tab = "»·",
				trail = "-",
			})

			vim.fn["cyclist#activate_listchars"]("limited")
		end,
	},

	{
		"windwp/nvim-ts-autotag",

		config = function() require("nvim-ts-autotag").setup() end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	},
}
