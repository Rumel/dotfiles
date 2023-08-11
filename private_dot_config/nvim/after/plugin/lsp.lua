local status_lsp, lsp = pcall(require, 'lsp-zero')
local status_wk, wk = pcall(require, 'which-key')

if not status_lsp then
  print("lsp-zero didn't load")
  return
end

if not status_wk then
  print("which-key didn't load")
  return
end

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'solargraph',
})

lsp.nvim_workspace()
lsp.setup()

local keymap = vim.keymap

wk.register({
  c = { name = "Code" }
}, { prefix = "<leader>" }
)

keymap.set("n", "<leader>cf", "<cmd>LspZeroFormat<CR>", { desc = "Code Format" })
keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open floating diagnostic" })
