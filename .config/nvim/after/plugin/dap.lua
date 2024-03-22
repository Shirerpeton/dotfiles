local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/sbin/netcoredbg',
  args = { '--interpreter=vscode' },
  --vmArgs = function()
  --    return '--launch-profile=' .. vim.fn.input("launch profile name")
  --end
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "attach - netcoredbg",
    request = "attach",
    processId = require('dap.utils').pick_process,
    --cwd = function()
    --    return vim.fn.input('Current working directory')
    --end,
    --program = function()
    --    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    --end,
  },
}

vim.keymap.set("n", "<F5>", function() require'dap'.continue() end);
vim.keymap.set("n", "<F10>", function() require'dap'.step_over() end);
vim.keymap.set("n", "<F11>", function() require'dap'.step_into() end);
vim.keymap.set("n", "<F12>", function() require'dap'.step_out() end);
vim.keymap.set('n', '<leader>b', function() require'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dr', function() require'dap'.repl_open() end)
vim.keymap.set('n', '<leader>dl', function() require'dap'.run_last() end)

