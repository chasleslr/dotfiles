return {
	"ruifm/gitlinker.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local gitlinker = require("gitlinker")

		gitlinker.setup({})
	end,
}
