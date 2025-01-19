-- [[ Replaces the UI for messages, cmdline and the popupmenu ]]

return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-notify',
    'MunifTanjim/nui.nvim',
  },
  opts = {},
}
