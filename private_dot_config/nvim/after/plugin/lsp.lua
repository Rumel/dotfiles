local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'solargraph',
  'sumneko_lua'
})

lsp.nvim_workspace()
lsp.setup()
