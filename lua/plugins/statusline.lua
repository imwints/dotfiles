return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-lua/lsp-status.nvim",
        config = function()
          require("lsp-status").register_progress()
        end,
      },
    },
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          "filename",
          function()
            return require("lsp-status").status_progress()
          end,
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = false,
        hover = { enabled = false },
      },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    config = false,
  },
}
