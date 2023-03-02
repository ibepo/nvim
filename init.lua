require("plugins.plugins-setup")
require("plugins.filetype")

-- [theme]--
-- require("plugins.catppuccin")
require("plugins.rose-pine")

-- [greeter,statuline,bufferline,fileExplore,markerlist]--
require("plugins.alpha")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.harpoon")
require("plugins.toggleterm")

-- [eshanced edit]--
require("plugins.indent")
require("plugins.comment2")
require("plugins.autopairs")
require("plugins.illuminate")

-- [ Parsing engine]
require("plugins.treesitter")

-- [fuzzy finder,picker]--
require("plugins.telescope")

-- [lsp]--
require("plugins.lsp")

-- [git]--
require("plugins.gitsigns")
-- require("plugins.diffview")

-- [base]--
require("core")
require("plugins.misc")
require("plugins.bufferline")
require("plugins.neoscroll")
require("plugins.dressing")
