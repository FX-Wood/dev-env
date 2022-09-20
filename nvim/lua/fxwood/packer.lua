print('loading packer')

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { 'Everblush/everblush.nvim', as = 'everblush' }
    use 'folke/tokyonight.nvim'
    use { 'kylechui/nvim-surround' }

    use 'mfussenegger/nvim-dap'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        -- from here: https://youtu.be/hkxPa5w3bZ0?t=173
        run = ':TSUpdate'
    }

    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
end)

