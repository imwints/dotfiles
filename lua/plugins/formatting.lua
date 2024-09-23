return {
  {
    "stevearc/conform.nvim",
    cmd = "ConformInfo",
    event = "BufWritePre",
    -- stylua: ignore
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      formatters_by_ft = {
        fish = { "fish_indent" },
        lua = { "stylua" },
        python = { "ruff_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        toml = { "taplo", lsp_format = "fallback" },
      },
    },
  },
}
