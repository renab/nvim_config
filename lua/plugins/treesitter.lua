return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Setup Treesitter
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "javascript", "typescript", "go", "c", "vim", "vimdoc", "query", "sql", "java" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true
        })
    end,
}
