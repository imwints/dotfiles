local function is_enabled()
  local disabled = false
  disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
  disabled = disabled or (vim.fn.reg_recording() ~= "")
  disabled = disabled or (vim.fn.reg_executing() ~= "")
  -- keep command mode completion enabled when cursor is in a comment
  disabled = disabled or not vim.api.nvim_get_mode().mode == "c"

  -- disable completion in comments
  local context = require("cmp.config.context")
  disabled = disabled or context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
  return not disabled
end

return {
  {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      -- Snippets
      "L3MON4D3/LuaSnip",
      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      -- "f3fora/cmp-spell",
      "lukas-reineke/cmp-rg",
      "lukas-reineke/cmp-under-comparator",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
	  autocomplete = false,
          completeopt = "menu,menuone,noinsert",
        },
        view = { entries = "native" },
        formatting = {
          expandable_indicator = true,
          fields = { "kind", "abbr", "menu" },
          format = require("lspkind").cmp_format({ maxwidth = 50 }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<c-space>"] = cmp.mapping.complete(),
          ["<cr>"] = cmp.mapping.confirm({ select = false }),
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        enabled = is_enabled,
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          -- { name = "spell" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer", keyword_length = 2, max_item_count = 7 },
          { name = "rg", keyword_length = 2, max_item_count = 7 },
        }),
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.scopes,
            require("cmp-under-comparator").under,
            cmp.config.compare.length,
          },
        },
      })
    end,
  },
}
