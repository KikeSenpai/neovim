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
      require('notify').setup {
        render = 'wrapped-default',
        max_width = 50,
        timeout = 100,
        top_down = false,
      }
    end,
  },
}
