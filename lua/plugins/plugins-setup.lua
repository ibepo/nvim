-- 自动安装packer插件
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
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
                border = "rounded"
            })
        end
    }
})

-- 配置插件
return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({"lewis6991/impatient.nvim"})
    use("EdenEast/nightfox.nvim")
    use 'folke/tokyonight.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use 'kyazdani42/nvim-web-devicons'
    use "nvim-lua/plenary.nvim"
    use 'goolord/alpha-nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'
    use 'kyazdani42/nvim-tree.lua'

    use "lukas-reineke/indent-blankline.nvim"
    -- use({
    --     "rafamadriz/friendly-snippets",
    --     event = "InsertEnter"
    -- })
    -- use({
    --     "hrsh7th/nvim-cmp",
    --     config = "require('plugins.configs.cmp')",
    --     after = "friendly-snippets"
    -- })
    -- use({
    --     "L3MON4D3/LuaSnip",
    --     after = "nvim-cmp"
    -- })
    -- use({
    --     "saadparwaiz1/cmp_luasnip",
    --     after = "LuaSnip"
    -- })
    -- use({
    --     "hrsh7th/cmp-nvim-lsp",
    --     after = "cmp_luasnip"
    -- })
    -- use({
    --     "hrsh7th/cmp-nvim-lua",
    --     after = "cmp-nvim-lsp"
    -- })
    -- use({
    --     "hrsh7th/cmp-buffer",
    --     after = "cmp-nvim-lua"
    -- })
    -- use({
    --     "hrsh7th/cmp-path",
    --     after = "cmp-buffer"
    -- })
    -- use({
    --     "hrsh7th/cmp-cmdline",
    --     after = "cmp-path"
    -- })

    -- use({"neovim/nvim-lspconfig"})
    -- use({"williamboman/nvim-lsp-installer"})
    -- use({
    --     "glepnir/lspsaga.nvim",
    --     branch = "main"
    -- })

    -- -- [ debug ]--
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
    --    use({"gcmt/wildfire.vim"})
    -- use({
    --     "j-hui/fidget.nvim",
    --     config = function()
    --         require("fidget").setup()
    --     end
    -- })
    -- -- [ format code ]--
    -- use({"jose-elias-alvarez/null-ls.nvim"})
    -- -- [ A super powerful autopair plugin for Neovim that supports multiple characters. ]--
    -- use({
    --     "windwp/nvim-autopairs",
    --     event = "InsertEnter",
    --     after = "nvim-cmp"
    -- })
    use({"nvim-lua/popup.nvim"})
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use "tpope/vim-surround"
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- -- [ History modification record ]--
    -- use({
    --     "mbbill/undotree",
    --     event = "InsertEnter"
    -- })
    -- use({"nathom/filetype.nvim"})
    -- use({
    --     "folke/trouble.nvim",
    --     cmd = "TroubleToggle",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function()
    --         require("trouble").setup({})
    --     end
    -- })
    -- -- Super fast git decorations implemented purely in lua/teal --
    -- use({
    --     "lewis6991/gitsigns.nvim",
    --     config = "require('plugins.configs.gitsigns')",
    --     event = "BufRead"
    -- })
    -- -- Git diff view
    -- use({
    --     "sindrets/diffview.nvim",
    --     config = "require('plugins.configs.diffview')",
    --     requires = "nvim-lua/plenary.nvim",
    --     cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewFocusFiles", "DiffviewToggleFiles",
    --            "DiffviewFileHistory"}
    -- })
    use 'nvim-telescope/telescope-media-files.nvim'
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope"
    })
    use({
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit"
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
