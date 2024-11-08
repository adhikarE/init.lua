-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

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
vim.cmd[[highlight Search guibg=#de251a]]


-------------------------------   Custom Theming   -------------------------------

local packer_bootstrap = ensure_packer()

-- Plugin setup
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'         -- Packer manages itself
  use 'folke/tokyonight.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

local packer_bootstrap = ensure_packer()

-- Set up lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight',  -- Set to your desired color scheme
    section_separators = {'', ''},
    component_separators = {'', ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
