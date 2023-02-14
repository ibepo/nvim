-- Models
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",
local opts = {
	noremap = true,
	silent = true,
}
local term_opts = {
	silent = true,
}
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- 按屏幕行移动
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "gj", "j", opts)
keymap("n", "gk", "k", opts)

-- 'jk' key to exit insert mode --
keymap("i", "jk", "<Esc>", opts)
keymap("n", "o", "$a<cr><esc>", opts)
keymap("n", "x", '"_x', opts)

-- Better window navigation --
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- nvim-tree(toggle & focus) --
-- FileExpolre
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":NvimTreeFindFile<CR>", opts)
-- keymap("n", "<leader>i",":PackerSync<CR>", opts)

--maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

-- Better to save file & exit file --
-- keymap("n", "Q", ":q<CR>", opts)
-- keymap("n", "S", ":w<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "Q", ":wq!<CR>", opts)
keymap("n", "<leader>q", ":bd<CR>", opts)

-- Stay in indent mode --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

-- |s| could be easily replaced by |c|l| commands.
keymap("", "s", "<Nop>", opts)

-- Better split screen -
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<cr>", opts)

--better tabs
keymap("n", "<leader>to", ":tabnew<cr>", opts)
keymap("n", "<leader>tx", ":tabclose<cr>", opts)

-- Naviagate buffers --
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

--  Average adjustment window --
-- keymap("n", "<C-=>", "<C-w>=", opts)
--
-- Swap and move windows --
-- keymap("n", "<Space>h", "<C-w>H", opts)
-- keymap("n", "<Space>j", "<C-w>J", opts)
-- keymap("n", "<Space>k", "<C-w>K", opts)
-- keymap("n", "<Space>l", "<C-w>L", opts)

-- Adjust the direction of the split screen --
keymap("n", ",", "<C-w>t<C-w>K", opts)
keymap("n", ".", "<C-w>t<C-w>H", opts)

-- Resize the window --
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Better viewing of search results --
-- no highlight
-- keymap("n", "<leader>l", ":nohl<cr>", opts)
keymap("n", "<Space><CR>", ":nohlsearch<CR>", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Markdown preview --
keymap("n", "mp", ":MarkdownPreview<CR>", opts)

--  telscope -
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fa", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fh", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>fi", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>fm", ":Telescope harpoon marks<CR>", opts)
keymap("n", "<leader>fr", "<cmd> Telescope registers <CR>", opts)
keymap("n", "<leader>fs", ":Telescope lsp_document_symbols <CR>", opts)
keymap("n", "<leader>fd", ":Telescope lsp_document_diagnostics <CR>", opts)

-- trouble.nvim
keymap("n", "<leader>tr", ":TroubleToggle<CR>", opts)

-- keymap("n", "tg", ":SymbolsOutline<CR>", opts)
-- setup mapping to call :LazyGit
keymap("n", "<Leader>g", ":LazyGit<CR>", opts)
keymap("n", "<Leader>u", ":UndotreeToggle<CR>", opts)

-- debug
keymap("n", "<F6>", ":lua require('dapui').toggle()<CR>", opts)
keymap("n", "<C-b>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
-- msic --
-- keymap("n", "K", "5k", opts)
-- keymap("n", "J", "5j", opts)
-- keymap("n", "H", "7h", opts)
-- keymap("n", "L", "7l", opts)
-- keymap("v", "p", '"_dP', opts)

-- better pagescroll
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- To avoid weird vim original behaviour that would change your copy after
-- paste if another world was highlighted -> Now it just keeps it
keymap("x", "<leader>p", '"_dP', opts)

-- Delete to black void register (true delete)
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)

-- When activated, it access the plus register (the system clipboard) to copy
-- paste outside of neovim, leaving plain y usage for neovim exclusively
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>Y", '"+Y', opts)

-- Shorcut for searching and replacing (structure already written)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>", opts)
