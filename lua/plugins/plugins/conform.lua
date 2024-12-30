local M = {}

function M.setup()
	require("conform").setup({
		formatters_by_ft = {
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "isort", "black" }
				end
			end,
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			cs = { "csharpier" }, -- Solo csharpier para archivos .cs
		},

		formatters = {
			csharpier = {
				command = "dotnet",
				args = { "csharpier", "--write-stdout", "$FILENAME" }, -- Argumentos para CSharpier
				stdin = false, -- CSharpier no acepta entrada estándar
			},
			prettier = {
				stdin = true,
				options = {
					ft_parsers = {
						javascript = "babel",
						javascriptreact = "babel",
						typescript = "typescript",
						typescriptreact = "typescript",
						vue = "vue",
						css = "css",
						scss = "scss",
						less = "less",
						html = "html",
						json = "json",
						jsonc = "json",
						yaml = "yaml",
						markdown = "markdown",
						["markdown.mdx"] = "mdx",
						graphql = "graphql",
						handlebars = "glimmer",
					},
				},
			},
			format_on_save = {
				lsp_fallback = true, -- Utiliza LSP si no hay formateador configurado
				async = false, -- Formateo sincrónico
				timeout_ms = 5000, -- Tiempo de espera de 5 segundos
			},
		},

		-- Opcional: deshabilita el formateo en lenguajes no configurados explícitamente
		default_formatter = nil,
	})
end

return M
