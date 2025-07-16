-- [[ Configure Formatters and Autoformatting ]]

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = '',
      desc = '[F]ormat the current buffer',
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      -- NOTE: Conform can also run multiple formatters sequentially
      --
      -- python = {
      --   'isort',
      --   'black'
      -- },

      -- NOTE: You can use a sub-list to tell conform to run until a formatter is found.
      --
      -- javascript = { { "prettierd", "prettier" } },

      lua = { 'stylua' },
      terraform = { 'terraform_fmt' },
      markdown = { 'markdownlint' },
      json = { 'jq' },
    },
    default_format_opts = {
      lsp_format = 'never',
    },
    format_on_save = function(bufnr)
      local disable_filetypes = {
        'proto',
        'markdown',
      }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
