return {
	"nvimtools/none-ls.nvim",
	config = function()
		local none_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		none_ls.setup({
			-- Setup Autoformatting
			on_attach = function(client, buffer)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = buffer,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								filter = function(clt)
									return clt.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
			sources = {
				-- Formatting
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.formatting.prettierd,
				none_ls.builtins.formatting.gofumpt,
				none_ls.builtins.formatting.goimports,
				none_ls.builtins.formatting.jq,

				-- Diagnostics
				none_ls.builtins.diagnostics.eslint_d,
				-- none_ls.builtins.diagnostics.codespell,
				-- none_ls.builtins.diagnostics.dotenv_linter,
				none_ls.builtins.diagnostics.flake8,
				none_ls.builtins.diagnostics.golangci_lint,
				none_ls.builtins.diagnostics.jsonlint,
				none_ls.builtins.diagnostics.luacheck,
				none_ls.builtins.diagnostics.markdownlint_cli2,

				-- Completion
				-- none_ls.builtins.completion.spell,

				-- Code Actions
				none_ls.builtins.code_actions.eslint,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- Setup autoformatting
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
