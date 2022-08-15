print("loading packer")

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'	
  use 'mfussenegger/nvim-dap'
  use { 'Everblush/everblush.nvim', as = 'everblush' }
end)

