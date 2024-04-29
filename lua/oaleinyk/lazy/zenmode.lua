return {
	"folke/zen-mode.nvim",

	lazy = true,

	dependencies = {
		"folke/twilight.nvim",
	},

	config = function()
		require("zen-mode").setup({
			plugins = {
				gitsigns = { enabled = true },
				kitty = { enabled = true },
				tmux = { enabled = true },
				twilight = { enabled = true },
			},
		})

		vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>", {
			noremap = true,
			silent = true,
		})
	end,
}
