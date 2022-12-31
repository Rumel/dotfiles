require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.keymap.set("n", "<leader><leader>b", "<cmd>HopWordBC<CR>" , { desc = "Hop word before cursor" })
vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWordAC<CR>" , { desc = "Hop word after cursor" })
vim.keymap.set("n", "<leader><leader>j", "<cmd>HopLineAC<CR>" , { desc = "Hop line down" })
vim.keymap.set("n", "<leader><leader>k", "<cmd>HopLineBC<CR>" , { desc = "Hop line up" })
vim.keymap.set("n", "<leader><leader>l", "<cmd>HopLine<CR>" , { desc = "Hop line" })
vim.keymap.set("n", "<leader><leader>f", "<cmd>HopChar1<CR>" , { desc = "Jump to Character" })

vim.keymap.set("v", "<leader><leader>b", "<cmd>HopWordBC<CR>" , { desc = "Hop word before cursor" })
vim.keymap.set("v", "<leader><leader>w", "<cmd>HopWordAC<CR>" , { desc = "Hop word after cursor" })
vim.keymap.set("v", "<leader><leader>j", "<cmd>HopLineAC<CR>" , { desc = "Hop line down" })
vim.keymap.set("v", "<leader><leader>k", "<cmd>HopLineBC<CR>" , { desc = "Hop line up" })
vim.keymap.set("v", "<leader><leader>l", "<cmd>HopLine<CR>" , { desc = "Hop line" })
vim.keymap.set("v", "<leader><leader>f", "<cmd>HopChar1<CR>" , { desc = "Jump to Character" })
