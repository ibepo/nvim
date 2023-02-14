local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("没有找到 bufferline")
	return
end

bufferline.setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get(),
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		-- numbers = "buffer_id",
		numbers = "ordinal",
		-- indicator_style = "__",
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		-- indicator_style = "underline",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		-- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
				padding = 1,
			},
		},
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = { "", "" }, -- "slant" | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
})

local keymap = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
	silent = true,
}

for i = 1, 9 do
	keymap("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<cr>", opts)
end

keymap("n", "<leader>0", ":BufferLineGoToBuffer -1 <cr>", opts)
keymap("n", "gx", ":BufferLineCloseRight<cr>", opts)
