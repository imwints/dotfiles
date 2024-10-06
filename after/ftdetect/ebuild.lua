vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ebuild", "*.eclass" },
  group = vim.api.nvim_create_augroup("ebuild", { clear = true }),
  callback = function()
    vim.bo.filetype = "ebuild"
    vim.bo.syntax = "bash"
  end,
})
