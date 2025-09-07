return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		opts = {
			lspconfig = true,
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			"saghen/blink.cmp",
		},

		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
				ensure_installed = {
					"ast_grep",
					"biome",
					"cssls",
					"dprint",
					"golangci_lint_ls",
					"gopls",
					"html",
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"vtsls",
					"vue_ls",
					"yamlls",
					"zls",
				},
			})

			local function diagnostic_goto(next, severity)
				local count = next and 1 or -1
				return function() vim.diagnostic.jump({ count = count, severity = { min = severity } }) end
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function()
					local params = vim.lsp.util.make_range_params(vim.api.nvim_get_current_win(), "utf-16")

					local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								if r.kind == "source.organizeImports" then
									local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
									vim.lsp.util.apply_workspace_edit(r.edit, enc)
								end
							end
						end
					end
					vim.lsp.buf.format({ async = false })
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

					if client:supports_method("textDocument/definition") then
						vim.keymap.set(
							"n",
							"gd",
							function() vim.lsp.buf.definition({ reuse_win = true }) end,
							{ buffer = args.buf, desc = "Go to Definition" }
						)
					end

					if client:supports_method("textDocument/declaration") then
						vim.keymap.set(
							"n",
							"gD",
							function() vim.lsp.buf.declaration({ reuse_win = true }) end,
							{ buffer = args.buf, desc = "Go to Declaration" }
						)
					end

					-- Diagnostics by severity
					vim.keymap.set(
						"n",
						"]e",
						diagnostic_goto(true, vim.diagnostic.severity.ERROR),
						{ buffer = args.buf, desc = "Next Error" }
					)
					vim.keymap.set(
						"n",
						"[e",
						diagnostic_goto(false, vim.diagnostic.severity.ERROR),
						{ buffer = args.buf, desc = "Prev Error" }
					)
					vim.keymap.set(
						"n",
						"]w",
						diagnostic_goto(true, vim.diagnostic.severity.WARN),
						{ buffer = args.buf, desc = "Next Warning" }
					)
					vim.keymap.set(
						"n",
						"[w",
						diagnostic_goto(false, vim.diagnostic.severity.WARN),
						{ buffer = args.buf, desc = "Prev Warning" }
					)

					-- Line diagnostics
					vim.keymap.set(
						"n",
						"<leader>xx",
						function() vim.diagnostic.open_float(nil, { focus = false }) end,
						{ buffer = args.buf, desc = "Line Diagnostics" }
					)
				end,
			})
		end,
	},
}
