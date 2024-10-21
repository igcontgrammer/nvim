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
		},

		formatters = {
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
		},
	})
end

return M
