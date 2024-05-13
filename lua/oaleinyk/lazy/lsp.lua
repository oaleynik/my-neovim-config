return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		"j-hui/fidget.nvim",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		require("neodev").setup()
		require("fidget").setup({})
		require("mason").setup()

		local lspconfig = require("lspconfig")
		local cmplsp = require("cmp_nvim_lsp")
		local mason_registry = require("mason-registry")
		local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
			.. "/node_modules/@vue/language-server"

		local lsp_handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		require("mason-lspconfig").setup({
			ensure_installed = {
				"biome",
				"cssls",
				"gopls",
				"html",
				"lua_ls",
				"rust_analyzer",
				"tailwindcss",
				"tsserver",
				"volar",
				"yamlls",
				"zls",
			},

			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = cmplsp.default_capabilities(),
						handlers = lsp_handlers,
					})
				end,

				["volar"] = function()
					lspconfig["volar"].setup({
						capabilities = cmplsp.default_capabilities(),
						init_options = {
							vue = {
								hybridMode = false,
							},
						},
						handlers = lsp_handlers,
					})
				end,

				["tsserver"] = function()
					lspconfig["tsserver"].setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_language_server_path,
									languages = { "vue" },
								},
							},
						},
						capabilities = cmplsp.default_capabilities(),
						handlers = lsp_handlers,
					})
				end,

				["gopls"] = function()
					lspconfig["gopls"].setup({
						capabilities = cmplsp.default_capabilities(),
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
									shadow = true,
									nilness = true,
									unusedwrite = true,
								},
								staticcheck = true,
								experimentalPostfixCompletions = true,
								gofumpt = true,
							},
						},
						handlers = lsp_handlers,
					})
				end,
			},
		})

		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-h>"] = cmp.mapping.abort(),
				["<C-l>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "luasnip" },
			}, {
				{
					name = "buffer",
					keyword_length = 6,
				},
			}),

			formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = false,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					preset = "default",
					menu = {
						buffer = "[buf]",
						nvim_lsp = "[LSP]",
						path = "[path]",
						nvim_lua = "[api]",
						luasnip = "[snip]",
					},
				}),
			},
		})

		vim.diagnostic.config({
			virtual_text = false,
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>sl", function()
					vim.diagnostic.open_float({
						scope = "line",
						border = "rounded",
					})
				end, opts)
			end,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }

				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)

				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end

				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
