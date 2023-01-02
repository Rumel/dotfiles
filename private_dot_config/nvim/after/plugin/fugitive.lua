local status, wk = pcall(require, "which-key")

if not status then
  print("which-key didn't load")
  return
end

wk.register({
  g = { name = "Git" }
}, { prefix = "<leader>" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status"})
