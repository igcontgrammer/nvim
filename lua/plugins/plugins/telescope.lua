local M = {}

function M.setup()
	require("telescope").setup({
		extensions = {
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},
	})

	require("telescope").load_extension("file_browser")
	vim.keymap.set("n", "<space>fb", function()
		require("telescope").extensions.file_browser.file_browser()
	end)
end

return M
