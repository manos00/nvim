return {
    {
        vim.keymap.set("n", "<leader>em", vim.diagnostic.open_float, { desc = 'Open floating lsp message' }),
        vim.keymap.set("n", "<leader>el", vim.diagnostic.setloclist, { desc = 'Open lsp message list window' }),
        vim.diagnostic.config({
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR },
                prefix = '●', -- symbol shown before message
                spacing = 2, -- spaces between code and message
            },
            signs = true, -- show signs in the gutter (left side)
            underline = true, -- keep squiggly underline
            update_in_insert = false, -- don't update while typing
        })
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("qmlls", {
                cmd = { "qmlls6" }
            })
            vim.lsp.enable('qmlls')
            vim.lsp.enable("jdtls")
            vim.lsp.enable("bashls")
            vim.lsp.config("nil", {
                cmd = { "nil" },
                filetypes = { "nix" },
                root_markers = { "flake.nix", ".git" },
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
}
