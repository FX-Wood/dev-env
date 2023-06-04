local Remap = require'fxwood.keymap'
local nnoremap = Remap.nnoremap

-- https://github.com/hrsh7th/nvim-cmp#setup
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
       window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
}

local lspconfig = require'lspconfig'

-- shamelessly stolen from:
-- https://github.com/ThePrimeagen/.dotfiles/blob/1f207bf4049402b50fdc871b979e850de0371f73/nvim/.config/nvim/after/plugin/lsp.lua#L89-L116
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require'cmp_nvim_lsp'.default_capabilities(),
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("gr", function() vim.lsp.buf.references() end)
        end
        }, _config or {})
end

lspconfig.tsserver.setup(config({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
        hostinfo = 'neovim'
    },
}))

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
lspconfig.lua_ls.setup(config({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
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
}))

lspconfig.pyright.setup(config())

