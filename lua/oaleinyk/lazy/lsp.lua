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
        { path = "snacks.nvim",        words = { "Snacks" } },
        { path = "lazy.nvim",          words = { "LazyVim" } },
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
          vim.keymap.set("n", "]e", function()
            vim.diagnostic.jump({
              count = 1,
              severity = { min = vim.diagnostic.severity.ERROR },
            })
          end, { desc = "Next Error" })
          vim.keymap.set("n", "[e", function()
            vim.diagnostic.jump({
              count = -1,
              severity = { min = vim.diagnostic.severity.ERROR },
            })
          end, { desc = "Prev Error" })

          vim.keymap.set("n", "]w", function()
            vim.diagnostic.jump({
              count = 1,
              severity = { min = vim.diagnostic.severity.WARN },
            })
          end, { desc = "Next Warning" })
          vim.keymap.set("n", "[w", function()
            vim.diagnostic.jump({
              count = -1,
              severity = { min = vim.diagnostic.severity.WARN },
            })
          end, { desc = "Prev Warning" })
        end,
      })
    end,
  },
}
