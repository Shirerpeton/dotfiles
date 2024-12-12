local buffer_timer = {}

function ToggleBufferAutoreload()
    local bufnr = vim.api.nvim_get_current_buf()
    if buffer_timer[bufnr] then
        vim.loop.timer_stop(buffer_timer[bufnr])
        buffer_timer[bufnr] = nil
        print("Buffer autoreload disabled for buffer " .. bufnr)
    else
        buffer_timer[bufnr] = vim.loop.new_timer()
        buffer_timer[bufnr]:start(1000, 1000, vim.schedule_wrap(function()
            vim.cmd('checktime')
            vim.cmd('normal! G')
        end))
        print("Buffer autoreload enabled for buffer " .. bufnr)
    end
end

vim.api.nvim_create_user_command('ToggleAutoreload', ToggleBufferAutoreload, {})

vim.api.nvim_set_hl(0, "YankHighlightPlus", { bg = "#ADD8E6", fg = "#0000FF" })
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        if vim.v.event.regname == '+' then
            vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 100 })
        else
            vim.highlight.on_yank()
        end
    end
})
