local status, hop = pcall(require, "hop")

if not status then
  print("Hop didn't load")
  return
end

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

local keymap = vim.keymap

keymap.set("n", "<leader><leader>b", "<cmd>HopWordBC<CR>" , { desc = "Hop word before cursor" })
keymap.set("n", "<leader><leader>w", "<cmd>HopWordAC<CR>" , { desc = "Hop word after cursor" })
keymap.set("n", "<leader><leader>j", "<cmd>HopLineAC<CR>" , { desc = "Hop line down" })
keymap.set("n", "<leader><leader>k", "<cmd>HopLineBC<CR>" , { desc = "Hop line up" })
keymap.set("n", "<leader><leader>l", "<cmd>HopLine<CR>" , { desc = "Hop line" })
keymap.set("n", "<leader><leader>f", "<cmd>HopChar1<CR>" , { desc = "Jump to Character" })

keymap.set("v", "<leader><leader>b", "<cmd>HopWordBC<CR>" , { desc = "Hop word before cursor" })
keymap.set("v", "<leader><leader>w", "<cmd>HopWordAC<CR>" , { desc = "Hop word after cursor" })
keymap.set("v", "<leader><leader>j", "<cmd>HopLineAC<CR>" , { desc = "Hop line down" })
keymap.set("v", "<leader><leader>k", "<cmd>HopLineBC<CR>" , { desc = "Hop line up" })
keymap.set("v", "<leader><leader>l", "<cmd>HopLine<CR>" , { desc = "Hop line" })
keymap.set("v", "<leader><leader>f", "<cmd>HopChar1<CR>" , { desc = "Jump to Character" })
