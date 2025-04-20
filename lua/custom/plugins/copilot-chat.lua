-- [[ Configure Copilot Chat ]]

return {
  'CopilotC-Nvim/CopilotChat.nvim',
  event = 'VeryLazy',
  lazy = false,
  branch = 'main',
  dependencies = {
    'zbirenbaum/copilot.lua',
    'nvim-lua/plenary.nvim',
  },

  -- Only on MacOS or Linux
  build = 'make tiktoken',

  opts = {
    system_prompt = 'COPILOT_INSTRUCTIONS',
    model = 'claude-3.7-sonnet',
    answer_header = '  Copilot ',
    question_header = ' Enrique ',

    -- NOTE: Contexts provide additional information to the chat. Add context using `#context_name[:input]` syntax.
    -- Examples:
    -- > #buffer
    -- > #buffer:2
    -- > #files:\*.lua
    -- > #filenames
    -- > #git:staged
    -- > #url:https://example.com
    -- > #system:`ls -la | grep lua`
    --
    -- Default context or array of contexts to use.
    context = nil,

    -- Uses visual selection or falls back to buffer
    selection = function(source)
      local select = require 'CopilotChat.select'
      return select.visual(source) or select.buffer(source)
    end,

    prompts = {
      Explain = {
        prompt = '/COPILOT_EXPLAIN\n\nWrite an explanation for the selected code.',
      },
      Review = {
        prompt = '/COPILOT_REVIEW\n\nReview the selected code.',
      },
      Fix = {
        prompt = '/COPILOT_GENERATE\n\nThere is a problem in the selected code. Rewrite the code with the bug fixed.',
      },
      Optimize = {
        prompt = '/COPILOT_GENERATE\n\nOptimize the selected code to improve performance and readability.',
      },
      Docs = {
        prompt = '/COPILOT_GENERATE\n\nPlease add documentation comments to the selected code.',
      },
      Tests = {
        prompt = '/COPILOT_GENERATE\n\nPlease generate tests for the selected code.',
        mapping = '<leader>ct',
        description = 'Write [T]ests',
      },
      Commit = {
        prompt = '#git:staged\n\nWrite commit message for the changes using the conventional commits specification.',
        mapping = '<leader>cc',
        description = 'Write a [C]ommit Message',
      },
      PrDescription = {
        prompt = '#pr\n\nPlease generate a description for a pull request using the context provided from the pr_diff text file. The description should have two sections: #1 titled What does this PR do? (with an emoji of a thinking face) describing the main goal and summary of the pull request, and #2 Detailed Changes (with the memo emoji) describing all changes, do not put the file names just describe the changes.',
        mapping = '<leader>cp',
        description = 'Write a [P]ull Request description',
      },
      PythonDocstring = {
        prompt = '/COPILOT_GENERATE\n\nGenerate a docstring for the selected function code, remember to use the google convention for docstrings.',
        mapping = '<leader>cd',
        description = 'Write [D]ocstring',
      },
    },

    contexts = {
      pr = {
        description = 'Includes the diff of the current branch against the main branch.',
        input = function(callback)
          callback()
        end,
        resolve = function()
          local handle = io.popen 'git diff main...HEAD'
          if handle == nil then
            return ''
          end
          local result = handle:read '*a'
          handle:close()

          return {
            {
              content = result,
              filename = 'pr_diff',
              filetype = 'text',
            },
          }
        end,
      },
    },

    window = {
      layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
      width = 60, -- fractional width of parent, or absolute width in columns when > 1 (vertical)
      height = 0.5, -- fractional height of parent, or absolute height in rows when > 1 (horizontal)

      -- NOTE: Options below only apply to floating windows
      relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
      border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
      row = nil, -- row position of the window, default is centered
      col = nil, -- column position of the window, default is centered
      title = 'Copilot Chat', -- title of chat window
      footer = nil, -- footer of chat window
      zindex = 1, -- determines if window is on top or below other floating windows
    },

    mappings = {
      complete = { insert = '<Tab>' },
    },
  },

  config = function(_, opts)
    vim.keymap.set({ 'n', 'v', 'x' }, '<leader>co', ':CopilotChat<CR>', { desc = '[O]pen Chat' })
    vim.keymap.set({ 'v', 'x' }, '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Write Code [E]xplanation' })
    require('CopilotChat').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
