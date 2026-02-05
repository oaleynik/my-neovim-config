return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				"snacks.nvim",
				"lazy.nvim",
			},
		},
	},

	{ "mason-org/mason.nvim", opts = {} },

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
			ensure_installed = {
				"ast_grep",
				"biome",
				"cssls",
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
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local function diagnostic_goto(next, severity)
				local count = next and 1 or -1
				return function() vim.diagnostic.jump({ count = count, severity = { min = severity } }) end
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.go",
				callback = function(args)
					local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/codeAction" })
					if #clients == 0 then return end

					local encoding = clients[1].offset_encoding or "utf-16"
					local params = vim.lsp.util.make_range_params(0, encoding)
					params.context = { only = { "source.organizeImports" } }

					local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 3000)
					for cid, res in pairs(result or {}) do
						for _, r in pairs(res.result or {}) do
							if r.edit then
								local client = vim.lsp.get_client_by_id(cid)
								local enc = client and client.offset_encoding or encoding
								vim.lsp.util.apply_workspace_edit(r.edit, enc)
							elseif r.command then
								vim.lsp.buf.execute_command(r.command)
							end
						end
					end
					vim.lsp.buf.format({ async = false })
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(args)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
					end

					map("n", "]e", diagnostic_goto(true, vim.diagnostic.severity.ERROR), "Next Error")
					map("n", "[e", diagnostic_goto(false, vim.diagnostic.severity.ERROR), "Prev Error")
					map("n", "]w", diagnostic_goto(true, vim.diagnostic.severity.WARN), "Next Warning")
					map("n", "[w", diagnostic_goto(false, vim.diagnostic.severity.WARN), "Prev Warning")
					map("n", "<leader>xx", function() vim.diagnostic.open_float({ focus = false }) end, "Line Diagnostics")
					map("n", "<leader>q", function() vim.diagnostic.setqflist() end, "Diagnostics to qflist")
				end,
			})
		end,
	},
}
