return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local fzflua = require('fzf-lua');
            fzflua.setup({
                winopts = {
                    height = 0.80,
                    width = 1.00,
                    row = 1.00,
                    col = 0.00
                },
                keymap = {
                    fzf = {
                        ['ctrl-q'] = 'select-all+accept',
                    }
                }
            })
            vim.keymap.set('n', '<space>ff', fzflua.files, { desc = 'fzf files' })
            vim.keymap.set('n', '<space>fg', fzflua.live_grep, { desc = 'fzf grep' })
            vim.keymap.set('n', '<space>fh', fzflua.help_tags, { desc = 'fzf help tags' })
            vim.keymap.set('n', '<space>fr', fzflua.lsp_references, { desc = 'fzf lsp references' })
            vim.keymap.set('n', 'gd', fzflua.lsp_definitions, { desc = 'fzf lsp definitions' })
            vim.keymap.set('n', 'gi', fzflua.lsp_implementations, { desc = 'fzf lsp lsp_implementations' })
        end
    }
}
