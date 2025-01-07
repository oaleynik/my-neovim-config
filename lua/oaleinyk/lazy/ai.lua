return {
	{
		"github/copilot.vim",

		config = function()
			local opts = {
				silent = true,
				noremap = true,
			}

			vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", opts)
			vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", opts)
		end,
	},
}
