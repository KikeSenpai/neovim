-- [[ Configure avante.nvim plugin designed to emulate the behaviour of the Cursor AI IDE ]]

return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,

  -- Set this to '*' to always pull the latest release version.
  version = '*',

  build = 'make',
  opts = {
    provider = 'copilot',
    auto_suggestion_provider = 'copilot',
    copilot = {
      endpoint = 'https://api.githubcopilot.com',
      model = 'claude-3.7-sonnet',
      proxy = nil,
      allow_insecure = false,
      timeout = 30000,
      temperature = 0,
      max_tokens = 4096,
    },
    mappings = {
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-CR>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',

    -- NOTE: Support for image pasting
    -- {
    --   'HakonHarnes/img-clip.nvim',
    --   event = 'VeryLazy',
    --   opts = {
    --     default = {
    --       embed_image_as_base64 = false,
    --       prompt_for_file_name = false,
    --       drag_and_drop = {
    --         insert_mode = true,
    --       },
    --
    --       -- Required for Windows users
    --       use_absolute_path = true,
    --     },
    --   },
    -- },
    --
  },
}
