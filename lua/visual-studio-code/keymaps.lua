-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', [[<cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>]], { silent = true })
vim.keymap.set('n', '<C-j>', [[<cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>]], { silent = true })
vim.keymap.set('n', '<C-k>', [[<cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>]], { silent = true })
vim.keymap.set('n', '<C-l>', [[<cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>]], { silent = true })

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

-- Mappings to manage windows
vim.keymap.set('n', '<leader>wh', '<C-W>s', { desc = 'Split [W]indow [H]orizontally' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split [W]indow [V]ertically' })
vim.keymap.set('n', '<leader>we', '<C-W>=', { desc = 'Make split [W]indows [E]qual width' })
vim.keymap.set('n', '<leader>wq', '<C-W>q', { desc = '[Q]uit current [W]indow' })

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

-- vim: ts=2 sts=2 sw=2 et
