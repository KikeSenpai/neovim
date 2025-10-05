-- [[ Configure Code Companion ]]

return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ravitemer/mcphub.nvim',
  },
  opts = {
    extensions = {
      mcphub = {
        callback = 'mcphub.extensions.codecompanion',
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true,
        },
      },
    },
    strategies = {
      chat = {
        adapter = {
          name = 'anthropic',
          model = 'claude-sonnet-4-5-20250929',
        },
      },
      inline = {
        adapter = {
          name = 'anthropic',
          model = 'claude-sonnet-4-5-20250929',
        },
      },
      cmd = {
        adapter = {
          name = 'anthropic',
          model = 'claude-sonnet-4-5-20250929',
        },
      },
    },
    adapters = {
      http = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = 'ANTHROPIC_API_KEY',
            },
          })
        end,
      },
    },
  },
  config = function(_, opts)
    vim.keymap.set('n', '<leader>at', ':CodeCompanionChat Toggle<CR>', { desc = '[T]oggle AI Chat' })
    vim.keymap.set('n', '<leader>ac', ':CodeCompanionChat<CR>', { desc = 'Open AI [C]hat' })
    vim.keymap.set({ 'v', 'x' }, '<leader>ak', ':CodeCompanion<CR>', { desc = 'As[k] AI Inline' })
    vim.keymap.set('n', '<leader>aa', ':CodeCompanionActions<CR>', { desc = 'Show AI [A]ctions' })

    -- NOTE: Disables the requirement of approvals and automatically saves any edited buffer. Set to nil to undo this.
    vim.g.codecompanion_yolo_mode = true

    require('codecompanion').setup(opts)
  end,
}
