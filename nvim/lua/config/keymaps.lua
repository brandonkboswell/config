-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Don't forget that you can do this
vim.cmd([[
  " let g:tmux_navigator_no_mappings = 1
  " noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  " noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
  " noremap <silent> <D-S-[> :<C-U>TmuxNavigateLeft<cr>
  " noremap <silent> <D-S-]> :<C-U>TmuxNavigateRight<cr>

  " Support adding a return without leaving normal mode
  nnoremap <Leader>o o<Esc>0"_D
  nnoremap <Leader>O O<Esc>0"_D

  set wrap nolist
  set linebreak
]])

-- Stolen from Josh Medeski
-- harpoon
--
vim.keymap.set("n", "<leader>'", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add to Harpoon" })
vim.keymap.set("n", "<leader>0", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon" })
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Harpoon Buffer 1" })
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Harpoon Buffer 2" })
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Harpoon Buffer 3" })
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Harpoon Buffer 4" })
vim.keymap.set("n", "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Harpoon Buffer 5" })
vim.keymap.set("n", "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", { desc = "Harpoon Buffer 6" })
vim.keymap.set("n", "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", { desc = "Harpoon Buffer 7" })
vim.keymap.set("n", "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", { desc = "Harpoon Buffer 8" })
vim.keymap.set("n", "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", { desc = "Harpoon Buffer 9" })

vim.keymap.set("n", "<leader>n", "<cmd>bn<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>p", "<cmd>bp<cr>", { desc = "Previous" })
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>bj", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bk", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bsd", "<cmd>%bd|e#|bd#<cr>|'<cr>", { desc = "Delete surrounding buffers" })

-- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

vim.keymap.set("n", "<c-+>", "<cmd>vs<cr>", { desc = "New Split" })
vim.keymap.set("n", "<c-s-=>", "<cmd>vs<cr>", { desc = "New Split" })
vim.keymap.set("n", "<c-=>", "<cmd>vs<cr>", { desc = "New Split" })
vim.keymap.set("n", "<c-s-+>", "<cmd>vs<cr>", { desc = "New Split" })

vim.keymap.set("n", "<leader>*", "<cmd>Telescope grep_string<cr>", { silent = true, desc = "Grep Word Under Cursor" })

-- when deleting, don't add that to the register
-- vim.keymap.set({"n", "v"}, "d", [["_d]])
-- vim.keymap.set({"n", "v"}, "c", [["_c]])
