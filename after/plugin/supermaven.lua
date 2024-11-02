require('supermaven-nvim').setup({
    keymaps = {
    accept_suggestion = "<C-l>",  -- Use Ctrl-L to accept suggestions from supermaven
    clear_suggestion = "<C-]>",   -- Use Ctrl-] to clear suggestions
    accept_word = "<C-j>",        -- Use Ctrl-J to accept the current word from supermaven
  },
  disable_inline_completion = false, -- Keep inline completions enabled
})

-- Define keymaps for starting and stopping supermaven
vim.api.nvim_set_keymap('n', '<leader>ms', ':SupermavenStart<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mp', ':SupermavenStop<CR>', { noremap = true, silent = true })
