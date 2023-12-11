local run = function ()
  local mode = require("ui.sline.modules.mode")
  local filename = require("ui.sline.modules.filename")
  local diagnostic = require("ui.sline.modules.diagnostic")
  local lsp = require("ui.sline.modules.lsp")
  local diff = require("ui.sline.modules.diff")
  local branch = require("ui.sline.modules.branch")
  local position = require("ui.sline.modules.position")

  return table.concat{
    mode(),
    filename(),
    branch(),
    diff(),
    "%=",
    diagnostic(),
    lsp() or "",
    position(),
  };
end

local setup = function()
  vim.opt.statusline = run()
  vim.api.nvim_create_autocmd({ "ModeChanged", "CursorHold" }, {
    callback = function()
      vim.opt.statusline = run()
    end
  })
end

return { run = run, setup = setup }
