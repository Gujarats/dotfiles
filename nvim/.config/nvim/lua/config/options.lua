-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
function DetectGoHtmlTmpl()
  if vim.fn.expand("%:e") == "html" and vim.fn.search("{{") ~= 0 then
    vim.treesitter.language.register("html", { "gohtml", "gohtmltmpl" })
    vim.o.filetype = "gohtml"
  elseif vim.fn.expand("%:e") == "html" then
  end
end

local goHtmlGroup = vim.api.nvim_create_augroup("filetypedetect", { clear = false })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.html",
  group = goHtmlGroup,
  callback = DetectGoHtmlTmpl,
})
