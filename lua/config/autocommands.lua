vim.api.nvim_create_augroup('myautocmds', {})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'myautocmds',
    callback = function() vim.hl.on_yank { timeout = 500 } end
})

vim.api.nvim_create_autocmd('FileType', {
    group = 'myautocmds',
    pattern = { 'gitcommit', 'gitrebase' },
    callback = function(args)
        vim.cmd("startinsert")
        -- map Ctrl-s to :wq in normal and insert mode
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "<C-s>", "<cmd>wq<cr>", opts)
        vim.keymap.set("i", "<C-s>", "<cmd>wq<cr>", opts)
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = 'myautocmds',
    callback = function(args)
        vim.cmd("startinsert")

        -- get into normal mode with escape
        local opts = { buffer = args.buf }
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local buf    = args.buf
        -- local excluded_filetypes = {}
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting')
        -- and not excluded_filetypes[vim.bo[buf].filetype]
        then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
                buffer = buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end
})

-- vim.api.nvim_clear_autocmds({
--     group = "nvim.terminal",
--     event = "TermClose"
-- })
