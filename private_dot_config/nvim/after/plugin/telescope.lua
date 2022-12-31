local builtin = require('telescope.builtin')

local wk = require("which-key")

wk.register({
  p = { name = "Project" }
}, { prefix = "<leader>" })

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find Files (no Git)" } )
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files (Git)" } )
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Live Grep" } )
