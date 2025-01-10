local M = {}

function M.setup()
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"venv/",
				".ruff_cache",
				".cache",
				"__pycache__",
			},
		},
	})

	require("telescope").load_extension("file_browser")
	vim.keymap.set("n", "<space>fb", function()
		require("telescope").extensions.file_browser.file_browser()
	end)
end

return M
