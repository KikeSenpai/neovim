-- [[ Plugin to improve the rendering of Markdown files ]]

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    file_types = {
      'markdown',
      'Avante',
    },
  },
  ft = {
    'markdown',
    'Avante',
    'CopilotChat',
    'codecompanion',
  },
  config = function(_, opts)
    vim.keymap.set('n', '<leader>mt', ':RenderMarkdown toggle<CR>', { desc = '[T]oggle Render Markdown' })
    require('render-markdown').setup(opts)
  end,
}
