return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- Setup Color Scheme
        require("catppuccin").setup({
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = true,
            term_colors = false,
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
