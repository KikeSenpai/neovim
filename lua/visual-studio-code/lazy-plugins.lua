-- [[ Configure and install plugins ]]

require('lazy').setup {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- Examples:
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Go to the next/previous element using square brackets.
      -- Examples:
      --  [b - Go to the previous [B]uffer
      --  ]b - Go to the next [B]uffer
      --  [B - Go to the first [B]uffer
      --  ]B - Go to the last [B]uffer
      require('mini.bracketed').setup()
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>jp',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = '[J]ump to [P]attern',
      },
      {
        '<leader>jt',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = '[J]ump to syntax [T]ree block',
      },
      -- {
      --   'r',
      --   mode = 'o',
      --   function()
      --     require('flash').remote()
      --   end,
      --   desc = 'Remote Flash',
      -- },
      -- {
      --   'R',
      --   mode = { 'o', 'x' },
      --   function()
      --     require('flash').treesitter_search()
      --   end,
      --   desc = 'Treesitter Search',
      -- },
      -- {
      --   '<c-s>',
      --   mode = { 'c' },
      --   function()
      --     require('flash').toggle()
      --   end,
      --   desc = 'Toggle Flash Search',
      -- },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
