return {
  "neovim/nvim-lspconfig",
  dependencies = {
    --Mason
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    --LSP
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",

    --Helm language server
    "qvalentin/helm-ls.nvim",

    --Notifications
    "j-hui/fidget.nvim",
  },
  config = function()
    -- Mason Setup
    require("mason").setup()

    -- Mason LSP/Formatting Tools/Auto Completion Setup
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )
    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    require("mason-tool-installer").setup({
      ensure_installed = {
        'prettier',
        'ruff'
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "angularls",
        "ruff",
        "lua_ls",
        "cssls",
        "tailwindcss"
      },
      lua_ls = function()
        require('lspconfig').lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT'
              },
              diagnostics = {
                globals = { 'vim', 'love' },
              },
              workspace = {
                library = {
                  vim.env.VIMRUNTIME,
                }
              }
            }
          }
        })
      end
    })

    -- Snippet setup
    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        -- ['<C-Space>'] = cmp.mapping.complete(),
      }),
      snippet = {
        expand = function(args)
          -- require('luasnip').lsp_expand(args.body)
        end,
      },
    })

    -- Helm LS Setup
    require("helm-ls").setup()

    -- Fidget Setup
    require("fidget").setup({})
  end
}
