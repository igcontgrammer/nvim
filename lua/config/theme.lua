local M = {}

function M.setup()
	require("rose-pine").setup({
		variant = "main",
		dark_variant = "main",
		dim_inactive_windows = false,
		extend_background_behind_borders = true,
		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},
		styles = {
			bold = false,
			italic = false,
			transparency = true,
		},
		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",

			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		palette = {
			moon = {
				base = "#14191a",
				overlay = "#363738",
			},
		},
		highlight_groups = {
			Comment = { fg = "#6c6f93" },
			CursorLine = { bg = "#1a1b26" },
			CursorColumn = { bg = "#1a1b26" },
			["@variable"] = { fg = "#c0caf5" },
			["@variable.member"] = { fg = "#c0caf5" },
			["@constant"] = { fg = "#bb9af7", bold = true, italic = true },
			["@constant.member"] = { fg = "#c0caf5", bold = true, italic = true },
			["@keyword.operator"] = { fg = "#bb9af7", bold = true },
		},
	})

	vim.cmd("colorscheme rose-pine")
end

return M
