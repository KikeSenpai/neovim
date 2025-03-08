--[[

  Configure Copilot Auto-Completion

  NOTE: Once copilot is running, run `:Copilot auth` to start the authentication process.

--]]

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {

      -- NOTE: Panel can be used to preview suggestions in a split window.
      -- You can run the `:Copilot panel` command to open it.
      panel = { enabled = false },

      suggestion = {
        enabled = true,

        -- NOTE: When `auto_trigger` is true, copilot starts suggesting as soon as you enter insert mode.
        -- When `auto_trigger` is false, use the `next` or `prev` keymap to trigger copilot suggestion.
        -- To toggle `auto_trigger` for the current buffer, use `require('copilot.suggestion').toggle_auto_trigger()`.
        auto_trigger = true,

        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = '<M-CR>',
          accept_word = false,
          accept_line = '<M-l>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        ['*'] = false,
        lua = true,
        python = true,
        json = true,
        yaml = true,
        markdown = true,
        css = true,
        sql = true,
        make = true,
      },
    }
  end,
}
