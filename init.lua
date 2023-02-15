require("plugins.plugins-setup")

-- [theme]--
-- require("plugins.catppuccin")
require("plugins.rose-pine")

-- [greeter,statuline,bufferline,fileExplore,markerlist]--
require("plugins.alpha")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.harpoon")
require("plugins.toggleterm")

-- [eshanced  edit]--
require("plugins.indent")
require("plugins.comment2")
require("plugins.autopairs")
require("plugins.illuminate")

--[[ Parsing engine ]]
-- better highlight and region select
require("plugins.treesitter")

-- [fuzzy finder,picker]--
require("plugins.telescope")

-- [lsp,you can AllinOne by lspzero or custermo by youself]--
require("plugins.lsp.lspzero")
-- require("plugins.lsp.mason")
-- require("plugins.lsp.lsp")
-- require("plugins.cmp")
-- require("plugins.lsp.lspsaga")
-- require("plugins.lsp.null-ls")
require("plugins.lsp.fidget")
require("plugins.lsp.aerial")
require("plugins.lsp.lsp-signature")
require("plugins.lsp.lsp-symbols-outline")

-- [git]--
require("plugins.gitsigns")
-- require("plugins.diffview")
--
-- [base]--
require("core")
require("plugins.misc")
require("plugins.bufferline")
require("plugins.neoscroll")
