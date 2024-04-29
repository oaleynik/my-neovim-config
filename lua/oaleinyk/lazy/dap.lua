return {
	"mfussenegger/nvim-dap",

	lazy = true,

	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP",
		},
	},

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},

	config = function()
		vim.keymap.set("n", "<leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<leader>B", function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end)
		vim.keymap.set("n", "<leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end)
		vim.keymap.set({ "n", "t" }, "<F2>", function()
			require("dap").step_out()
		end)
		vim.keymap.set({ "n", "t" }, "<F4>", function()
			require("dap").step_into()
		end)
		vim.keymap.set({ "n", "t" }, "<F3>", function()
			require("dap").step_over()
		end)
		vim.keymap.set({ "n", "t" }, "<leader>h", function()
			require("dap").run_to_cursor()
		end)

		vim.keymap.set("n", "<leader>dx", function()
			require("dap").terminate()
		end)
		vim.keymap.set("n", "<leader>dd", function()
			require("dap").clear_breakpoints()
		end)
		vim.keymap.set("n", "<leader>di", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set("n", "<leader>du", function()
			require("dapui").toggle()
		end)
		vim.keymap.set("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
		vim.keymap.set("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
		vim.keymap.set("n", "<leader>d?", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)

		local function get_arguments()
			local co = coroutine.running()
			if co then
				return coroutine.create(function()
					local args = {}
					vim.ui.input({ prompt = "Args: " }, function(input)
						args = vim.split(input or "", " ")
					end)
					coroutine.resume(co, args)
				end)
			else
				local args = {}
				vim.ui.input({ prompt = "Args: " }, function(input)
					args = vim.split(input or "", " ")
				end)
				return args
			end
		end

		require("dap-go").setup({
			dap_configurations = {
				{
					type = "go",
					request = "launch",
					name = "Launch workspace with args",
					program = "${workspaceFolder}",
					args = get_arguments,
				},
			},
		})

		require("dapui").setup()
	end,
}
