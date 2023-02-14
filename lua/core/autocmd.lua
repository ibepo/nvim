-- Revert to where the cursor was when the file was last closed
vim.cmd([[autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif]])

vim.cmd([[set iskeyword+=-]])
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- about fold
-- vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
-- vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])

-- set bg transparent
-- vim.cmd([[autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE]])

--
-- vim.cmd(
-- 	[[autocmd BufWritePre *.go :silent! lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })]]
-- )
-- vim.cmd([[autocmd BufWritePre *.go :silent! lua vim.lsp.buf.format()]])

vim.cmd([[autocmd FileType go nnoremap <buffer> <F5> :TermExec cmd="go run main.go" <CR>]])

-- vim.cmd [[colorscheme tokyonight-moon]]
-- vim.cmd("colorscheme nightfox")
--

local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
	clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

---- 用o换行不要延续注释
autocmd("BufEnter", {
	group = myAutoGroup,
	pattern = "*",
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions
			- "o" -- O and o, don't continue comments
			+ "r" -- But do continue when pressing enter.
	end,
})

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
	group = myAutoGroup,
	command = "startinsert",
})

-- nvim-tree 自动关闭
autocmd("BufEnter", {
	nested = true,
	group = myAutoGroup,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})
