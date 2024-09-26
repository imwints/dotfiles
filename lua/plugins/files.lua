-- Find files in current buffers parent directory
local function find_files_in_buffer_dir()
  local dir = require("telescope.utils").buffer_dir()
  require("telescope.builtin").find_files({ cwd = dir })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>f", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>F", function() find_files_in_buffer_dir() end, desc = "Find files (buffer dir)" },
      { "<leader>g", function() require("telescope.builtin").live_grep() end, desc = "Grep" },
      { "<leader>G", function() require("telescope.builtin").grep_string() end, desc = "Grep word" },
      { "<leader>d", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
      { "<leader>b", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Search" },
      { "<leader>?", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    -- stylua: ignore
    keys = {
      { "-", function() require("oil").open() end, desc = "Open parent directory" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      -- Disable builtin file explorer
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Inject oil buffer when neovim should open a directory on startup
      if vim.fn.argc(-1) then
        local arg = vim.fn.argv(0)
        local stat = vim.uv.fs_stat(arg)

        if stat and stat.type == "directory" then
          vim.cmd.cd(arg)
          vim.cmd.enew()
          require("oil").open()
        end
      end
    end,
    opts = {},
  },
}
