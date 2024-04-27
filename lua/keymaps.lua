-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to [P]revious [D]iagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to [N]ext [D]iagnostic message' })
vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic error [M]essages' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix [L]ist' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Set jk as scape key
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape from insert mode' })

-- Stay in indentation mode
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })

-- Move lines up and down with vim motions
vim.keymap.set('n', 'K', ':m .-2<CR>==', { desc = 'Move line up in normal mode' })
vim.keymap.set('n', 'J', ':m .+1<CR>==', { desc = 'Move line down in normal mode' })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line up in visual mode' })
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move line down in visual mode' })

-- Resize windows with vim motions (Linux)
vim.keymap.set('n', '<C-A-k>', ':resize +2<CR>', { desc = 'Increase window size vertically' })
vim.keymap.set('n', '<C-A-j>', ':resize -2<CR>', { desc = 'Decrease window size vertically' })
vim.keymap.set('n', '<C-A-h>', ':vertical resize -2<CR>', { desc = 'Decrease window size horizontally' })
vim.keymap.set('n', '<C-A-l>', ':vertical resize +2<CR>', { desc = 'Increase window size horizontally' })

-- Resize windows with vim motions (MacOs)
-- vim.keymap.set('n', '<C-S-k>', ':resize +2<CR>', { desc = 'Increase window size vertically' })
-- vim.keymap.set('n', '<C-S-j>', ':resize -2<CR>', { desc = 'Decrease window size vertically' })
-- vim.keymap.set('n', '<C-S-h>', ':vertical resize -2<CR>', { desc = 'Decrease window size horizontally' })
-- vim.keymap.set('n', '<C-S-l>', ':vertical resize +2<CR>', { desc = 'Increase window size horizontally' })

-- Mappings to manage buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Goto [N]ext [B]uffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Goto [P]revious [B]uffer' })
vim.keymap.set('n', '<leader>bd', ':bd|edit#<CR>', { desc = '[D]elete current [B]uffer' })
vim.keymap.set('n', '<leader>ba', ':%bd|edit#|bd#<CR>', { desc = 'Delete [A]ll [B]uffers except current' })

-- Mappings to manage windows
vim.keymap.set('n', '<leader>wh', '<C-W>s', { desc = 'Split [W]indow [H]orizontally' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split [W]indow [V]ertically' })
vim.keymap.set('n', '<leader>we', '<C-W>=', { desc = 'Make split [W]indows [E]qual width' })
vim.keymap.set('n', '<leader>wq', '<C-W>q', { desc = '[Q]uit current [W]indow' })

-- Copilot keymaps
-- vim.keymap.set('i', '<S-l>', '<Plug>(copilot-accept-word)', { desc = 'Accept Copilot next word suggestion' })
-- vim.keymap.set('i', '<C-S-l>', '<Plug>(copilot-accept-line)', { desc = 'Accept Copilot next line suggestion' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open help window in a vertical split to the right
vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Open help window in a vertical split to the right',
  group = vim.api.nvim_create_augroup('help-window-right', { clear = true }),
  pattern = { '*.txt' },
  callback = function()
    if vim.bo.filetype == 'help' then
      vim.cmd.wincmd 'L'
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
