return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = "rust",
  },
  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    init = function()
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
    opts = {
      completion = {
        cmp = {
          enabled = true,
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
  },
}
