return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "lua",
          "markdown",
          "markdown_inline",
          "query",
          "regex",
          "rust",
          "vim",
          "vimdoc",
        },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 1024 * 1024 -- 1 MB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        modules = {},
        sync_install = false,
        ignore_install = {},
        auto_install = false,
      })
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {},
  -- },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>f", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>g", function() require("telescope.builtin").live_grep() end, desc = "Grep in project"  },
      { "<leader>w", function() require("telescope.builtin").grep_string() end, desc = "Search string under cursor" },
      { "<leader>b", function() require("telescope.builtin").buffers() end, desc = "Find open buffers" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    opts = {},
  },
  -- {
  --   "m4xshen/smartcolumn.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = {
  --     colorcolumn = 120,
  --   },
  -- },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    -- stylua: ignore
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open file picker" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "yamatsum/nvim-cursorline",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
}
