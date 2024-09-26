local M = {}

function M.map(lhs, rhs, desc)
  local opts = {}
  opts.buffer = vim.api.nvim_get_current_buf()
  opts.desc = desc
  opts.noremap = true
  opts.silent = true

  vim.keymap.set("n", lhs, rhs, opts)
end

function M.definition()
  require("telescope.builtin").lsp_definitions({ reuse_win = true })
end

function M.declaration()
  vim.lsp.buf.declaration()
end

function M.type_definition()
  require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end

function M.implementation()
  require("telescope.builtin").lsp_implementations({ reuse_win = true })
end

function M.references()
  require("telescope.builtin").lsp_references({ reuse_win = true })
end

function M.document_symbols()
  require("telescope.builtin").lsp_document_symbols()
end

function M.on_attach(client, bufnr)
  M.map("gd", M.definition, "Goto definition")
  M.map("gD", M.declaration, "Goto declaration")
  M.map("gi", M.implementation, "Goto implementation")
  M.map("gy", M.type_definition, "Goto type definition")
  M.map("gr", M.references, "Goto references")

  -- stylua: ignore start
  M.map("<leader>a", function() vim.lsp.buf.code_action() end, "Code action")
  M.map("<leader>k", function() vim.lsp.buf.hover() end, "Hover")
  M.map("<leader>r", function() vim.lsp.buf.rename() end, "Rename")
  -- stylua: ignore end

  -- stylua: ignore start
  M.map("<leader>s", M.document_symbols, "Document symbols")
  M.map("<leader>S", function() require("telescope.builtin").lsp_workspace_symbols() end, "Workspace symbols")
  -- stylua: ignore end
end

return M
