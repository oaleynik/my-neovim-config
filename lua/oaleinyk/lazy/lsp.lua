return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
    'j-hui/fidget.nvim',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',

    {
      'nvimdev/lspsaga.nvim',

      dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
      },
    },
  },

  config = function()
    require('neodev').setup()
    require('fidget').setup({})
    require('mason').setup()

    local lspconfig = require('lspconfig')
    local cmplsp = require('cmp_nvim_lsp')

    require('mason-lspconfig').setup({
      ensure_installed = {
        'biome',
        'cssls',
        'gopls',
        'html',
        'lua_ls',
        'rust_analyzer',
        'tailwindcss',
        'tsserver',
        'volar@1.8.27',
        'zls',
        'yamlls',
      },

      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = cmplsp.default_capabilities(),
          })
        end,

        ['volar'] = function()
          lspconfig['volar'].setup({
            capabilities = cmplsp.default_capabilities(),
            filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
          })
        end,

        ['tsserver'] = function()
          lspconfig['tsserver'].setup({
            autostart = false,
            capabilities = cmplsp.default_capabilities(),
          })
        end,

        -- ['tsserver'] = function()
        --   lspconfig['tsserver'].setup({
        --     capabilities = cmplsp.default_capabilities(),
        --     init_options = {
        --       plugins = {
        --         {
        --           name = "@vue/typescript-plugin",
        --           location = "",
        --           languages = {"vue"},
        --         },
        --       },
        --     },
        --     filetypes = {
        --       "javascript",
        --       "javascriptreact",
        --       "javascript.jsx",
        --       "typescript",
        --       "typescriptreact",
        --       "typescript.tsx",
        --       "vue",
        --     },
        --   })
        -- end,

        ['gopls'] = function()
          lspconfig['gopls'].setup({
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
          })
        end,
      },
    })

    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

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
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-h>'] = cmp.mapping.abort(),
        ['<C-l>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
      }),

      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'path' },
          { name = 'luasnip' },
        },

        {
          {
            name = 'buffer',
            keyword_length = 6,
          },
        }
      ),

      formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        expandable_indicator = false,
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          preset = 'default',
          menu = {
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            luasnip = '[snip]',
          },
        }),
      },
    })

    local lspsaga = require('lspsaga')

    lspsaga.setup({
      lightbulb = {
        sign = false,
        debounce = 100,
      },
    })

    vim.diagnostic.config({
      virtual_text = false,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', '<space>ff', function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        vim.keymap.set({ 'n', 'v' }, '<leader>sa', '<cmd>Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '<leader>sp', '<cmd>Lspsaga peek_definition<CR>', opts)
        vim.keymap.set('n', '<leader>stp', '<cmd>Lspsaga peek_type_definition<CR>', opts)
        vim.keymap.set('n', '<leader>sg', '<cmd>Lspsaga goto_definition<CR>', opts)
        vim.keymap.set('n', '<leader>stg', '<cmd>Lspsaga goto_type_definition<CR>', opts)
        vim.keymap.set('n', '<leader>sf', '<cmd>Lspsaga finder<CR>', opts)
        vim.keymap.set('n', '<leader>sr', '<cmd>Lspsaga rename<CR>', opts)
        vim.keymap.set('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
        vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>', opts)
        vim.keymap.set('n', '<leader>so', '<cmd>Lspsaga outline<CR>', opts)
        vim.keymap.set('n', '<Leader>sci', '<cmd>Lspsaga incoming_calls<CR>', opts)
        vim.keymap.set('n', '<Leader>sco', '<cmd>Lspsaga outgoing_calls<CR>', opts)
        vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)

        vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)

        vim.keymap.set('n', '[e', function()
          require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, opts)

        vim.keymap.set('n', ']e', function()
          require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, opts)

        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
      end,
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = {only = {"source.organizeImports"}}

        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)

        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end

        vim.lsp.buf.format({async = false})
      end,
    })
  end
}
