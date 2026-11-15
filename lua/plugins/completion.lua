return {
    'hrsh7th/nvim-cmp',
    lazy = true,

    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind.nvim',
        'https://codeberg.org/FelipeLema/cmp-async-path',
        'hrsh7th/cmp-buffer',
        'micangl/cmp-vimtex',
        'kdheepak/cmp-latex-symbols'
    },

    config = function()
        local cmp = require("cmp")
        local lspkind = require('lspkind')

        cmp.setup({
            preselect = cmp.PreselectMode.Item,
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            formatting = {
                fields = { "icon", "abbr", "menu" }, -- "kind"
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        async_path = "[Path]",
                        vimtex = "[vimtex]",
                        latex_symbols = "[LaTeX]",
                    })
                }),
            },
            window = {
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then cmp.select_next_item() else fallback() end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function()
                    if cmp.visible() then cmp.select_prev_item() end
                end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
            }, {
                { name = 'buffer' },
            }, {
                { name = 'async_path' },
            }, {
                { name = 'vimtex' },
            }, {
                { name = 'latex_symbols', option = { strategy = 0 } },
            })
        })
    end,
}
