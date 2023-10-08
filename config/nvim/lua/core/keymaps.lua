-- Clean search
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')

-- copy to clipboard
vim.keymap.set('v', '<C-c>', [["+y]])

-- save
vim.keymap.set("n", "s", ":w<CR>")

-- copy
vim.keymap.set("v", "<C-c>", [["+y]])

-- clean search highlighting
vim.keymap.set("v", "<leader><space>", ":noh<CR>")

-- Code indentation
vim.keymap.set("n", "<tab>", ">>")
vim.keymap.set("n", "<s-tab>", "<<")
vim.keymap.set("x", "<tab>", ">gv")
vim.keymap.set("x", "<s-tab>", "<gv")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move lines
vim.keymap.set("n", "H", "b")
vim.keymap.set("n", "L", "w")
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")

-- Undo/Redo
vim.keymap.set("n", "u", ":undo<CR>")
vim.keymap.set("n", "U", ":redo<CR>")

vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

-- reload config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
