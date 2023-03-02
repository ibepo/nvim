local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return print("not found tresitter")
end

treesitter.setup({
	-- 安装 language parser
	-- :TSInstallInfo 命令查看支持的语言
	-- ensure_installed = "all",
	ensure_installed = {
		"lua",
		"tsx",
		"html",
		"json",
		"go",
		"help",
		"css",
		"vim",
		"javascript",
		"typescript",
		"python",
		"markdown",
		"markdown_inline",
		"toml",
		"sql",
	},
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
		-- [options]
	},
	indent = {
		enable = true,
		disable = { "" },
	},
	-- 启用代码高亮功能
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	-- 智能选择代码块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			-- scope_incremental = "<S-TAB>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
	-- p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#95ca60",
			"#ee6985",
			"#D6A760",
			"#7794f4",
			"#b38bf5",
			"#7cc7fe",
		},
		-- termcolors = { } -- table of colour name strings
	},
})
