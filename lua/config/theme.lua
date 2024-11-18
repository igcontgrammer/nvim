local M = {}

local ss = {
	diagnostics = {
		hint = "#A6E3A1", -- Color de texto
	},
	bg = {
		cursorline = "#32302F", -- Color de fondo
	},
}

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
			["@keyword"] = { fg = "#CBA6F7" },
			["@keyword.control"] = { fg = "#CBA6F7" },
			["@keyword.coroutine"] = { fg = "#CBA6F7" },
			["@keyword.import"] = { fg = "#CBA6F7" },
			["@keyword.debug"] = { fg = "#CBA6F7" },
			["@keyword.modifier"] = { fg = "#CBA6F7" },
			["@keyword.exception"] = { fg = "#CBA6F7" },
			["@keyword.conditional"] = { fg = "#CBA6F7" },
			["@keyword.repeat"] = { fg = "#CBA6F7" },
			["@keyword.conditional.ternary"] = { fg = "#CBA6F7" },
			["@keyword.return"] = { fg = "#CBA6F7" },
			["@keyword.operator"] = { fg = "#bb9af7", bold = true },
			["@function"] = { fg = "#DCDCAA" },
			["@method"] = { fg = "#DCDCAA" },
			["@function.call"] = { fg = "#DCDCAA" },
			["@method.call"] = { fg = "#DCDCAA" },
			["@tag"] = { fg = "#4EC9B0", bold = true },
			["@tag.attribute"] = { fg = "#bb9af7" },
			["@tag.delimter"] = { fg = "#4EC9B0" },
			["@variable"] = { fg = "#c0caf5" },
			["@variable.member"] = { fg = "#c0caf5" },
			["@constant.member"] = { fg = "#c0caf5", bold = true, italic = true },
			["@type"] = { fg = "#7aa2f7" },
			["@type.builtin"] = { fg = "#7aa2f7" },
			["@type.definition"] = { fg = "#c0caf5" },
			["@namespace"] = { fg = "#7aa2f7" },
			["@property"] = { fg = "#c0caf5" },
		},
	})
	vim.cmd("colorscheme rose-pine")
	-- poner un gris para mejorar la visibilidad de seleccion de archivos
	vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = ss.diagnostics.hint, bg = ss.bg.cursorline })
end

return M
