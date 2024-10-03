return {
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    -- stylua: ignore
    keys = {
      { mode = { "n", "i" }, "<c-t>", function() require("toggleterm").toggle() end, desc = "Toggle terminal" },
      { "T", function() require("toggleterm").toggle(nil, 70, nil, "vertical", nil) end, desc = "Toggle terminal (vertical)" },
    },
    opts = { open_mapping = "<c-t>" },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {},
  },
}
