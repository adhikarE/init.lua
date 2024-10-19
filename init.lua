vim.opt.number = true

vim.keymap.set('n', '[d', vim.diagnostic.goto_next, {desc = "Go to next Debug message"})
vim.keymap.set('n', 'd]', vim.diagnostic.goto_prev, {desc = "Go to previous Debug message"})
			
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.background = "dark"

-- Enable true color support
vim.opt.termguicolors = true

vim.cmd[[highlight Visual guibg=#4e4e4e]]
