return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
			},
			checkOnSave = true,
			check = {
				command = "clippy",
			},
			procMacro = {
				enable = true,
			},
			inlayHints = {
				bindingModeHints = { enable = true },
				closureCaptureHints = { enable = true },
				closureReturnTypeHints = { enable = "always" },
				lifetimeElisionHints = { enable = "always" },
				parameterHints = { enable = true },
				typeHints = { enable = true },
			},
		},
	},
}
