local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      hidden = true
    }
  },
  extensions = {
    file_browser = {
      hijack_netrw = true
    }
  }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fi', builtin.git_files, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
