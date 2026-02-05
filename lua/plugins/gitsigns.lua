return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
			map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
			map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
			map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

			map("n", "<leader>hp", gs.preview_hunk_inline, "Preview Hunk Inline")
			map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
			map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
			map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
			map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
			map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
			map("n", "<leader>hB", gs.blame, "Blame Buffer")
			map("n", "<leader>hd", gs.diffthis, "Diff This")

			map({ "o", "x" }, "ih", gs.select_hunk, "Select Hunk")
		end,
	},
}
