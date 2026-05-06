return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        yaml = { "prettier" },
        json = { "prettier" }
      },
      --Format on save
      -- format_on_save = {
      --   lsp_fallback = true,
      --   timeout_ms = 3000,
      -- },
    })
  end,
}
