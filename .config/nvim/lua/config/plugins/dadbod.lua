return {
    'tpope/vim-dadbod',
    dependencies = {
        'kristijanhusak/vim-dadbod-completion',
        'kristijanhusak/vim-dadbod-ui',
    },
    config = function()
        vim.g.db_ui_execute_on_save = '0'
    end
}
