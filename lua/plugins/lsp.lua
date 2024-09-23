return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      )

      local function on_attach(client, bufnr)
        local function map(mode, lhs, rhs, opts)
	  local opts = opts or {}
	  opts.buffer = bufnr
	  opts.silent = true
          vim.keymap.set(mode, lhs, rhs, opts)
        end

	-- stylua: ignore start
	map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { desc = "Definitions" })
	map("n", "gD", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { desc = "Implementation" })
	map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { desc = "Type definitions" })
	map("n", "<leader>k", function() vim.lsp.buf.hover() end, { desc = "Hover" })
	map("n", "<leader>a", function() vim.lsp.buf.code_action() end, { desc = "Code action" })
	map("n", "<leader>d", function() require("telescope.builtin").diagnostics({ buffer = 0 }) end, { desc = "Document diagnostics" })
	map("n", "<leader>D", function() require("telescope.builtin").diagnostics({ root_dir = client.root_dir }) end, { desc = "Worspace diagnostics" })
	map("n", "<leader>s", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "Document symbols" })
	map("n", "<leader>S", function() require("telescope.builtin").lsp_workspace_symbols() end, { desc = "Workspace symbols" })
        -- stylua: ignore end
      end

      local servers = {
        clangd = {},
        lua_ls = {},
        ruff = {},
	taplo = {},
      }
      for server, _ in pairs(servers) do
        require("lspconfig")[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    -- stylua: ignore
    keys = {
      { "<leader>xx", function() require("trouble").toggle("diagnostics") end, desc = "Toggle" },
      { "<leader>xf", function() require("trouble").toggle("qflist") end, desc = "Quickfixes" },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = { "Bilal2453/luvit-meta" },
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
}
