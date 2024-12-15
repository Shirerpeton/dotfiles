vim.keymap.set('n', 'gi', '<cmd>lua require("omnisharp_extended").telescope_lsp_implementation()<cr>')
vim.keymap.set('n', 'gd', '<cmd>lua require("omnisharp_extended").telescope_lsp_definition()<cr>')
