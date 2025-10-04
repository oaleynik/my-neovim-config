return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				"snippet_forward",
				function() return require("sidekick").nes_jump_or_apply() end,
				"fallback",
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
