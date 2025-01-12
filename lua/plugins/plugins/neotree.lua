local M = {}

function M.setup() end
local neotree = require("neo-tree")
neotree.setup({
	enable_git_status = true,
	default_component_configs = {
		indent = {
			indent_size = 3,
			padding = 1,
			with_markers = true,
			indent_marker = "|",
		},
		modified = {
			symbol = "[+]",
			highlight = "NeoTreeFileName",
		},
		git_status = {
			symbols = {
				added = "+",
				modified = "U",
				removed = "-",
				renamed = "»",
				unmerged = "×",
				untracked = "?",
				unstaged = "!",
			},
		},
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_git_ignored = false,
			hide_by_name = {
				"node_modules",
				".git",
				".DS_Store",
				".cache",
				".vscode",
				".idea",
				".github",
				".gitignore",
				".gitattributes",
				".gitmodules",
				".gitkeep",
			},
			hide_by_pattern = {
				"*.meta",
				"*/src/*/tsconfig.json",
			},
			always_show = {
				".gitignored",
			},
			always_show_by_pattern = {
				".env*",
			},
			never_show = {
				".DS_Store",
			},
		},
	},
})
return M
