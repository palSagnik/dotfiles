vim.wo.number = true
vim.o.relativenumber = true
vim.o.clipboard = 'unnamedplus'
vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.opt.updatetime = 250

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = true,  -- shows which LSP is reporting the error
  },
})

vim.g.lazygit_floating_window_winblend = 10        -- transparency of the floating window (0 = opaque)
vim.g.lazygit_floating_window_scaling_factor = 0.6 -- how much of the screen the window covers
vim.g.lazygit_floating_window_use_plenary = 0      -- use plenary.nvim for window mgmt if available
vim.g.lazygit_floating_window_border_chars = {'╭','─','╮','│','╯','─','╰','│'} -- border glyphs
vim.g.lazygit_use_neovim_remote = 1  -- auto-set based on nvr detection; you already have this covered
vim.g.lazygit_use_custom_config_file_path = 0
vim.g.lazygit_config_file_path = ''  -- or a table of paths, if you want a custom lazygit config.yml per-project
vim.g.lazygit_on_exit_callback = nil -- function to run after lazygit closes
