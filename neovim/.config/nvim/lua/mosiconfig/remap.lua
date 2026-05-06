--General keymaps
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<A-h>', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-q>', ':bdelete<CR>', { noremap = true, silent = true })

--Show error/warning message on hover
vim.o.updatetime = 250 -- faster hover trigger

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

--Base64 encoding/decoding
vim.keymap.set('x', "<leader>b", "<Plug>(FromBase64)")
vim.keymap.set('x', "<leader>B", "<Plug>(ToBase64)")

--Nvim Tree Toggling
local function nvimtree_toggle_or_focus()
  local api = require("nvim-tree.api")

  if vim.bo.filetype == "NvimTree" then
    -- If we are in the tree, unfocus
    vim.cmd("wincmd p")
  elseif api.tree.is_visible() then
    -- If tree is visible but we are not in it, focus it
    api.tree.focus()
  else
    -- If closed, open and focus
    api.tree.open()
    api.tree.focus()
  end
end

vim.keymap.set("n", "<C-b>", nvimtree_toggle_or_focus, { desc = "Toggle or focus NvimTree" })

-- Conform Formatting
vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
