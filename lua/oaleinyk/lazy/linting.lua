return {
	"mfussenegger/nvim-lint",

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			vue = { "eslint_d" },
		}

		vim.keymap.set("n", "<leader>ml", function() lint.try_lint() end, { desc = "Trigger linting for current file" })
	end,
}
