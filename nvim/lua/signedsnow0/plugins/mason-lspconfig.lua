require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer"
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, buffer = bufnr }

    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

end

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig.cmake.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

return { on_attach, capabilities }
