-- Rose Pine slots from Ghostty: 0 overlay, 4 foam, 5 iris, 6 rose, 8 muted, 15 text.
local function highlights()
  local function hi(name, ctermfg)
    vim.api.nvim_set_hl(0, name, { ctermfg = ctermfg })
  end

  vim.api.nvim_set_hl(0, 'FzfLuaNormal', {})
  vim.api.nvim_set_hl(0, 'FzfLuaBorder', { ctermfg = 8 })
  hi('FzfLuaTitle', 5)
  hi('FzfLuaPreviewTitle', 5)
  vim.api.nvim_set_hl(0, 'FzfLuaCursorLine', { ctermfg = 6, ctermbg = 0 })
end

highlights()
vim.api.nvim_create_autocmd('ColorScheme', { callback = highlights })

require('fzf-lua').setup({
  file_icons = false,
  git_icons = false,
  fzf_colors = {
    fg = '-1',
    bg = '-1',
    gutter = '-1',
    hl = '6',
    ['fg+'] = '15',
    ['bg+'] = '0',
    ['hl+'] = '6',
    info = '8',
    prompt = '5',
    pointer = '6',
    marker = '4',
    spinner = '5',
    header = '8',
    border = '8',
  },
})

vim.keymap.set('n', '<C-p>', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>s', '<cmd>FzfLua live_grep<cr>', { desc = 'Search in files' })
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<cr>', { desc = 'Find buffers' })
