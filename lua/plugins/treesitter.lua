local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return print("not found tresitter")
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    -- ensure_installed = "all",
    ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "tsx", "python", "markdown", "toml",
                        "sql"},
    sync_install = false,
    ignore_install = {""}, -- List of parsers to ignore installing
    autopairs = {
        enable = true
    },
    -- 启用代码高亮功能
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {""}, -- list of language that will be disabled
        additional_vim_regex_highlighting = true
    },
    -- 智能选择代码块 
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>'
            --    scope_incremental = '<grm>'
        }
    },
    -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
    indent = {
        enable = true,
        disable = {""}
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
})
