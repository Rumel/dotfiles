local status, bufferline = pcall(require, "bufferline")

if not status then
  print("Bufferline did not load")
  return
end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp"
  }
})
