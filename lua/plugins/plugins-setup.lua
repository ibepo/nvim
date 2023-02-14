local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

---添加新插件后自动同步
vim.cmd([[
 augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins-setup.lua source <afile> | Packersync
 augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- 浮动UI
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
})

-- 配置插件
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")

	-- theme
	-- use({
	use("rose-pine/neovim")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	-- greeter,bufferline,statuline,fileExplore,indent,tmux navigation
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")
	use("goolord/alpha-nvim")
	use("nvim-lualine/lualine.nvim")
	use("akinsho/bufferline.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("lukas-reineke/indent-blankline.nvim")
	use("ThePrimeagen/harpoon")
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")
	use("karb94/neoscroll.nvim")
	use("akinsho/toggleterm.nvim")
	-- autocompletion
	-- use("hrsh7th/nvim-cmp") -- completion plugin
	-- use("hrsh7th/cmp-buffer") -- source for text in buffer
	-- use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-cmdline")
	-- use("hrsh7th/cmp-nvim-lsp")
	-- use("hrsh7th/cmp-nvim-lua")

	-- snippets
	-- use("L3MON4D3/LuaSnip") -- snippet engine
	-- use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	-- use("rafamadriz/friendly-snippets") -- useful snippets

	-- lsp
	-- managing & installing lsp servers, linters & formatters
	-- use({"williamboman/mason.nvim"})
	-- use({"williamboman/mason-lspconfig.nvim"}) -- bridges gap b/w mason & lspconfig
	-- configuring lsp servers
	-- use("neovim/nvim-lspconfig")

	--  enhanced lsp uis
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	}) -- A light-weight LSP plugin based on Neovim built-in LSP with highly a performant UI

	-- enhanced lsp uis
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use({ "j-hui/fidget.nvim" })
	use({ "folke/trouble.nvim" })
	-- formatting & linting
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	-- language servers
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("simrat39/rust-tools.nvim") -- rust server

	-- lsp allinone
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = { -- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	})
	-- deug
	-- use({
	--     "rcarriga/nvim-dap-ui",
	--     requires = {"mfussenegger/nvim-dap"},
	--     config = "require('plugins.configs.dapui')"
	-- })
	-- use({
	--     "leoluz/nvim-dap-go",
	--     ft = {"go"},
	--     config = function()
	--         require("dap-go").setup()
	--     end
	-- })

	-- enhanced edit
	use("machakann/vim-sandwich")
	use({ "windwp/nvim-autopairs" }) -- auto closing
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
	}) -- autoclose tags
	use({ "nvim-lua/popup.nvim" })
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")

	-- use 'machakann/vim-highlightedyank'
	-- use "tpope/vim-surround"
	-- use "tpope/vim-repeat"

	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- History modification record
	use({ "mbbill/undotree" })
	use({ "nathom/filetype.nvim" })

	-- git
	use({ "lewis6991/gitsigns.nvim" })
	use({
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewRefresh",
			"DiffviewFocusFiles",
			"DiffviewToggleFiles",
			"DiffviewFileHistory",
		},
	})
	-- telescope
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use("nvim-telescope/telescope-media-files.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
	})
	-- git
	use({
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
	})
	-- -- A neovim plugin to persist and toggle multiple terminals during an editing session--
	-- use({
	--     "akinsho/toggleterm.nvim",
	--     -- cmd = "ToggleTerm",
	--     config = "require('plugins.configs.toggleterm')"
	-- })
	-- use({
	-- 	"kristijanhusak/vim-dadbod-ui",
	-- 	config = "require('plugins.configs.vim-dadbod')",
	-- 	cmd = { "DBUI" },
	-- 	required = { "tpope/vim-dadbod" },
	-- })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
