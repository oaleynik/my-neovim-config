return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		delay = function(ctx) return ctx.plugin and 0 or 500 end,
		spec = {
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "File" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Hunk" },
			{ "<leader>s", group = "Search" },
			{ "<leader>u", group = "UI" },
			{ "<leader>w", group = "Window" },
			{ "<leader>x", group = "Diagnostics" },
		},
	},
	keys = {
		{
			"<leader>?",
			function() require("which-key").show({ global = false }) end,
			desc = "Buffer Local Keymaps",
		},
	},
}
