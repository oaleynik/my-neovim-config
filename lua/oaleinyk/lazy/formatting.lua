return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>mp",
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			javascript = { "biome", "prettierd", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", stop_after_first = true },
			typescript = { "biome", "prettierd", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", stop_after_first = true },
			json = { "biome", "prettierd", stop_after_first = true },
			jsonc = { "biome", "prettierd", stop_after_first = true },
			css = { "biome", "prettierd", stop_after_first = true },
			graphql = { "prettierd", stop_after_first = true },
			html = { "prettierd", stop_after_first = true },
			lua = { "stylua", stop_after_first = true },
			markdown = { "prettierd", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			vue = { "prettierd", stop_after_first = true },
			yaml = { "prettierd", stop_after_first = true },
		},
		formatters = {
			biome = {
				condition = function(_, ctx)
					return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
				end,
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
