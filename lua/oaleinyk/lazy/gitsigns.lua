return {
	"lewis6991/gitsigns.nvim",

	config = function()
		local status, gitsigns = pcall(require, "gitsigns")
		if not status then return end

		gitsigns.setup({
			on_attach = function(bufnr)
				local opts = { noremap = true, silent = true }

				vim.api.nvim_buf_set_keymap(bufnr, "n", "]H", '<cmd>lua require"gitsigns".nav_hunk("last")<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "]h", '<cmd>lua require"gitsigns".nav_hunk("next")<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[h", '<cmd>lua require"gitsigns".nav_hunk("prev")<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[H", '<cmd>lua require"gitsigns".nav_hunk("first")<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gp", '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gB", '<cmd>lua require"gitsigns".blame()<CR>', opts)
			end,
		})
	end,
}
