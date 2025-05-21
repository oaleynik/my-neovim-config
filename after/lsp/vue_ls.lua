return {
	init_options = {
		typescript = {
			tsdk = vim.fn.expand("$MASON/packages/typescript-language-server") .. "/node_modules/typescript/lib",
		},
	},
	before_init = function(_, config)
		local lib_path = vim.fs.find("node_modules/typescript/lib", {
			path = config.root_dir,
			upward = true,
		})[1]
		if lib_path then config.init_options.typescript.tsdk = lib_path end
	end,
}
