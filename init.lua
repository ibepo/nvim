require("plugins.plugins-setup")

-- [theme]--
require("plugins.catppuccin")
-- require("plugins.rose-pine")

-- [greeter,statuline,bufferline,fileExplore,markerlist]--
require("plugins.alpha")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.nvim-tree")
require("plugins.harpoon")

-- [eshanced  edit]--
require("plugins.indent")
require("plugins.comment2")
require("plugins.autopairs")

-- [better highlight and region select]--
require("plugins.treesitter")

-- [fuzzy finder,picker]--
require("plugins.telescope")

-- [lsp,you can AllinOne by lspzero or custermo by youself]--
require("plugins.lsp.lspzero")
-- require("plugins.lsp.mason")
-- require("plugins.lsp.lsp")
-- require("plugins.cmp")
-- require("plugins.lsp.lspsaga")
require("plugins.lsp.null-ls")

-- [git]--
require("plugins.gitsigns")
-- require("plugins.diffview")
-- [base]--
require("core")

