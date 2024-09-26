vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ebuild", "*.eclass" },
  group = vim.api.nvim_create_augroup("ebuild", { clear = true }),
  callback = function()
    vim.opt_local.filetype = "ebuild"
    vim.opt_local.syntax = "bash"
  end,
})
