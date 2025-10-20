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
    prompt_library = {
      ['Generate a Commit Message'] = {
        strategy = 'chat',
        description = 'Generate a commit message',
        opts = {
          index = 7,
          is_default = true,
          is_slash_cmd = true,
          short_name = 'commit',
          auto_submit = true,
        },
        prompts = {
          {
            role = 'user',
            content = function()
              return string.format(
                [[You are an expert at following the Conventional Commit specification.

              If the branch name %s contains someting like ABC-123 being ABC any three uppercase letters,
              and being 123 any three digit number; that would be the <ticket-number>, which should be used
              like this for the conventional commit message, e.g.:

              <commit-type>(<ticket-number>): summary commit message

              - Details about the commit.
              - ...

              If the branch name doesn't contain a <ticket_number> then the commit message should just be like:

              <commit-type>: summary commit message

              - Details about the commit.
              - ...

              Given the git diff listed below, please generate a commit message for me:
              ```diff
              %s
              ```]],
                vim.fn.system 'git branch --show-current',
                vim.fn.system 'git diff --no-ext-diff --staged'
              )
            end,
            opts = {
              contains_code = true,
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    local codecompanion = require 'codecompanion'

    vim.keymap.set('n', '<leader>at', ':CodeCompanionChat Toggle<CR>', { desc = '[T]oggle AI Chat' })
    vim.keymap.set('n', '<leader>ai', ':CodeCompanionChat<CR>', { desc = 'Open A[I] Chat' })
    vim.keymap.set({ 'v', 'x' }, '<leader>ak', ':CodeCompanion<CR>', { desc = 'As[k] AI Inline' })
    vim.keymap.set('n', '<leader>aa', ':CodeCompanionActions<CR>', { desc = 'Show AI [A]ctions' })
    vim.keymap.set('n', '<leader>ac', function()
      codecompanion.prompt 'commit'
    end, { noremap = true, silent = true, desc = 'Generate a [C]ommit Message' })

    -- NOTE: Disables the requirement of approvals and automatically saves any edited buffer. Set to nil to undo this.
    vim.g.codecompanion_yolo_mode = true

    codecompanion.setup(opts)
  end,
}
