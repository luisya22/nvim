local cmp = require 'cmp'
local lspkind = require('lspkind')

-- Database completion
vim.api.nvim_exec(
  [[
      autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
      autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
  ]],
  false
)

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- Replace this with your snippet engine
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },        -- LSP suggestions
    { name = 'supermaven' },      -- Supermaven suggestions
    { name = 'vim-dadbod-completion' }, -- Database completion (if needed)
    { name = 'buffer' },          -- Buffer completion
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",   -- Display symbols
      max_width = 50,    -- Max width for the completion popup
      symbol_map = { Supermaven = "" }, -- Icon for Supermaven
    }),
  },
})

-- Ensure Supermaven suggestions are highlighted
vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" }) -- Green icon for Supermaven
