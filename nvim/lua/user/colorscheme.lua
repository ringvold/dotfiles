vim.cmd [[
try
  colorscheme darkerplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
