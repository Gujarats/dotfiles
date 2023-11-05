print('lua.init loaded')
-- disable netrw at the very start of your init.lua (strongly advised)
-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('gujarats.base')
require('gujarats.highlights')
require('gujarats.plugins')
require('gujarats.maps')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('gujarats.macos')
end
--if is_win then
--	print('is win check')
--	require('gujarats.windows')
--else
--	print('is linux check')
--	require('gujarats.linux')
--end
