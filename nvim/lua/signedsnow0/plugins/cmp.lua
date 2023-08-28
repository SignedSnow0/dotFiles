vim.opt.completeopt = "menu,menuone,noselect"

local lspkind = require("lspkind")

local cmp = require("cmp")
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            --[[mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function (entry, vim_item)
                return vim_item
            end--]]
        })
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
    sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp" },
    })
})
