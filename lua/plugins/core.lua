local M = {}

function M.setup()
	require("lazy").setup({
		spec = {
			{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
			{
				"jiaoshijie/undotree",
				dependencies = "nvim-lua/plenary.nvim",
				config = true,
				keys = {
					{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
				},
			},
			{
				"hrsh7th/nvim-cmp",
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
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp",
			},
			{
				"saadparwaiz1/cmp_luasnip",
			},
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
	require("plugins.plugins.cmp").setup()
	require("plugins.plugins.neotree").setup()
	require("plugins.plugins.lsp").setup()
end

return M
