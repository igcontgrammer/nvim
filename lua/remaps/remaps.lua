local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>tr", ":Neotree filesystem reveal<cr>")
vim.keymap.set("n", "<leader>tc", ":Neotree close<cr>")

vim.keymap.set("n", "<leader>fcc", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Buscar en el archivo actual" })

vim.keymap.set(
	"n",
	"<leader><leader>",
	"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
	opts
)

vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<cr>", opts)

vim.keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Buscar sÃ­mbolos en el documento" })

vim.keymap.set("n", "<leader>fws", function()
	require("telescope.builtin").lsp_dynamic_workspace_symbols()
end, { desc = "Buscar simbolos en el espacio de trabajo" })

vim.keymap.set("n", "<leader>vs", ":vsplit<cr>", opts)

vim.keymap.set("n", "<leader>ws", ":split<cr>", opts)

vim.keymap.set("n", "<leader>q", ":q<cr>", opts)
vim.keymap.set("n", "<leader>w", ":w<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>;", "A;<esc>", opts)

vim.api.nvim_set_keymap("n", "<leader>t", ":tabnew<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>tt", ":bd<cr>", opts)

vim.keymap.set("n", "<space>fb", function()
	require("telescope").extensions.file_browser.file_browser()
end)

vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR><Esc>", opts)

vim.keymap.set("n", "<leader>ftt", ":Trouble<cr>", opts)

vim.keymap.set("n", ",.", ":resize +5<cr>", opts)

vim.keymap.set("n", ",/", ":resize -5<cr>", opts)

vim.keymap.set("n", ",[", ":vertical resize -10<cr>", opts)

vim.keymap.set("n", ",]", ":vertical resize +10<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>bo", ":<space>b<cr>o<cr>", opts)

-- Repeat last search
vim.api.nvim_set_keymap("n", "<leader>ll", ":Telescope resume<cr>", opts)

vim.api.nvim_set_keymap("n", "<leader>ww", ":w<CR>", opts)

vim.keymap.set("n", "<leader>lg", function()
	--  get file name with extension
	local file = vim.fn.expand("%:t")
	vim.cmd("LazyGit")

	-- Wait a bit for LazyGit to load
	vim.defer_fn(function()
		-- search for the file, highlight, and exit search mode in lazygit
		vim.api.nvim_feedkeys("/" .. file, "t", true)
		vim.api.nvim_input("<CR>")
		vim.api.nvim_input("<ESC>")
	end, 150) -- (milliseconds)
end, { desc = "[g]it" })

vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

function OpenTerminal()
	local project_dir = vim.fn.getcwd()
	-- look for a virtualenv in the project
	local venv_path = project_dir .. "/venv/bin/activate"

	if vim.fn.filereadable(venv_path) == 0 then
		venv_path = ""
	end

	vim.cmd("botright split")
	vim.cmd("resize 10")
	vim.cmd("terminal")

	-- if there is a virtualenv, activate it
	if venv_path then
		vim.fn.chansend(vim.b.terminal_job_id, "source " .. venv_path .. "\n")
	end

	vim.cmd("startinsert!")
end

vim.api.nvim_set_keymap("n", "<leader>te", ":lua OpenTerminal()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

local function show_filename_popup()
	local filename = vim.fn.expand("%:t")
	vim.api.nvim_command("echo '" .. filename .. "'")

	vim.defer_fn(function()
		vim.api.nvim_command("echo ''")
	end, 3000)
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = show_filename_popup,
})

-- Crea un grupo de autocomandos para organizar mejor
-- local group = vim.api.nvim_create_augroup("FirstBufferGroup", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	group = group,
-- 	once = true, -- Se asegura de que se ejecute solo una vez
-- 	callback = function()
-- 		vim.cmd("Neotree")
-- 	end,
-- })
