vim.api.nvim_set_hl(0, "YankHighlightPlus", { bg = "#ADD8E6", fg = "#0000FF" })
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        if vim.v.event.regname == '+' then
            vim.highlight.on_yank({ higroup = "YankHighlightPlus", timeout = 100 })
        else
            vim.highlight.on_yank()
        end
    end
})
