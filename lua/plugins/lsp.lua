return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config("qmlls", {
            cmd = { "qmlls6" },
            root_markers = { "qmldir", ".git" }
        })
        vim.lsp.enable('qmlls')
        vim.lsp.enable("jdtls")
        vim.lsp.enable("bashls")
        vim.lsp.config("nil", {
            cmd = { "nil" },
            filetypes = { "nix" },
            root_markers = { "flake.nix", "default.nix", ".git" },
            settings = {
                formatting = {
                    command = { "nixfmt" },
                },
            },
        })
        vim.lsp.enable("nil")
        vim.lsp.config("lua_ls", {
            filetypes = { 'lua' },
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
        vim.lsp.enable("lua_ls")
    end,
}
