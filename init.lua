--[[

=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

TODO: If you don't know anything about Lua, I recommend taking some time to read through
  a guide. One possible example which will only take 10-15 minutes:
    - https://learnxinyminutes.com/docs/lua/
  After understanding a bit more about Lua, you can use `:help lua-guide` as a
  reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

--]]

if not vim.g.vscode then
  -- NOTE: Load the configuration for Neovim

  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  WARN: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Assign a virtualenv for Neovim so that the `pynvim` package is not required for each virtualenv
  -- See `:help provider-python`
  vim.g.python3_host_prog = '/Users/enrique.perez/.pyenv/versions/py3.12-nvim/bin/python'

  -- Set to true if you have a Nerd Font installed and selected in the terminal
  vim.g.have_nerd_font = true

  -- Setting options
  require 'options'

  -- Setting Keymaps
  require 'keymaps'

  -- Install `lazy.nvim` plugin manager
  require 'lazy-bootstrap'

  -- Install and setup plugins
  require 'lazy-plugins'
else
  -- NOTE: Load the configuration for VSCode

  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  WARN: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Setting options
  require 'visual-studio-code.options'

  -- Setting Keymaps
  require 'visual-studio-code.keymaps'

  -- Install `lazy.nvim` plugin manager
  require 'lazy-bootstrap'

  -- Install and setup plugins
  require 'visual-studio-code.lazy-plugins'
end

-- vim: ts=2 sts=2 sw=2 et
