vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.ebuild", "*.eclass" },
  callback = function()
    vim.lsp.start({
      name = "ebuild-ls",
      -- cmd = { "/home/steffen/Source/Rust/arise/target/debug/ebuild-ls" },
      cmd = vim.lsp.rpc.connect("127.0.0.1", 26262),
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = { "*.ebuild", "*.eclass" },
  callback = function()
    local map = require("lsp").map

    -- stylua: ignore start
    map("gd", function() require("telescope.builtin").lsp_definitions() end, "Definition")
    -- stylua: ignore end
  end,
})
