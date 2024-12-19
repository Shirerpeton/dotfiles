return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            -- { 'nvim-telescope/telescope-file-browser.nvim' }
        },
        config = function()
            require('telescope').setup {
                defaults = require('telescope.themes').get_ivy(),
                extensions = {
                    fzf = {},
                    file_browser = {
                        hijack_netrw = true
                    }
                }
            }
            -- require('telescope').load_extension('file_browser')
            require('telescope').load_extension('fzf')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<space>fh', builtin.help_tags)
            vim.keymap.set('n', '<space>ff', builtin.find_files)
            vim.keymap.set('n', '<space>fg', builtin.live_grep)
            -- vim.keymap.set('n', '<space>fj', ':Telescope file_browser<CR>')
            vim.keymap.set('n', '<space>fr', builtin.lsp_references, {})
            vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
            vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
        end,
    },
}
