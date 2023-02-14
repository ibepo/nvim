local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local luasnip = require("luasnip")

------------------------------------------------------------------------------------------------------------
-- lsp_zero and lsp-config
------------------------------------------------------------------------------------------------------------

-- lspzero预设
lsp_zero.preset("recommended")
-- lspzero个性化
lsp_zero.set_preferences({
	-- 诊断标识
	sign_icons = {
		error = "",
		warn = "",
		hint = "",
		info = "",
	},
})

-- 需要lsp预安装的语言服务器
lsp_zero.ensure_installed({
	"tsserver",
	"html",
	"cssls",
	"rust_analyzer",
	"tailwindcss",
	"emmet_ls",
	"clangd",
})
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
-- Disables one or more language server
-- lsp_zero.skip_server_setup({'rust_analyzer'})

-- Using .setup_nvim_cmp() will allow you to override some options of nvim-cmp.
lsp_zero.setup_nvim_cmp({
	-- 设置感知来源的顺序和触发字符个数
	sources = {
		{
			name = "buffer",
			keyword_length = 3,
		},
		{
			name = "luasnip",
			keyword_length = 2,
		},
		{
			name = "nvim_lsp",
			keyword_length = 1,
		},
		{
			name = "path",
			keyword_length = 2,
		},
	},
	-- 左侧感知区UI
	-- Change the look
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				fuzzy_buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
		-- format = require("lspkind").cmp_format({
		-- 	mode = "symbol", -- show only symbol annotations
		-- 	maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		-- 	ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
		-- 	-- The function below will be called before any actual modifications from lspkind
		-- 	-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		-- 	before = function(entry, vim_item)
		-- 		return vim_item
		-- 	end,
		-- }),
	},
	-- 右侧文档UI
	documentation = {
		max_height = 25,
		max_width = 140,
		border = "rounded",
		col_offset = 0,
		side_padding = 1,
		winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
		zindex = 1001,
	},
})

-- the function below will be executed whenever
-- a language server is attached to a buffer
-- lsp_zero.on_attach(function(client, bufnr)
--     print('Greetings from on_attach')
-- end)

lsp_zero.setup()

------------------------------------------------------------------------------------------------------------
-- lsp_zero and null
------------------------------------------------------------------------------------------------------------

local null_ls = require("null-ls")
local null_opts = lsp_zero.build_options("null-ls", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		null_opts.on_attach(client, bufnr)

		-- Format buffer using only null-ls
		local format_cmd = function(input)
			vim.lsp.buf.format({
				id = client.id,
				timeout_ms = 5000,
				async = input.bang,
			})
		end

		local bufcmd = vim.api.nvim_buf_create_user_command

		bufcmd(bufnr, "NullFormat", format_cmd, {
			bang = true,
			range = true,
			desc = "Format using null-ls",
		})

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
	sources = { -- Replace these with the tools you have installed
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
	},
})

-- adapter between mason and null-ls
-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
	-- A list of sources to install if they're not alreadyinstalled.
	-- This setting has no relation with the `automatic_installation` setting.
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
	},
	-- Run `require("null-ls").setup`.
	-- Will automatically install masons tools based on selected sources in `null-ls`.
	-- Can also be an exclusion list.
	-- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
	automatic_installation = false,
	--   Automatic Setup is a need feature that removes the need to configure null-ls for supported sources. Sources found installed in mason will automatically be setup for null-ls.
	automatic_setup = false,
})

-- Required when `automatic_setup` is true
require("mason-null-ls").setup_handlers()
