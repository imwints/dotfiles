vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local function map(mode, lhs, rhs, opts)
	local opts = opts or {}
	opts.buffer = bufnr
	opts.silent = true
	vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- stylua: ignore start
      map("n", "<leader>a", function() require("rustaceanvim.commands.code_action_group")() end, { desc = "Code action" })
      map("n", "J", function() require("rustaceanvim.commands.join_lines")(false) end)
      map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { desc = "Definitions" })
      map("n", "gD", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { desc = "Implementation" })
      map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { desc = "Type definitions" })
      map("n", "<leader>k", function() vim.lsp.buf.hover() end, { desc = "Hover" })
      map("n", "<leader>a", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
      map("n", "<leader>d", function() require("telescope.builtin").diagnostics({ buffer = 0 }) end, { desc = "Document diagnostics" })
      map("n", "<leader>D", function() require("telescope.builtin").diagnostics({ root_dir = client.root_dir }) end, { desc = "Worspace diagnostics" })
      map("n", "<leader>s", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Document symbols" })
      map("n", "<leader>S", function() require("rustaceanvim.commands.workspace_symbol")() end, { desc = "Workspace symbols" })
      map("n", "C", function() require("rustaceanvim.commands.open_cargo_toml")() end, { desc = "Open Cargo.toml" })
      -- stylua: ignore end
    end
  },
  tools = {
    code_actions = {
      ui_select_fallback = true,
    },
  },
}
