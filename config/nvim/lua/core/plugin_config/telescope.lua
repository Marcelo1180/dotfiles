local builtin = require('telescope.builtin')

-- <c-p> just exclude .gitignore files and .git folder, you need to start git init
vim.keymap.set("n", "<c-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>po", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pt", builtin.help_tags, {})
