-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use ('nvim-treesitter/playground')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
    use ('christoomey/vim-tmux-navigator')
    -- use ('Olical/conjure')
    use ('guns/vim-sexp')
    use ('tpope/vim-sexp-mappings-for-regular-people')
    use ('tpope/vim-repeat')
    use ('tpope/vim-surround')
    use ('tpope/vim-vinegar')

    -- Debugger
    use ('mfussenegger/nvim-dap')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use ('Hoffs/omnisharp-extended-lsp.nvim')
    use ('Glench/Vim-Jinja2-Syntax')
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }
    use ('nvim-neotest/nvim-nio')
end)
