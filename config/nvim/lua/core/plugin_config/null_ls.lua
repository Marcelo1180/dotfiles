local lsp = require('lsp-zero')
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting

lsp.preset('recommended')

lsp.ensure_installed({
  'yapf',
  'prettier',
})


null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		formatting.yapf,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.completion.spell,
	},
})

vim.keymap.set("n", "f", ":lua vim.lsp.buf.format()<CR>")
vim.keymap.set("v", "f", ":lua vim.lsp.buf.format()<CR>")
lsp.setup()
vim.diagnostic.config({
  virtual_text = true
})
