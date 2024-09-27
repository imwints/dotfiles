return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      )

      local servers = {
        clangd = {},
        lua_ls = {},
        ruff = {},
        -- rust_analyzer = {},
        taplo = {},
      }
      for server, opts in pairs(servers) do
        opts.on_attach = require("lsp").on_attach
        opts.capabilities = capabilities
        require("lspconfig")[server].setup(opts)
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = { ensure_installed = { "lua_ls" } },
  },
}
