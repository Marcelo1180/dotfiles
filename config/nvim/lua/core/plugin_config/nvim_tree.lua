vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
