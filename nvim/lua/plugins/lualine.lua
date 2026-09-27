-- Indexes from Ghostty's built-in "Rose Pine" theme. The statusline uses those
-- slots, same as the rest of the editor, so it follows that palette.
-- 0 overlay, 1 love, 2 pine, 4 foam, 5 iris, 6 rose, 7 text, 8 muted.
local overlay, love, pine, foam, iris, rose, text, muted = 0, 1, 2, 4, 5, 6, 7, 8

local function section(accent)
  return {
    a = { fg = overlay, bg = accent, gui = 'bold' },
    b = { fg = accent, bg = overlay },
    c = { fg = text, bg = 'NONE' },
  }
end

local theme = {
  normal = section(rose),
  insert = section(foam),
  visual = section(iris),
  replace = section(pine),
  command = section(love),
  inactive = {
    a = { fg = muted, bg = 'NONE' },
    b = { fg = muted, bg = 'NONE' },
    c = { fg = muted, bg = 'NONE' },
  },
}

require('lualine').setup({
  options = {
    theme = theme,
    icons_enabled = false,
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
})
