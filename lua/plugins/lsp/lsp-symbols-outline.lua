local outline = require("symbols-outline")
local opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = "right",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = nil,
	auto_unfold_hover = true,
	fold_markers = { "", "" },
	wrap = false,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "@text.uri" },
		Module = { icon = "(Module)", hl = "@namespace" },
		Namespace = { icon = "(namespace)", hl = "@namespace" },
		Package = { icon = "(Package)", hl = "@namespace" },
		Class = { icon = "(Class)", hl = "@type" },
		Method = { icon = "(method)", hl = "@method" },
		Property = { icon = "", hl = "@method" },
		Field = { icon = "", hl = "@field" },
		Constructor = { icon = "constructor", hl = "@constructor" },
		Enum = { icon = "(Enum)", hl = "@type" },
		Interface = { icon = "(Interface)", hl = "@type" },
		Function = { icon = "(fun)", hl = "@function" },
		Variable = { icon = "(var)", hl = "@constant" },
		Constant = { icon = "(constant)", hl = "@constant" },
		String = { icon = "(string)", hl = "@string" },
		Number = { icon = "(number)", hl = "@number" },
		Boolean = { icon = "(boolean)", hl = "@boolean" },
		Array = { icon = "(Array)", hl = "@constant" },
		Object = { icon = "(Object)", hl = "@type" },
		Key = { icon = "(keys)", hl = "@type" },
		Null = { icon = "NULL", hl = "@type" },
		EnumMember = { icon = "(EnumMember)", hl = "@field" },
		Struct = { icon = "(Struct)", hl = "@type" },
		Event = { icon = "🗲", hl = "@type" },
		Operator = { icon = "+", hl = "@operator" },
		TypeParameter = { icon = "𝙏", hl = "@parameter" },
		Component = { icon = "", hl = "@function" },
		Fragment = { icon = "", hl = "@constant" },
	},
}
outline.setup(opts)