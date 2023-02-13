local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnositcs = null_ls.builtins.diagnositcs

require("null-ls").setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua,
		formatting.black.with({ extra_args = { "--fast" } }),
	},
})
