local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

require("null-ls").setup({
    debug = false,
    sources = {formatting.prettier.with({
        extra_args = {"--no-semi", "--single-quote", "--jsx-single-quote"}
    }), formatting.stylua, formatting.black.with({
        extra_args = {"--fast"}
    })}
    -- on_attach = function(client, bufnr)
    -- 	if client.supports_method("textDocument/formatting") then
    -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    -- 		vim.api.nvim_create_autocmd("BufWritePre", {
    -- 			group = augroup,
    -- 			buffer = bufnr,
    -- 			callback = function()
    -- 				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    -- 				vim.lsp.buf.formatting_sync()
    -- 			end,
    -- 		})
    -- 	end
    -- end,
})
