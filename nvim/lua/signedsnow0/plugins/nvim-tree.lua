-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
    view = {
        width = 40,
    },
})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>") --Toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>") --Current file in file explorer
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") --Close file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") --Refresh file explorer
