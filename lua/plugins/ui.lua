return {
  { "nvim-tree/nvim-web-devicons" },
  {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
      vim.g.everforest_background = "medium"
      vim.g.everforest_better_performance = true
      vim.g.everforest_enable_bold = true
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    -- lazy = false,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      -- stylua: ignore
      require("which-key").add({
	{ "<leader>c", group = "Code" },
	{ "<leader>x", group = "Diagnostics" },
      })
    end,
  },
  -- {
  --   "stevearc/dressing.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     input = { enabled = false },
  --   },
  -- },
}
