local status_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
local status_wk, wk = pcall(require, "which-key")

if not status_nvim_tree then
  print("nvim-tree didn't load")
  return
end

if not status_wk then
  print("which-key didn't load")
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()

wk.register({
  t = { name = "NvimTree" }
}, { prefix = "<leader>" })

local keymap = vim.keymap

keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
keymap.set("n", "<leader>tt", "<cmd>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
keymap.set("n", "<leader>te", "<cmd>:NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
keymap.set("n", "<leader>tf", "<cmd>:NvimTreeFindFile<CR>", { desc = "Focus File" })
keymap.set("n", "<leader>tc", "<cmd>:NvimTreeCollapse<CR>", { desc = "Collapse Tree" })
