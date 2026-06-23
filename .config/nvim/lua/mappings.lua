require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end, { desc = "display inlay hints" })

map("n", "<C-t>", function()
  require("minty.shades").open { border = false }
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

local builtin = require "telescope.builtin"

map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

-- map({ "n", "i", "v" }, "<C-s>", j"<cmd> w <cr>")
