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
vim.keymap.set(
  'n',
  '<leader>wh',
  [[<cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>]],
  { desc = 'Split editor window horizontally to the bottom', silent = true }
)
vim.keymap.set(
  'n',
  '<leader>wv',
  [[<cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>]],
  { desc = 'Split editor window vertically to the right', silent = true }
)
vim.keymap.set(
  'n',
  '<leader>wq',
  [[<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>]],
  { desc = 'Close current editor window', silent = true }
)

-- Mappings to manage left sidebar
vim.keymap.set(
  'n',
  '<leader>ef',
  [[<cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>]],
  { desc = 'Focus file explorer', silent = true }
)
vim.keymap.set(
  'n',
  '<leader>ee',
  [[<cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>]],
  { desc = 'Toggle sidebar', silent = true }
)

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
