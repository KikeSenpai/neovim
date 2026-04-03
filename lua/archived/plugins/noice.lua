-- [[ Replaces the UI for messages, cmdline and the popupmenu ]]

return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-notify',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      routes = {
        { view = 'notify', filter = { event = 'msg_showmode' } },
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      ---@diagnostic disable: missing-fields
      require('notify').setup {
        render = 'wrapped-compact',
        fps = 60,
        max_width = 50,
        top_down = false,
      }
    end,
  },
}
