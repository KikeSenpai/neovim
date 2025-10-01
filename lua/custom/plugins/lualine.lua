-- [[ Configure status line ]]
-- See `:help lualine`

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = 'tokyonight',
      section_separators = { left = '', right = '' },
      component_separators = { left = '\\', right = '/' },
      -- component_separators = { left = '┃', right = '┃' },
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        { 'branch', icons_enabled = true, icon = '' },
        'diff',
        'diagnostics',
      },
      lualine_c = { 'filename' },
      lualine_x = {
        'encoding',
        'fileformat',
        'filetype',
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
