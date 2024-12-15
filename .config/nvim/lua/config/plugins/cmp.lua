return {
    {
        'iguanacucumber/magazine.nvim',
        name = 'nvim-cmp',
        dependencies = {
            {
                'iguanacucumber/mag-nvim-lsp',
                name = 'cmp-nvim-lsp'
            },
            'hrsh7th/cmp-path',
            {
                'iguanacucumber/mag-buffer',
                name = 'cmp-buffer'
            },
            {
                'iguanacucumber/mag-nvim-lua',
                name = 'cmp-nvim-lua'
            },
            {
                'iguanacucumber/mag-cmdline',
                name = 'cmp-cmdline'
            },
            {
                'L3MON4D3/LuaSnip',
                build = 'make install_jsregexp'

            },
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require('cmp')
            local ls = require('luasnip')
            ls.setup({})
            cmp.setup {
                sources = {
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'buffer' },
                },
                mapping = {
                    ['<C-n>'] = cmp.mapping.select_next_item {
                        behavior = cmp.SelectBehavior.Insert
                    },
                    ['<C-p>'] = cmp.mapping.select_prev_item {
                        behavior = cmp.SelectBehavior.Insert
                    },
                    ['<C-y>'] = cmp.mapping(
                        cmp.mapping.confirm {
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true
                        },
                        { 'i', 'c' }
                    ),
                },
                snippet = {
                    expand = function(args)
                        ls.lsp_expand(args.body)
                    end,
                }
            }
            vim.keymap.set({ 'i' }, '<C-K>', function() ls.expand() end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<C-L>', function() ls.jump( 1) end, { silent = true })
            vim.keymap.set({ 'i', 's' }, '<C-J>', function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ 'i', 's' }, '<C-E>', function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
            for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/config/snippets/*.lua', true)) do
                loadfile(ft_path)()
            end
        end
    },
}
