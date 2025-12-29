vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Dynamically get the path to the configuration directory
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/restore-position.vim')

require("core.keymappings")
require("core.lazy")
