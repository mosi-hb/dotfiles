vim.keymap.set('n', '<A-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-q>', ':bdelete<CR>', { noremap = true, silent = true })

--Show error/warning message on hover
vim.o.updatetime = 250  -- faster hover trigger

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
