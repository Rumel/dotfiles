require("nvim-tree").setup()
local wk = require("which-key")

wk.register({
  t = { name = "NvimTree" }
}, { prefix = "<leader>" })

vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>tt", "<cmd>:NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>te", "<cmd>:NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
vim.keymap.set("n", "<leader>tf", "<cmd>:NvimTreeFindFile<CR>", { desc = "Focus File" })
vim.keymap.set("n", "<leader>tc", "<cmd>:NvimTreeCollapse<CR>", { desc = "Collapse Tree" })
