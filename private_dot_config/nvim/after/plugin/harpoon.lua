local status_mark, mark = pcall(require, "harpoon.mark")
local status_ui, ui = pcall(require, "harpoon.ui")
local status_wk, wk = pcall(require, "which-key")

if not status_mark then
  print("harpoon.mark didn't load")
  return
end

if not status_ui then
  print("harpoon.ui didn't load")
  return
end

if not status_wk then
  print("which-key didn't load")
  return
end

wk.register({
  h = { name = "Harpoon" }
}, { prefix = "<leader>" })

local keymap = vim.keymap

keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file" })
keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Quick Menu" })

keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Switch to 1" })
keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Switch to 2" })
keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Switch to 3" })
keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Switch to 4" })
