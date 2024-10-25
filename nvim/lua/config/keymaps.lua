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
end, { desc = "Show outgoing calls" })

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
