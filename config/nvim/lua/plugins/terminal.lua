local wratio = 0.4
local hratio = 0.5
require("toggleterm").setup({
  direction = "float",
  auto_scroll = true,
  float_opts = {
    border = "double",
    width = function ()
      local w = vim.opt.columns:get()
      return math.floor(w * wratio)
    end,
    height = function ()
      local h = vim.opt.lines:get() -
        vim.opt.cmdheight:get()
      return math.floor(h * hratio)
    end
  }
})
