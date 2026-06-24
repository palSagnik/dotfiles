-- Keymaps for better default experience

-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


-- window management
Map('n', '<leader>v', '<C-w>v') -- split window vertically
Map('n', '<leader>h', '<C-w>s') -- split window horizontally
Map('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
Map('n', '<leader>xs', ':close<CR>') -- close current split window

-- window movement keys
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")

-- resizing with arrows
Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

-- vertical scroll and center
Map('n', '<C-d>', '<C-d>zz')
Map('n', '<C-u>', '<C-u>zz')

-- find and center
Map('n', 'n', 'nzzzv')
Map('n', 'N', 'Nzzzv')

-- buffers
Map('n', '<Tab>', ':bnext<CR>')
Map('n', '<S-Tab>', ':bprevious<CR>')
Map('n', '<C-i>', '<C-i>') -- to restore jump forward
Map('n', '<leader>x', ':bd<CR>') -- close buffer
Map('n', '<leader>b', '<cmd> enew <CR>') -- new buffer

-- quit file
Map('n', '<C-q>', '<cmd> q <CR>')

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>')

-- tabs
Map('n', '<leader>to', ':tabnew<CR>') -- open new tab
Map('n', '<leader>tx', ':tabclose<CR>') -- close current tab
Map('n', '<leader>tn', ':tabn<CR>') --  go to next tab
Map('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

-- quit search
Map('n', '<Esc>', '<cmd>nohlsearch<CR>')
