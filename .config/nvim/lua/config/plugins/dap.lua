return {
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            'theHamsta/nvim-dap-virtual-text'
        },
        lazy = true,
        keys = {
            { '<F5>',     '<cmd>lua require("dap").continue()<cr>' },
            { '<space>b', '<cmd>lua require("dap").toggle_breakpoint()<cr>' }
        },
        config = function()
            local dap = require('dap')
            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/bin/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dap.configurations.cs = {
                {
                    type = 'coreclr',
                    name = 'attach - netcoredbg',
                    request = 'attach',
                    processId = function()
                        return require('dap.utils').pick_process({
                            filter = function(proc)
                                return vim.startswith(proc.name, vim.fn.getcwd())
                            end
                        })
                    end,
                },
            }

            vim.keymap.set('n', '<F5>', function() require 'dap'.continue() end);
            vim.keymap.set('n', '<F10>', function() require 'dap'.step_over() end);
            vim.keymap.set('n', '<F11>', function() require 'dap'.step_into() end);
            vim.keymap.set('n', '<F12>', function() require 'dap'.step_out() end);
            vim.keymap.set('n', '<space>b', function() require 'dap'.toggle_breakpoint() end)
            vim.keymap.set('n', '<space>dr', function() require 'dap'.repl_open() end)
            vim.keymap.set('n', '<space>dl', function() require 'dap'.run_last() end)


            local dapui = require('dapui')

            require('nvim-dap-virtual-text').setup({})
            require('dapui').setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end,
    }
}
