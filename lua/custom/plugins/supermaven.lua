-- [[ Configure code auto-completion ]]

return {
  'supermaven-inc/supermaven-nvim',
  opts = {
    keymaps = {
      accept_suggestion = '<M-CR>',
      clear_suggestion = '<C-[>',
      accept_word = '<M-;>',
    },
    ignore_filetypes = {},
    log_level = 'off',
    disable_inline_completion = false,
    disable_keymaps = false,
    condition = function()
      return false
    end,
  },
  config = function(_, opts)
    require('supermaven-nvim').setup(opts)
  end,
}
