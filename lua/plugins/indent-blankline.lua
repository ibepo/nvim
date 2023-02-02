vim.opt.list = true
vim.opt.listchars:append("space:⋅") --间隔用...
vim.opt.listchars:append("eol:↴") ---换行符用↴

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
