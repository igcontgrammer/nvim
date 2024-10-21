local M = {}

function M.setup()
	local cmp = require("cmp")
	cmp.setup({
		window = {
			-- asignamos en bordeado el cuadro de autocompletado
			completion = cmp.config.window.bordered(),
			-- lo mismo con la documentacion
			documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert({
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		-- limitamos el alcance de las sugerencias al contexto
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer", max_item_count = 7 },
			{ name = "path" },
		},
	})
end

return M
