return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        go = { 'gofmt' },
        terraform = { 'terraform_fmt' },
        yaml = { 'prettier' },
        json = { 'prettier' },
        markdown = { 'prettier' },
        sh = { 'shfmt' },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end
}
