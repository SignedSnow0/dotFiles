require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd"
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

require("mason-lspconfig").setup_handlers {
    function (server_name)
       lspconfig[server_name].setup({
           capabilities = capabilities,
           on_attach = on_attach,
       })
   end,

    ["rust_analyzer"] = function ()
        require("rust-tools").setup({
            server = {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        })
    end,
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd", "--offset-encoding=utf-16" },
}

return { on_attach, capabilities }
