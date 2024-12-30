local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {}

function M.setup()
	ls.add_snippets("python", {
		s("pri", {
			t("print("),
			i(1),
			t(")"),
		}),
		s("separator", {
			t("# **********************************************"),
		}),
		s("separatord", {
			t("# *************"),
			i(1),
			t(" ************* #"),
		}),
		s("doc", {
			t("'''"),
			t({ "", "The " }),
			i(1, "ClassName"),
			t({ " object contains " }),
			i(2, "description"),
			t({ ".", "" }),
			t({ "", "Parameters", "----------" }),
			i(3, "arg : str"),
			t({ "", "\t" }),
			i(4, "Description of arg"),
			t({ "", "*args", "\t" }),
			i(5, "Description of *args"),
			t({ "", "**kwargs", "\t" }),
			i(6, "Description of **kwargs"),
			t({ "", "", "Attributes", "----------" }),
			i(7, "arg : str"),
			t({ "", "\t" }),
			i(8, "Description of attribute"),
			t({ "", "'''" }),
		}),
		s("todo", {
			t("# TODO: "),
			i(1),
		}),

		s("note", {
			t("# NOTE: "),
			i(1),
		}),
	})
end

return M
