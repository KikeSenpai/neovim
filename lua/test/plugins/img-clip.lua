-- [[ Configure Image Clip Plugin for Code Companion ]]

return {
  'HakonHarnes/img-clip.nvim',
  opts = {
    filetypes = {
      codecompanion = {
        prompt_for_file_name = false,
        template = '[Image]($FILE_PATH)',
        use_absolute_path = true,
      },
    },
  },
  config = function(_, opts)
    require('img-clip').setup(opts)
  end,
}
