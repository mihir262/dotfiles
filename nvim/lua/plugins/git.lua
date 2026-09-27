-- Rose Pine slots from Ghostty: 1 love, 4 foam, 5 iris, 6 rose, 8 muted.
local function highlights()
  vim.api.nvim_set_hl(0, 'SignColumn', {})

  local function hi(name, ctermfg)
    vim.api.nvim_set_hl(0, name, { ctermfg = ctermfg })
  end

  hi('GitSignsAdd', 4)
  hi('GitSignsChange', 6)
  hi('GitSignsDelete', 1)
  hi('GitSignsTopdelete', 1)
  hi('GitSignsChangedelete', 6)
  hi('GitSignsUntracked', 8)
  hi('GitSignsCurrentLineBlame', 8)
end

highlights()
vim.api.nvim_create_autocmd('ColorScheme', { callback = highlights })

require('gitsigns').setup({
  signs = {
    add = { text = '│' },
    change = { text = '│' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 300,
    virt_text_pos = 'eol',
  },
  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
    end
    map(']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gs.nav_hunk('next')
      end
    end, 'Next change')
    map('[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end, 'Previous change')
    map('<leader>gb', gs.toggle_current_line_blame, 'Toggle blame')
    map('<leader>gB', function()
      gs.blame_line({ full = true })
    end, 'Blame this line')
  end,
})
