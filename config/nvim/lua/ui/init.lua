vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
  callback = function ()
    vim.opt.laststatus = 3
    require("ui.sline").setup()
    require("ui.bline").setup()
  end
})
