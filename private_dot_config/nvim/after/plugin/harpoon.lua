local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
  h = { name = "Harpoon" }
}, { prefix = "<leader>" })

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file" })
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Quick Menu"} )

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Switch to 1"} )
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Switch to 2"} )
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Switch to 3"} )
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Switch to 4"} )
