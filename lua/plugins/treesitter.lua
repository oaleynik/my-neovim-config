return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup()

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.start) then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					include_surrounding_whitespace = false,
				},
				move = {
					set_jumps = true,
				},
			})

			local select = require("nvim-treesitter-textobjects.select").select_textobject
			local move = require("nvim-treesitter-textobjects.move")

			local map = vim.keymap.set

			map({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "outer function" })
			map({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "inner function" })
			map({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "outer class" })
			map({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "inner class" })
			map({ "x", "o" }, "aa", function() select("@parameter.outer", "textobjects") end, { desc = "outer argument" })
			map({ "x", "o" }, "ia", function() select("@parameter.inner", "textobjects") end, { desc = "inner argument" })

			map({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function start" })
			map({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer", "textobjects") end, { desc = "Next function end" })
			map({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev function start" })
			map({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev function end" })
			map({ "n", "x", "o" }, "]a", function() move.goto_next_start("@parameter.outer", "textobjects") end, { desc = "Next argument" })
			map({ "n", "x", "o" }, "[a", function() move.goto_previous_start("@parameter.outer", "textobjects") end, { desc = "Prev argument" })
		end,
	},
}
