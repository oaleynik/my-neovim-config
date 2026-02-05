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

			map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
			map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
			map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
			map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
			map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
			map("v", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
			map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
			map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
			map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
			map("n", "<leader>gB", gs.blame, "Blame Buffer")
			map("n", "<leader>gd", gs.diffthis, "Diff This")

			map({ "o", "x" }, "ih", gs.select_hunk, "Select Hunk")
		end,
	},
}
