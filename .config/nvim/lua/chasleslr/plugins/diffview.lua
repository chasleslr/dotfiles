return {
	"sindrets/diffview.nvim",
	config = function()
		local diffview = require("diffview")

		diffview.setup({
			git_cmd = { "git" },
		})

		-- set keymaps
		vim.keymap.set("n", "<leader><leader>v", function()
			if next(require("diffview.lib").views) == nil then
				vim.cmd("DiffviewOpen")
			else
				vim.cmd("DiffviewClose")
			end
		end)
	end,
}
