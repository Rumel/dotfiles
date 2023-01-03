local installed_themes = {
  "rose-pine",
  "tokyonight",
  "tokyonight-night",
  "tokyonight-storm",
  "tokyonight-day",
  "tokyonight-moon",
}

function setTheme(color)
  color = color or "tokyonight"
  vim.cmd.colorscheme(color)

  -- Transparency
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

setTheme()
