vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "]b", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "gn", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bp<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gp", "<cmd>bp<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "gq", "<cmd>bd<cr>", { desc = "Close buffer" })
