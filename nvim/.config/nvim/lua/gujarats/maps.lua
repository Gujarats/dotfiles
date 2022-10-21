local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

keymap.set('n', '<F2>', ':NERDTreeToggle<CR>')
keymap.set('n', '<F3>', ':VTerm<CR>')

-- tab keymap
keymap.set('n','<leader>1','1gt')
keymap.set('n','<leader>2','2gt')
keymap.set('n','<leader>3','3gt')
keymap.set('n','<leader>4','4gt')
keymap.set('n','<leader>5','5gt')
keymap.set('n','<leader>6','6gt')
keymap.set('n','<leader>7','7gt')

