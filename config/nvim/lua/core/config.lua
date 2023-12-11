local o = vim.opt
-- Config
o.virtualedit = "block"
o.undofile = true
o.showmode = false
o.updatetime = 100
o.signcolumn = "yes"
o.linebreak = true
o.cmdheight = 0
-- Numbers
o.number = true
o.cursorline = true
o.relativenumber = true
o.cursorlineopt = "number"
-- Search
o.ignorecase = true
o.smartcase = true
-- Mouse
o.mouse = "a"
o.mousefocus = true
o.mousemoveevent = true
-- Shorter messages
o.shortmess:append("c")
-- Indent
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 0
-- Split
o.splitright = true
o.splitbelow = true
-- Clipboard
o.clipboard = "unnamedplus"
-- Fillchars
o.fillchars = {
  vert = "|",
  vertleft = "|",
  vertright = "|",
  verthoriz = "+",
  horiz = "-",
  horizup = "-",
  horizdown = "-",
  fold = "-",
  eob = " ",
  diff = "-",
  msgsep = "-",
  foldopen = "+",
  foldsep = "-",
  foldclose = ">"
}
-- Listchars
o.list = true
o.listchars = {
	space = " ",
	tab = "| ",
}
-- Colors
o.termguicolors = true
-- Disable some things
local builtings = {
  "2html_plugin", "getscript",
  "getscriptPlugin", "gzip",
  "logipat", "netrw",
  "netrwPlugin", "netrwSettings",
  "netrwFileHandlers", "matchit",
  "matchparen", "tar",
  "tarPlugin", "rrhelper",
  "spellfile_plugin", "vimball",
  "vimballPlugin", "zip",
  "zipPlugin", "logipat",
  "matchit", "tutor",
  "rplugin", "syntax",
  "synmenu", "optwin",
  "compiler", "bugreport",
  "ftplugin", "archlinux",
  "fzf", "tutor_mode_plugin",
  "sleuth", "vimgrep"
}
for _, builds in ipairs(builtings) do
  vim.g["loaded_" .. builds] = 1
end
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_prokvider"] = 0
end
-- LSP path to binaries
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath "data" .. "/mason/bin"
