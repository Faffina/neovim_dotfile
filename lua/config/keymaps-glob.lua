vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({"n", "v"}, "<leader>p", "\"+p")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>q", "1gt")
vim.keymap.set("n", "<leader>w", "2gt")
vim.keymap.set("n", "<leader>e", "3gt")
vim.keymap.set("n", "<leader>r", "4gt")
vim.keymap.set("n", "<leader>t", "5gt")
vim.keymap.set("n", "<Leader>bc", function() require("dap").continue() end)
vim.keymap.set("n", "<Leader>bn", function() require("dap").step_over() end)
vim.keymap.set("n", "<Leader>bi", function() require("dap").step_into() end)
vim.keymap.set("n", "<Leader>bo", function() require("dap").step_out() end)
vim.keymap.set("n", "<Leader>bb", function() require("dap").toggle_breakpoint() end)
