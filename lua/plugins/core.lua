local M = {}

function M.setup()
	require("lazy").setup({
		spec = {
			{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
			{
				"folke/snacks.nvim",
				priority = 1000,
				lazy = false,
				opts = {
					scroll = { enabled = false },
				},
			},
			{
				"jiaoshijie/undotree",
				dependencies = "nvim-lua/plenary.nvim",
				config = true,
				keys = {
					{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
				},
			},
			{
				"nvim-lualine/lualine.nvim",
				dependencies = { "nvim-tree/nvim-web-devicons" },
			},
			{
				"kdheepak/lazygit.nvim",
				cmd = {
					"LazyGit",
					"LazyGitConfig",
					"LazyGitCurrentFile",
					"LazyGitFilter",
					"LazyGitFilterCurrentFile",
				},
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
				keys = {
					{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
				},
			},
			{
				"ThePrimeagen/harpoon",
				branch = "harpoon2",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
			{
				"github/copilot.vim",
			},
			{
				"linux-cultist/venv-selector.nvim",
				dependencies = {
					"neovim/nvim-lspconfig",
					"mfussenegger/nvim-dap",
					"mfussenegger/nvim-dap-python", --optional
					{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
				},
				lazy = false,
				branch = "regexp", -- This is the regexp branch, use this for the new version
				config = function()
					require("venv-selector").setup()
				end,
				keys = {
					{ ",v", "<cmd>VenvSelect<cr>" },
				},
			},
			{ "rebelot/kanagawa.nvim" },
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = true,
			},
			{
				"mg979/vim-visual-multi",
			},
			{
				"williamboman/mason.nvim",
			},
			{
				"rose-pine/neovim",
				name = "rose-pine",
			},
			{
				"nvim-telescope/telescope-file-browser.nvim",
				dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
			},
			{
				{ "echasnovski/mini.nvim", version = "*" },
			},
			{
				"folke/trouble.nvim",
				dependencies = { "nvim-tree/nvim-web-devicons" },
				opts = {},
			},
			{
				"folke/todo-comments.nvim",
				dependencies = { "nvim-lua/plenary.nvim" },
				opts = {},
			},
			{
				"L3MON4D3/LuaSnip",
			},
			{
				"hrsh7th/nvim-cmp",
			},
			{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
			{ "shaunsingh/nord.nvim" },
			{
				"mfussenegger/nvim-dap",
			},
			{
				"mfussenegger/nvim-dap-python",
			},
			{ "EdenEast/nightfox.nvim" },
			{
				"saghen/blink.cmp",
				version = "*",
				dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
				opts = {
					snippets = {
						expand = function(snippet)
							require("luasnip").lsp_expand(snippet)
						end,
						active = function(filter)
							if filter and filter.direction then
								return require("luasnip").jumpable(filter.direction)
							end
							return require("luasnip").in_snippet()
						end,
						jump = function(direction)
							require("luasnip").jump(direction)
						end,
					},
					completion = {
						ghost_text = {
							enabled = false,
						},
					},
				},
			},

			{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = {} },
		},
		defaults = {
			lazy = false,
			version = false,
		},
		performance = {
			rtp = {
				disabled_plugins = {
					"gzip",
					"tarPlugin",
					"tohtml",
					"tutor",
					"zipPlugin",
				},
			},
		},
	})
	require("mini.surround").setup()
	require("plugins.plugins.conform").setup()
	require("plugins.plugins..telescope").setup()
	require("plugins.plugins.harpoon").setup()
	require("plugins.plugins.lualine").setup()
	-- require("plugins.plugins.cmp").setup()
	require("plugins.plugins.neotree").setup()
	require("plugins.plugins.lsp").setup()
	require("plugins.plugins.dap").setup()
	-- require("snippets.snippets").setup()
	require("dap-python").setup("python3")

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "txt", "markdown" },
		callback = function()
			vim.opt_local.spell = true -- Activar el spell check
			vim.opt_local.spelllang = "es" -- Configurar el idioma a español
		end,
	})
end

return M
