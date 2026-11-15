vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>cd", vim.cmd.Ex, { desc = 'Open netrw' })
-- tab navigation
map("n", "<leader><Tab>o", "<cmd>tabnew<CR>", { desc = 'Open new tab' })
map("n", "<leader><Tab>c", "<cmd>tabclose<CR>", { desc = 'Close current tab' })
map("n", "<leader><Tab>n", "<cmd>tabn<CR>", { desc = 'Move to next tab' })
map("n", "<leader><Tab>p", "<cmd>tabp<CR>", { desc = 'Move to previous tab' })
