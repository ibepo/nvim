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
    -- 必备-------------------------------------------------------
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use({"nvim-lua/popup.nvim"})
    use("nvim-lua/plenary.nvim")
    use({"nathom/filetype.nvim"})
    -- theme------------------------------------------------------
    use("rose-pine/neovim")
    use("EdenEast/nightfox.nvim")
    use("folke/tokyonight.nvim")
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })

    -- basic---------------------------------------------------------
    -- greeter,bufferline,statuline,fileExplore,indent,tmux navigation,smooth scroll,floatTerm
    use("kyazdani42/nvim-web-devicons")
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
    use("machakann/vim-sandwich")
    use({"windwp/nvim-autopairs"}) -- auto closing
    use("nacro90/numb.nvim")
    use("norcalli/nvim-colorizer.lua")
    use({"stevearc/dressing.nvim"})
    -- use 'machakann/vim-highlightedyank'
    -- use "tpope/vim-surround"
    -- use "tpope/vim-repeat"

    -- cmp--------------------------------------------------------------
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- snippets--------------------------------------------------------
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- source for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- LSP-------------------------------------------------------------
    use("neovim/nvim-lspconfig") ---enable LSP
    use({"williamboman/mason.nvim"})
    use({"williamboman/mason-lspconfig.nvim"}) -- bridges gap b/w mason & lspconfig
    use({"jose-elias-alvarez/null-ls.nvim"}) -- formatting & linting
    use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- LSP Enhancement---------------------------------------------------------
    use({
        "glepnir/lspsaga.nvim",
        branch = "main"
    })
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
    use({"j-hui/fidget.nvim"})
    use({"folke/trouble.nvim"})
    use("simrat39/symbols-outline.nvim")
    use({"ray-x/lsp_signature.nvim"})
    use({
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
            require("lsp-rooter").setup({})
        end
    })

    -- language servers--------------------------------------------------------
    -- use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
    -- use("simrat39/rust-tools.nvim") -- rust server

    -- lsp allinone------------------------------------------------------------
    -- use({
    --     "VonHeikemen/lsp-zero.nvim",
    --     branch = "v1.x",
    --     requires = { -- LSP Support
    --     {"neovim/nvim-lspconfig"}, -- Required
    --     {"williamboman/mason.nvim"}, -- Optional
    --     {"williamboman/mason-lspconfig.nvim"}, -- Optional
    --     -- Autocompletion
    --     {"hrsh7th/nvim-cmp"}, -- Required
    --     {"hrsh7th/cmp-nvim-lsp"}, -- Required
    --     {"hrsh7th/cmp-buffer"}, -- Optional
    --     {"hrsh7th/cmp-path"}, -- Optional
    --     {"saadparwaiz1/cmp_luasnip"}, -- Optional
    --     {"hrsh7th/cmp-nvim-lua"}, -- Optional
    --     -- Snippets
    --     {"L3MON4D3/LuaSnip"}, -- Required
    --     {"rafamadriz/friendly-snippets"} -- Optional
    --     }
    -- })
    -- Deug-------------------------------------------------------------------
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

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use({
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter"
    }) -- autoclose tags
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use({
        "andymass/vim-matchup",
        setup = function()
            vim.g.matchup_matchparen_offscreen = {
                method = "popup"
            }
        end
    })
    use("nvim-treesitter/playground")
    use("RRethy/vim-illuminate")

    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- History modification record----------------------
    use({"mbbill/undotree"})

    -- git------------------------------------------------
    use({
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit"
    })
    use({"lewis6991/gitsigns.nvim"})
    -- use({
    -- 	"f-person/git-blame.nvim",
    -- 	event = "BufRead",
    -- 	config = function()
    -- 		vim.cmd("highlight default link gitblame SpecialComment")
    -- 		vim.g.gitblame_enabled = 1
    -- 	end,
    -- })
    use({
        "sindrets/diffview.nvim",
        cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewRefresh", "DiffviewFocusFiles", "DiffviewToggleFiles",
               "DiffviewFileHistory"}
    })
    -- telescope-----------------------------------------
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make"
    })
    use("nvim-telescope/telescope-media-files.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope"
    })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
