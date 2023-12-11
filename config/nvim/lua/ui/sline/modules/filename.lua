local fn = vim.fn
local M = function()
  local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"
  if filename ~= "Empty " then
    if filename == "NvimTree_1" then
      filename = "Files"
    end
    if string.find(filename, "toggleterm") then
      filename = "Term"
    end
  end
  return "%#StalineFilename#" .. " " .. filename .. " %#StalineEmptySpace#"
end
return M
