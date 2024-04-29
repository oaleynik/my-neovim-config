return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			return
		end

		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		function Telescope_buffer_dir()
			return vim.fn.expand("%:p:h")
		end

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					width = 0.8,
				},
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					initial_mode = "normal",
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					layout_config = {
						width = 0.8,
					},
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["C-x"] = fb_actions.remove,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", ";f", function()
			builtin.find_files()
		end, opts)

		vim.keymap.set("n", ";F", function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
			})
		end, opts)

		vim.keymap.set("n", "ff", function()
			builtin.current_buffer_fuzzy_find()
		end, opts)

		vim.keymap.set("n", ";r", function()
			builtin.live_grep({
				additional_args = function()
					return { "-g", "!**/vendor/**" }
				end,
			})
		end, opts)

		vim.keymap.set("n", ";R", function()
			builtin.live_grep({
				additional_args = function()
					return { "-uu", "-g", "!.git" }
				end,
			})
		end, opts)

		vim.keymap.set("n", "\\\\", function()
			builtin.buffers()
		end, opts)

		vim.keymap.set("n", ";t", function()
			builtin.help_tags()
		end, opts)

		vim.keymap.set("n", ";h", function()
			builtin.builtin()
		end, opts)

		vim.keymap.set("n", ";;", function()
			builtin.resume({
				initial_mode = "normal",
			})
		end, opts)

		vim.keymap.set("n", ";e", function()
			builtin.diagnostics()
		end, opts)

		vim.keymap.set("n", ";w", function()
			builtin.grep_string()
		end, opts)

		vim.keymap.set("n", "sf", function()
			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = Telescope_buffer_dir(),
				previewer = false,
			})
		end, opts)
	end,
}
