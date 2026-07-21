return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release

    config = function()
	require("neorg").setup({
	    load = {
		["core.defaults"] = {},
		["core.concealer"] = {
		    config = {
			-- NOTE: for concealing text (e.g. links), see vim.opt.conceallevel and vim.opt.concealcursor
		    }
		},
		["core.journal"] = {
		    config = {
			journal_folder = "journal",
		    }
		},
		["core.summary"] = {
		    config = {
			strategy = "default",
			exclude_dirs = {
			    "journal",
			    "index.norg"
			},

		    }
		},
		["core.esupports.metagen"] = {
		    config = {
			type = "auto",
		    }
		},
		["core.dirman"] = {
		    config = {
			workspaces = {
			    personal = "~/notes",
			    testing = "/tmp/playground",
			},
			default_workspace = "personal",
		    }
		},
		-- ["core.latex.renderer"] = {
		--     config = {
		-- 	render_on_enter = true,
		--     },
		-- },
	    },
	})
	vim.keymap.set('n', '<leader>ni', '<cmd>Neorg index<CR>', { desc = '[neorg] Open Neorg index file' })
	vim.keymap.set('n', '<leader>nr', '<cmd>Neorg return<CR>', { desc = "[neorg] Return to last open buffer before Neorg" })
	vim.keymap.set('n', '<leader>jt', '<cmd>Neorg journal today<CR>', { desc = "[neorg] Open today's Neorg journal" })
	vim.keymap.set('n', '<leader>jy', '<cmd>Neorg journal yesterday<CR>', { desc = "[neorg] Open yesterday's Neorg journal" })
	vim.keymap.set('n', '<leader>j<Tab>', '<cmd>Neorg journal toc open<CR>', { desc = "[neorg] Open Neorg journal table of contents" })
    end,
}
