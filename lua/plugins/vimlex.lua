return {
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_forward_search_on_start = 1
      vim.g.vimtex_view_forward_search = 1
      vim.g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
            "-pdf",
            "-interaction=nonstopmode",
            "-synctex=1",
            '-outdir=pdfs',
            '-auxdir=build',
        },
      }
    end,
  },
}
