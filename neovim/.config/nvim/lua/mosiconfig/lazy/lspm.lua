return { 
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Mason Setup
      require("mason").setup() 

      -- Mason LSP Config Setup
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ngserver",
          "tsserver",
          "ruff",
          "lua_ls"
        }
      }) 
    end
}
