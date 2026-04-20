-- This is for formatters, this was an experiment to see if prettier could find the .prettierrc in my
-- project and format with it, though this didnt work for me and the formatter sometimes didnt format at
-- all so i just stuck with Conform

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-null-ls").setup({
      ensure_installed = { "prettier" },
      automatic_installation = true,
    })

    local null_ls = require("null-ls")
    local null_ls_h = require("null-ls.helpers")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          command = "npx",
          args = null_ls_h.range_formatting_args_factory({
            "prettier",
            "--stdin-filepath",
            "$FILENAME",
          }, "--range-start", "--range-end", { row_offset = -3, col_offset = -1 }),
        }),
      },
    })

    -- Auto-format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = args.buf,
        })
      end,
    })
  end
}
