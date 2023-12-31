local cmp = require"cmp"
cmp.setup({
  completion = {
    completionopt = "menu,menuone",
  },
  preselect = cmp.PreselectMode.Item,
  window = {
    completion = {
      border = "double",
      scrollbar = false,
      winhighlight = "Normal:Pmenu"
    },
    documentation = {
      border = "shadow",
      scrollbar = false,
      winhighlight = "Normal:CmpDoc"
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
	      nvim_lsp = "[LSP]",
	      luasnip = "[LuaSnip]",
	      buffer = "[Buffer]",
	      path = "[Path]",
        })
      [entry.source.name]
      return vim_item
    end
  },
  mapping = ({
    ["<C-r>"] = cmp.mapping.scroll_docs(4),
    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Repace,
      select = true
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "" )
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "" )
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources{
    { name = "luasnip", priority = 1000 },
    { name = "nvim_lsp", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  }
})
