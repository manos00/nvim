require('config.options')
require('config.keybinds')
require('config.autocommands')
-- require('config.treesitter')
require('config.lazy') -- load lazy first, so client capabilities can be set in config.lsp
require('config.lsp')
