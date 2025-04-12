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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			"saghen/blink.cmp",
		},

		config = function()
			require("mason").setup()

			local lspconfig = require("lspconfig")
			local mason_registry = require("mason-registry")
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			require("mason-lspconfig").setup({
				automatic_installation = true,

				ensure_installed = {
					"ast_grep",
					"biome",
					"cssls",
					"gopls",
					"html",
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"ts_ls",
					"volar",
					"yamlls",
					"zls",
				},

				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						lspconfig["lua_ls"].setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									hints = {
										enable = true,
									},
									telemetry = { enable = false },
								},
							},
						})
					end,

					["volar"] = function()
						lspconfig["volar"].setup({
							capabilities = capabilities,
							init_options = {
								vue = {
									hybridMode = false,
								},
							},
						})
					end,

					["ts_ls"] = function()
						lspconfig["ts_ls"].setup({
							capabilities = capabilities,
							init_options = {
								plugins = {
									{
										name = "@vue/typescript-plugin",
										location = vue_language_server_path,
										languages = { "vue" },
									},
								},
							},
							settings = {
								typescript = {
									inlayHints = {
										includeInlayParameterNameHints = "all",
										includeInlayParameterNameHintsWhenArgumentMatchesName = true,
										includeInlayFunctionParameterTypeHints = true,
										includeInlayVariableTypeHints = true,
										includeInlayVariableTypeHintsWhenTypeMatchesName = true,
										includeInlayPropertyDeclarationTypeHints = true,
										includeInlayFunctionLikeReturnTypeHints = true,
										includeInlayEnumMemberValueHints = true,
									},
								},
								javascript = {
									inlayHints = {
										includeInlayParameterNameHints = "all",
										includeInlayParameterNameHintsWhenArgumentMatchesName = true,
										includeInlayFunctionParameterTypeHints = true,
										includeInlayVariableTypeHints = true,
										includeInlayVariableTypeHintsWhenTypeMatchesName = true,
										includeInlayPropertyDeclarationTypeHints = true,
										includeInlayFunctionLikeReturnTypeHints = true,
										includeInlayEnumMemberValueHints = true,
									},
								},
							},
						})
					end,

					["gopls"] = function()
						lspconfig["gopls"].setup({
							capabilities = capabilities,
							settings = {
								gopls = {
									analyses = {
										unusedparams = true,
										shadow = true,
										nilness = true,
										unusedwrite = true,
									},
									hints = {
										rangeVariableTypes = true,
										parameterNames = true,
										constantValues = true,
										assignVariableTypes = true,
										compositeLiteralFields = true,
										compositeLiteralTypes = true,
										functionTypeParameters = true,
									},
									staticcheck = true,
									experimentalPostfixCompletions = true,
									gofumpt = true,
								},
							},
						})
					end,

					["rust_analyzer"] = function()
						lspconfig["rust_analyzer"].setup({
							capabilities = capabilities,
							settings = {
								["rust-analyzer"] = {
									check = {
										command = "clippy",
									},
									inlayHints = {
										bindingModeHints = {
											enable = false,
										},
										chainingHints = {
											enable = true,
										},
										closingBraceHints = {
											enable = true,
											minLines = 25,
										},
										closureReturnTypeHints = {
											enable = "never",
										},
										lifetimeElisionHints = {
											enable = "never",
											useParameterNames = false,
										},
										maxLength = 25,
										parameterHints = {
											enable = true,
										},
										reborrowHints = {
											enable = "never",
										},
										renderColons = true,
										typeHints = {
											enable = true,
											hideClosureInitialization = false,
											hideNamedConstructor = false,
										},
									},
								},
							},
						})
					end,
				},
			})

			vim.diagnostic.config({
				-- Use the default configuration
				-- virtual_lines = true,

				-- Alternatively, show virtual lines only for the current line
				virtual_lines = {
					current_line = true,
				},
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
				end,
			})
		end,
	},
}
