vim.lsp.config("*", {
    root_markers = { ".git" },
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})

vim.lsp.config("qmlls", {
    cmd = { "qmlls6" },
    root_markers = { "qmldir" },
    filetypes = { 'qml' }
})

vim.lsp.config("jdtls", {
    cmd = { "jdtls" },
    root_markers = {
        "gradlew",
        "build.gradle",
        "settings.gradle",
    },
    filetypes = { 'java' }
})

vim.lsp.config("bashls", {
    cmd = { "bash-language-server", "start" },
    filetypes = { 'bash', 'sh' }
})

vim.lsp.config("nil", {
    cmd = { "nil" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", "default.nix" },
    settings = {
        formatting = {
            command = { "nixfmt" },
        },
    },
})

vim.lsp.config("lua_ls", {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' } },
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = { enable = false },
        }
    }
})

local ls = {
    'qmlls',
    'jdtls',
    'bashls',
    'nil',
    'lua_ls',
}

vim.lsp.enable(ls)


M = {}

function M.on_attach(bufnr)
    local opts = { buffer = bufnr, silent = true }

    -- KEYBINDS
    vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float,
        vim.tbl_extend("force", opts, { desc = 'Open floating lsp message' }))
    vim.keymap.set("n", "<leader>el", vim.diagnostic.setloclist,
        vim.tbl_extend("force", opts, { desc = 'Open lsp message list window' }))

    -- DIAGNOSTICS
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


    -- MISC
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
end

return M
