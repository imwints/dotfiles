local function large_file(_, buf)
  local max_filesize = 1024 * 1024 -- 1 MB
  local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSInstall", "TSUpdate", "TSUpdatSync" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "cpp",
          "markdown_inline",
          "query",
          "regex",
          "rust",
        },
        highlight = {
          enable = true,
          disable = function(_, buf)
            large_file(_, buf)
          end,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
	    include_surrounding_whitespace = true,
          },
	  swap = {
	    enable = true,
	    swap_next = {
	      ["]p"] = "@parameter.inner",
	    },
	    swap_previous = {
	      ["[p"] = "@parameter.inner",
	    },
	  },
        },
      })
    end,
  },
}
