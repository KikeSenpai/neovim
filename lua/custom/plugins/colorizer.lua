-- [[ Configuration for color highlighter ]]

return {
  'catgoose/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      filetypes = {
        'css',
        'html',
        'javascript',
        'lua',
        'typescript',
        'yaml',
      },
      options = {
        parsers = {
          names = { enable = false },
          css_fn = true,
        },
        display = {
          mode = 'background',
        },
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
