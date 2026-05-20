-- Color scheme
vim.cmd.colorscheme("onedark")

-- Use system keyboard for yank
vim.opt.clipboard = 'unnamedplus'

-- Indent configuration
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false

vim.opt.wrap = false

vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true

-- Nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.wo.relativenumber = true

-- Scrolling
vim.o.scrolloff = 8
