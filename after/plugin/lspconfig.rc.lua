local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-h>'] = cmp.mapping.abort(),
    ['<C-l>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['C-b'] = cmp.mapping.scroll_docs(-4),
    ['C-f'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
  }, {
      { name = 'buffer', keyword_length = 6 },
    }),
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      preset = 'default',
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[api]',
        path = '[path]',
        luasnip = '[snip]',
      },
    },
  },
  experimental = {
    ghost_text = false,
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  end
end

-- Enable the following language servers
local servers = {
  -- 'tsserver',
  'html',
  'cssls',
  'jsonls',
  'rust_analyzer',
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Custom setup for golang LSP
lspconfig.gopls.setup {
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  -- for postfix snippets and analyzers
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        nilness = true,
        unusedwrite = true,
      },
      staticcheck = true,
    },
  },
  on_attach = on_attach,
}

local FNM_MULTISHELL_PATH = os.getenv('FNM_MULTISHELL_PATH')
local tslib_path = vim.fs.normalize(FNM_MULTISHELL_PATH .. '/lib/node_modules/typescript/lib')

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  init_options = {
    typescript = {
      tsdk = tslib_path,
    },
  },
}
