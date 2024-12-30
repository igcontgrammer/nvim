local dap = require("dap")

local M = {}

function M.setup()
	vim.keymap.set("n", "<F5>", function()
		dap.continue()
	end, { desc = "Start/Continue Debugging" })
	vim.keymap.set("n", "<F9>", function()
		dap.toggle_breakpoint()
	end, { desc = "Toggle Breakpoint" })
	vim.keymap.set("n", "<F10>", function()
		dap.step_over()
	end, { desc = "Step Over" })
	vim.keymap.set("n", "<F11>", function()
		dap.step_into()
	end, { desc = "Step Into" })
	vim.keymap.set("n", "<F12>", function()
		dap.step_out()
	end, { desc = "Step Out" })

	vim.keymap.set("n", "<Leader>dr", function()
		dap.repl.open()
	end, { desc = "Open Debug REPL" })

	vim.keymap.set("n", "<Leader>dc", function()
		dap.clear_breakpoints()
	end, { desc = "Clear All Breakpoints" })

	vim.keymap.set("n", "<Leader>dw", function()
		require("dap.ui.widgets").hover()
	end, { desc = "DAP Widget Hover" })

	vim.keymap.set("n", "<Leader>ds", function()
		dap.terminate()
	end, { desc = "Stop Debugging" })

	-- dap.adapters.python = {
	-- 	type = "executable",
	-- 	command = "python", -- Asegúrate de que este sea el intérprete de Python correcto
	-- 	args = { "-m", "debugpy.adapter" },
	-- }
	--
	-- dap.configurations.python = {
	-- 	{
	-- 		type = "python",
	-- 		request = "launch",
	-- 		name = "Launch app.main",
	-- 		module = "app.main", -- Especifica el módulo a ejecutar
	-- 		args = { "--reload" }, -- Argumentos adicionales si es necesario
	-- 		pythonPath = function()
	-- 			return vim.fn.exepath("python") -- Ajusta según tu entorno
	-- 		end,
	-- 		cwd = "${workspaceFolder}", -- Establece el directorio de trabajo al directorio del proyecto
	-- 		env = {
	-- 			PYTHONPATH = "${workspaceFolder}", -- Añade el directorio del proyecto al PYTHONPATH
	-- 		},
	-- 	},
	-- }
end

return M
