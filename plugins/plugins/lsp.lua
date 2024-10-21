local M = {}

function M.setup()
	require("lspconfig").ruff_lsp.setup({
		init_options = {
			settings = {
				-- Any extra CLI arguments for `ruff` go here.
				args = {},
			},
		},
	})
	require("lspconfig").pyright.setup({
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "off", -- Desactiva el chequeo de tipos
					diagnosticMode = "openFilesOnly", -- Limita diagnÃ³sticos a archivos abiertos
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	})
end

return M
