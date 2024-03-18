return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		-- local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Go to definition"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "Go to implementation"
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end

		lspconfig["lua_ls"].setup({
			-- capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["omnisharp"].setup({
			on_attach = on_attach,
			cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
		})
	end,
}
