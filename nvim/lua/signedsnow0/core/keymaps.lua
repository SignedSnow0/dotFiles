vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<c-w>v", { desc = "Split window vertically" }) 
keymap.set("n", "<leader>sh", "<c-w>s", { desc = "Split window horizontally" }) 
keymap.set("n", "<leader>se", "<c-w>=", { desc = "Make splits equal size" }) 
keymap.set("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split" })

keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", { desc = "Create new tab" }) 
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) 
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" }) 
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Previous tab" })
keymap.set("n", "<leader>td", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
