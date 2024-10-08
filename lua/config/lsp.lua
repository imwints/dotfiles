vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.ebuild", "*.eclass" },
  callback = function()
    -- Try to attach to previous instance
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ name = "ebook" })
    for _, client in ipairs(clients) do
      vim.lsp.buf_attach_client(bufnr, client.id)
      return
    end

    vim.lsp.start({
      name = "ebook",
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
