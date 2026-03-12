return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
    require("ibl").setup {
      exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = { "dashboard", "alpha", "starter", "lazy" },
      },
    }
    end,
}
