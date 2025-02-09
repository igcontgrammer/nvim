require("config.core").setup()
require("plugins.core").setup()
require("remaps.remaps")
require("config.theme").setup()
require("snippets.snippets").setup()

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "txt", "markdown", "md" },
	callback = function(args)
		vim.opt_local.spell = false -- Versión Lua más robusta
	end,
	desc = "Desactivar spell check en textos",
	group = vim.api.nvim_create_augroup("MySpellGroup", { clear = true }),
})
