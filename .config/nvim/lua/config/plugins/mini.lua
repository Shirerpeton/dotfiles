return {
    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.ai').setup()
            require('mini.pairs').setup()
            require('mini.surround').setup()
            require('mini.statusline').setup()
            require('mini.git').setup()
            require('mini.diff').setup()
            require('mini.icons').setup()
            require('mini.files').setup()
            require('mini.notify').setup()
            require('mini.starter').setup()
            -- require('mini.animate').setup()
            vim.keymap.set('n', '-', ':lua MiniFiles.open()<CR>')
        end
    }
}
