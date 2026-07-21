vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = 'Open netrw' })
-- tab navigation
vim.keymap.set("n", "<leader><Tab>o", "<cmd>tabnew<CR>", { desc = 'Open new tab' })
vim.keymap.set("n", "<leader><Tab>c", "<cmd>tabclose<CR>", { desc = 'Close current tab' })
vim.keymap.set("n", "<leader><Tab>n", "<cmd>tabn<CR>", { desc = 'Move to next tab' })
vim.keymap.set("n", "<leader><Tab>p", "<cmd>tabp<CR>", { desc = 'Move to previous tab' })
