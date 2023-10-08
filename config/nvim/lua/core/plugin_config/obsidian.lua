require("obsidian").setup({
	dir = "~/Marcelo/0_Notes/MarceloNotes/",
	completion = {
		nvim_cmp = true,
	},
})

vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianQuickSwitch<CR>", { noremap = true })
