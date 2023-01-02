local status, builtin = pcall(require, "telescope.builtin")

if not status then
  print("Telescope.bultin didn't load")
  return
end

local status, wk = pcall(require, "which-key")

if not status then
  print("which-key didn't load")
  return
end

wk.register({
  p = { name = "Project" }
}, { prefix = "<leader>" })

local keymap = vim.keymap

keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find Files (no Git)" } )
keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files (Git)" } )
keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Live Grep" } )
