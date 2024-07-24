return {
	"sindrets/diffview.nvim",
	config = function()
		local diffview = require("diffview")

		diffview.setup({
			git_cmd = { "git" },
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>dvo", function()
			vim.cmd("DiffviewOpen")
		end)
		vim.keymap.set("n", "<leader>dvc", function()
			vim.cmd("DiffviewClose")
		end)

		vim.keymap.set("n", "<leader>dvm", function()
			vim.cmd("DiffviewOpen origin/main")
		end)

		vim.keymap.set("n", "<leader>dvf", function()
			vim.cmd("DiffviewFileHistory %")
		end)
	end,
}
