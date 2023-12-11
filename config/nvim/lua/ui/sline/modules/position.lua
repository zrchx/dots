local fn = vim.fn
local M = function()
  local current = fn.line "."
  local total = fn.line "$"

  return "%#StalineProgress#" .. " " .. current .. "/" .. total .. " %#StalineEmptySpace#"
end
return M
