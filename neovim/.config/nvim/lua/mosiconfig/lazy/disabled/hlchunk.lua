-- This is a replacement for indentblankline, it comes with animations though i have to configure it correctly
-- as it isnt very comfortable for me out of the box

return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        exclude_filetypes = {
          dashboard = true,
        },
        use_treesitter = true,
        error_sign = true,
        duration = 75,
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
        },
      }
    })
  end
}
