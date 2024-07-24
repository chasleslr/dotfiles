return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = { noremap = true, silent = true }

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Hover"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

			opts.desc = "Rename"
			keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

			keymap.set("n", "<space>e", vim.diagnostic.open_float)
			keymap.set("n", "[d", vim.diagnostic.goto_prev)
			keymap.set("n", "]d", vim.diagnostic.goto_next)
		end

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
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
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- settings = {
			-- 	pyright = {
			-- 		-- Using Ruff's import organizer
			-- 		disableOrganizeImports = true,
			-- 	},
			-- 	python = {
			-- 		analysis = {
			-- 			-- Ignore all files for analysis to exclusively use Ruff for linting
			-- 			ignore = { "*" },
			-- 		},
			-- 	},
			-- },
		})

		-- lspconfig["ruff_lsp"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.filetype.add({
			extension = {
				jinja = "jinja",
				jinja2 = "jinja",
				j2 = "jinja",
			},
		})
		lspconfig["jinja_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
