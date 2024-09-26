return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    -- rustaceanvim is lazy by default
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            require("lsp").on_attach(client, bufnr)

            local map = require("lsp").map
	    -- stylua: ignore start
	    map("J", function() require("rustaceanvim.commands.join_lines")(false) end, "Join lines")
	    map("C", require("rustaceanvim.commands.open_cargo_toml"), "Open Cargo.toml")
	    map("K", require("rustaceanvim.hover_actions").hover_actions, "Hover")
	    map("<leader>k", require("rustaceanvim.hover_actions").hover_actions, "Hover")
	    vim.keymap.set("x", "K", require("rustaceanvim.commands.hover_range"), { buffer = bufnr, desc = "Hover range" })
	    vim.keymap.set("x", "<leader>k", require("rustaceanvim.commands.hover_range"), { buffer = bufnr, desc = "Hover range" })
            -- stylua: ignore end
          end,
        },
        tools = {
          code_actions = {
            ui_select_fallback = true,
          },
        },
      }
    end,
    config = false,
  },
  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    init = function()
      vim.api.nvim_create_autocmd("BufReadPre", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("crates.completion.cmp").setup()
          require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
    opts = {
      completion = {},
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {},
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
