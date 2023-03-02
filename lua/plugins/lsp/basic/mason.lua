local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

-- enable mason
mason.setup({
    keymaps = {
        -- Keymap to expand a package
        toggle_package_expand = "<CR>",
        -- Keymap to install the package under the current cursor position
        install_package = "i",
        -- Keymap to reinstall/update the package under the current cursor position
        update_package = "u",
        -- Keymap to check for new version for the package under the current cursor position
        check_package_version = "c",
        -- Keymap to update all installed packages
        update_all_packages = "U",
        -- Keymap to check which installed packages are outdated
        check_outdated_packages = "C",
        -- Keymap to uninstall a package
        uninstall_package = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>"
    }
})

local servers = {"pyright", "pylsp", "tsserver", "html", "cssls", "tailwindcss", "lua_ls", "emmet_ls", "clangd"}

-- 默认安装的语言服务器
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true
})

-- 我们需要调用lspconfig来将服务器传递给本机neovim lspconfig
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}
for _, server in pairs(servers) do
    opts = {
        -- getting "on_attach" and capabilities from handlers
        on_attach = require("plugins.lsp.basic.handlers").on_attach,
        capabilities = require("plugins.lsp.basic.handlers").capabilities
    }
    -- get the server name
    server = vim.split(server, "@")[1]
    -- pass them to lspconfig
    lspconfig[server].setup(opts)
end

-- 默认安装的null-ls服务器
-- list of formatters & linters for mason to install
mason_null_ls.setup({
    ensure_installed = {"prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d" -- ts/js linter
    },
    automatic_installation = true
})
