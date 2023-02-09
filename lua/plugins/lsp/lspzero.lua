local lsp = require('lsp-zero')
lsp.preset('recommended')
ensure_installed = {"pyproject-flake8", "tsserver", "html", "cssls", "rust_analyzer", "tailwindcss", "sumneko_lua",
                    "emmet_ls", "clangd"}

lsp.on_attach(function(client, bufnr)
    print('Greetings from on_attach')
end)
lsp.setup()
