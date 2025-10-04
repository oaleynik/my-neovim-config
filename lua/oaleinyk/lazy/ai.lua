return {
	"folke/sidekick.nvim",
	opts = {
		cli = {
			mux = {
				backend = "tmux",
				enabled = true,
			},
			tools = {
				amp = { cmd = { "amp" } },
			},
		},
	},
	keys = {
		{
			"<tab>",
			function()
				if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
			end,
			expr = true,
			desc = "Goto/Apply Next Edit Suggestion",
		},
		{
			"<leader>as",
			function() require("sidekick.cli").select({ filter = { installed = true } }) end,
			desc = "Select CLI",
		},
		{
			"<leader>ac",
			function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
			desc = "Sidekick Toggle Copilot",
		},
		{
			"<leader>aa",
			function() require("sidekick.cli").toggle({ name = "amp", focus = true }) end,
			desc = "Sidekick Toggle Amp",
		},
		{
			"<leader>at",
			function() require("sidekick.cli").send({ msg = "{this}" }) end,
			mode = { "x", "n" },
			desc = "Send This",
		},
		{
			"<leader>av",
			function() require("sidekick.cli").send({ msg = "{selection}" }) end,
			mode = { "x" },
			desc = "Send Visual Selection",
		},
		{
			"<leader>ap",
			function() require("sidekick.cli").prompt() end,
			mode = { "n", "x" },
			desc = "Sidekick Select Prompt",
		},
		{
			"<leader>at",
			function() require("sidekick.cli").toggle() end,
			mode = { "n", "x" },
			desc = "Sidekick Toggle",
		},
		{
			"<c-.>",
			function() require("sidekick.cli").focus() end,
			mode = { "n", "x", "i", "t" },
			desc = "Sidekick Switch Focus",
		},
	},
}
