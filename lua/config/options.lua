local set = vim.opt

-- line numbers
set.number = true
set.relativenumber = true

-- search opts
set.ignorecase = true
set.smartcase = true

-- cursor line
set.cursorline = true

-- indentation and tabs
set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true

-- conceal
set.conceallevel = 2     -- Hide concealed text; see :h conceallevel
set.concealcursor = "nc" -- Always conceal in normal and command modes

-- colors
set.termguicolors = true

-- keep cursor 8 rows from top/bottom
set.scrolloff = 8
