vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.formatoptions:append('r')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 'termguicolors' paints over the terminal palette.
vim.opt.termguicolors = false
vim.cmd('syntax on')
vim.cmd.colorscheme('terminal')

vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/ibhagwan/fzf-lua',
}, { confirm = false })
require('plugins.lualine')
require('plugins.git')
require('plugins.fzf')

vim.keymap.set('n', '<leader>e', '<cmd>Explore<cr>', { desc = 'Open netrw' })

vim.g.cf_template = vim.fn.expand('~/.vim/templates/cf.cpp')

vim.api.nvim_create_user_command('CF', function()
  local template = vim.g.cf_template
  if vim.fn.filereadable(template) == 0 then
    vim.api.nvim_err_writeln('Missing template: ' .. template)
    return
  end
  vim.cmd('0r ' .. vim.fn.fnameescape(template))
  if vim.fn.getline('$') == '' then
    vim.cmd('$delete _')
  end
  vim.fn.search('void solve()', 'w')
  vim.cmd('normal! j')
  vim.cmd('startinsert!')
end, { desc = 'Load the Codeforces C++ template' })
