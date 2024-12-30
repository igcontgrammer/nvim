local M = {}

function M.setup()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			-- theme = "rose-pine",
		},
	})
end

return M
