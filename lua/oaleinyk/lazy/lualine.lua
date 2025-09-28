return {
	"nvim-lualine/lualine.nvim",

	config = function()
		local status, lualine = pcall(require, "lualine")
		if not status then return end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = false,
			},
			sections = {
				lualine_a = {
					{ "branch", icon = "" },
					{
						"diff",
						diff_color = {
							added = { fg = Snacks.util.color("DiffAdd", "bg") },
							modified = { fg = Snacks.util.color("DiffChange", "bg") },
							removed = { fg = Snacks.util.color("DiffDelete", "bg") },
						},
					},
					{
						"diagnostics",
						{
							diagnostics_color = {
								error = { fg = Snacks.util.color("DiagnosticError") },
								warn = { fg = Snacks.util.color("DiagnosticWarn") },
								info = { fg = Snacks.util.color("DiagnosticInfo") },
								hint = { fg = Snacks.util.color("DiagnosticHint") },
							},
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
