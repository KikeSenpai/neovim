-- [[ Collection of various small independent plugins/modules ]]

return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    -- Examples:
    --   va)  - [V]isually select [A]round [)]paren
    --   yin' - [Y]ank [I]nside [N]ext [']quote
    --   ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- Examples:
    --   saiw)  - [S]urround [A]dd [I]nner [W]ord [)]Paren
    --   sd'    - [S]urround [D]elete [']quotes
    --   sr)'   - [S]urround [R]eplace [)] [']
    --   2saiw* - [S]urround [A]dd [I]nner [W]ord [2]two [*]Asterisks
    require('mini.surround').setup()

    -- Better navigation and manipulation of the file system
    local mini_files = require 'mini.files'
    vim.keymap.set('n', '<leader>em', function()
      mini_files.open()
    end, { desc = 'Open [M]ini File Explorer' })
    mini_files.setup {
      mappings = {
        go_in = 'L',
        go_in_plus = '',
        go_out = 'H',
        go_out_plus = '',
        synchronize = 'U',
      },
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf = args.data.buf_id

        vim.keymap.set('n', 'L', function()
          local entry = mini_files.get_fs_entry()
          if entry and entry.fs_type == 'file' then
            mini_files.go_in { close_on_file = true }
          else
            mini_files.go_in()
          end
        end, { buffer = buf, desc = 'Go in (close on file)' })

        vim.keymap.set('n', '<C-v>', function()
          local entry = mini_files.get_fs_entry()
          if entry and entry.fs_type == 'file' then
            mini_files.close()
            vim.cmd('vsplit ' .. vim.fn.fnameescape(entry.path))
          end
        end, { buffer = buf, desc = 'Open in vertical split' })
      end,
    })

    -- Auto-pairs for quotes, brackets, etc.
    require('mini.pairs').setup()

    -- Go to the next/previous element using square brackets.
    -- Examples:
    --  [b - Go to the previous [B]uffer
    --  ]b - Go to the next [B]uffer
    --  [B - Go to the first [B]uffer
    --  ]B - Go to the last [B]uffer
    require('mini.bracketed').setup()

    local diff = require 'mini.diff'
    diff.setup {
      source = diff.gen_source.none(),
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
