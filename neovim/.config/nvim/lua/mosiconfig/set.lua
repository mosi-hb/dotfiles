local o = vim.opt
local g = vim.g
local cmd = vim.cmd

-- Color scheme
cmd.colorscheme("onedark")

-- Use system keyboard for yank
o.clipboard = 'unnamedplus'

-- Indent configuration
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = false
o.wrap = false
o.incsearch = true -- Incremental search
o.ignorecase = true -- Case insensitive search (See below)
o.smartcase = true -- ^ Unless there is a capital letter

o.termguicolors = true

-- Nvim tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Line numbers
o.relativenumber = true
o.number = true -- Show current line number

-- Scrolling
o.scrolloff = 8
