return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "markdown",
            "qmldir",
            "qmljs"
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Start highlighting when a parser is available for this filetype.
                pcall(vim.treesitter.start, args.buf)
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo.foldmethod = 'expr'
                vim.wo.foldlevel = 99
            end,
        })
    end,
}
