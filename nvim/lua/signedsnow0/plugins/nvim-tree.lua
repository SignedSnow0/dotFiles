return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() 
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 35,
                relativenumber = true;
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })

        local keymap = vim.keymap

        keymap.set("n", "<leader>pp", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        keymap.set("n", "<leader>pf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer at file location" })
        keymap.set("n", "<leader>pr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    end
}
