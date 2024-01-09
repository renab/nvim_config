local treeIsFocused = false
local treeIsOpen = false
local activeBuffer = 0

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            -- Setup Neo-Tree
            require('neo-tree').setup {
                filesystem = {
                    filtered_items = {
                        visible = true,
                    },
                },
            }
            vim.keymap.set(
                'n',
                '<leader>n',
                function() --':Neotree filesystem reveal left<CR>', {})
                    if not treeIsOpen then
                        activeBuffer = vim.api.nvim_get_current_win()
                        vim.cmd("Neotree filesystem reveal left")
                        treeIsOpen = true
                        treeIsFocused = true
                    else
                        vim.cmd(":Neotree close")
                        activeBuffer = vim.api.nvim_get_current_win()
                        treeIsOpen = false
                        treeIsFocused = false
                    end
                end
            )
            vim.keymap.set(
                'n',
                '<leader>e',
                function() -- ':Neotree focus<CR>', {})
                    if treeIsOpen then
                        if not treeIsFocused then
                            activeBuffer = vim.api.nvim_get_current_win()
                            vim.cmd(":Neotree focus")
                            treeIsFocused = true
                        else
                            vim.api.nvim_set_current_win(activeBuffer)
                            activeBuffer = vim.api.nvim_get_current_win()
                            treeIsFocused = false
                        end
                    end
                end
            )
        end
    }
}

