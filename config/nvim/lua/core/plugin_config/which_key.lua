local wk = require("which-key")
wk.register({
    s = { "Save" },
    ["<leader>j"] = { name = "+Jedi" },
    ["<leader>n"] = { "File Explorer" },
})

-- Show Wich Key
vim.keymap.set("n", "<space>", ":WhichKey<CR>")
