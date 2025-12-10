-- [[ Useful plugin to show you pending keybinds ]]

return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Load after vim has started
  opts = {
    delay = 0,
    preset = false,
    icons = {
      mappings = vim.g.have_nerd_font,
    },
    win = {
      no_overlap = true,
      border = 'rounded',
      padding = { 1, 2 },
      row = math.huge,
      col = math.huge,
      width = 45,
      height = { min = 4, max = 25 },
    },

    -- Document existing key chains
    spec = {
      { '<leader>d', group = '[D]iagnostic' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]indow' },
      { '<leader>b', group = '[B]uffer' },
      { '<leader>g', group = '[G]oto' },
      { '<leader>l', group = '[L]SP' },
      { '<leader>j', group = '[J]ump anywhere' },
      { '<leader>h', group = 'Git [H]unks', mode = { 'n', 'v' } },
      { '<leader>o', group = '[O]bsidian' },
      { '<leader>p', group = 'S[p]ell Checking' },
      { '<leader>m', group = '[M]arkdown', mode = { 'n' } },
      -- { '<leader>e', group = 'File [E]xplorer' },
      -- { '<leader>c', group = '[C]opilot', mode = { 'n', 'v' } },
      -- { '<leader>a', group = '[A]I' },
    },
  },
  config = function(_, opts)
    require('which-key').setup(opts)
  end,
}

-- vim: ts=2 sts=2 sw=2 et
