return {
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        opts = function(_, opts)
            opts = {}
            vim.diagnostic.config({virtual_text = false,})
            vim.keymap.set("n", "<Leader>l", require("lsp_lines").toggle)
        end,
    },
}
