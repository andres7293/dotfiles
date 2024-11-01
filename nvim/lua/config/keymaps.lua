-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

--calltree
map("n", "gc", function()
  vim.lsp.buf.incoming_calls()
end, { desc = "Show incoming calls" })

map("n", "gC", function()
  vim.lsp.buf.incoming_calls()
end, { desc = "Show coming calls" })

-- harpoon
map("n", "<leader>ma", function()
  require("harpoon.mark").add_file()
end, { desc = "add harpoon mark" })

map("n", "<leader>ml", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "list harpoon marks" })

--movement
map("n", "<F3>", function()
  vim.cmd.bnext()
end, { desc = "Next buffer" })

map("n", "<F2>", function()
  vim.cmd.bprev()
end, { desc = "Prev buffer" })

-- neotest
map("n", "<leader>tc", function()
  require("neotest").run.run()
end, { desc = "Run current test" })

map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run current file" })

map("n", "<leader>tp", function()
  require("neotest").output_panel.open()
end, { desc = "Show output panel" })

--pomodoro
map("n", "<leader>ps", ":PomodoroStart<cr>", { desc = "Pomodoro start" })
map("n", "<leader>pt", ":PomodoroStop<cr>", { desc = "Pomodoro stop" })
map("n", "<leader>pu", ":PomodoroUI<cr>", { desc = "Pomodoro UI" })
map("n", "<leader>pk", ":PomodoroSkipBreak<cr>", { desc = "Pomodoro skip break" })
map("n", "<leader>pf", ":PomodoroForceBreak<cr>", { desc = "Pomodoro force break" })
map("n", "<leader>pd", ":PomodoroDelayBreak<cr>", { desc = "Pomodoro delay break" })
