require("nvim-autopairs").setup({
  fast_wrap = {},
  disable_filetype = { "vim" },
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("comfirm_done", cmp_autopairs.on_confirm_done())
