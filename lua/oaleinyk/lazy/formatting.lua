local js_stack_formatters = { "prettierd", "biome", stop_after_first = true }

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
			javascript = js_stack_formatters,
			javascriptreact = js_stack_formatters,
			typescript = js_stack_formatters,
			typescriptreact = js_stack_formatters,
			json = js_stack_formatters,
			jsonc = js_stack_formatters,
			css = js_stack_formatters,
			graphql = { "prettierd", stop_after_first = true },
			html = { "prettierd", stop_after_first = true },
			lua = { "stylua" },
			markdown = { "prettierd", stop_after_first = true },
			rust = { "rustfmt", lsp_format = "fallback" },
			vue = { "prettierd", stop_after_first = true },
			yaml = { "prettierd", stop_after_first = true },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
