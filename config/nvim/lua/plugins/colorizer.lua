require("colorizer").setup({
  user_default_options = {
    name = false,
    RRGGBBAA = true,
  }
})

vim.defer_fn(function()
  require("colorizer").attach_to_buffer(0)
end, 0)
