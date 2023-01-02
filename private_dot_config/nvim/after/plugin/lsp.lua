local status, lsp = pcall(require, 'lsp-zero')

if not status then
  print("lsp-zero didn't load")
  return
end

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'solargraph',
  'sumneko_lua'
})

lsp.nvim_workspace()
lsp.setup()
