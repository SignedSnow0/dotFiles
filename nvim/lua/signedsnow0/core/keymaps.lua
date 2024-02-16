vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

map('n', '<leader>tc', ':tabnew<CR>', { noremap = true, silent = true }) -- new tab
map('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true }) -- next tab
map('n', '<leader>tp', ':tabprevious<CR>', { noremap = true, silent = true }) -- previous tab
map('n', '<leader>tx', ':tabclose<CR>', { noremap = true, silent = true }) -- close tab

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true }) -- find files
map('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true }) -- live grep

-- NvimTree
map('n', '<leader>nt', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- toggle nvimtree
map('n', '<leader>nr', ':NvimTreeRefresh<CR>', { noremap = true, silent = true }) -- refresh nvimtree

-- LSP
map('n', 'jd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true }) -- go to definition
map('n', 'jD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true }) -- go to declaration
map('n', 'jr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true }) -- go to references
map('n', 'ji', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true }) -- go to implementation
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true }) -- show hover
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true }) -- show signature help

