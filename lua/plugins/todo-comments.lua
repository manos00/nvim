return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
	-- searches cwd by default
	{ '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope (cwd)' },
	{
	    '<leader>fb',
	    function()
		require('telescope').extensions['todo-comments'].todo({
		    -- only search current buffer's folder
		    cwd = vim.fn.expand("%:p:h"),
		})
	    end,
	    desc = 'Todo Telescope (buffer dir)'
	},
    },
}
