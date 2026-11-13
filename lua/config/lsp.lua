vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float, { desc = 'Open floating lsp message' })
vim.keymap.set("n", "<leader>el", vim.diagnostic.setloclist, { desc = 'Open lsp message list window' })
vim.diagnostic.config({
    float            = {
        border = 'rounded',
        source = 'if_many', -- only show source if there are more than one
        header = '',
        prefix = '',
    },
    virtual_text     = {
        severity = { min = vim.diagnostic.severity.ERROR },
        prefix = '●', -- symbol shown before message
        spacing = 2, -- spaces between code and message
    },
    signs            = true, -- show signs in the gutter (left side)
    underline        = true, -- keep squiggly underline
    update_in_insert = false, -- don't update while typing
    severity_sort    = true,
})


-- overwrite default floating window
local orig = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts            = opts or {}
    opts.border     = opts.border or 'rounded'
    opts.max_width  = opts.max_width or 80
    opts.max_height = opts.max_height or 24
    opts.wrap       = opts.wrap ~= false
    return orig(contents, syntax, opts, ...)
end
