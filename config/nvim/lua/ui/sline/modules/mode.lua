local api = vim.api
local modes = {
  ["n"] = { "󰛡", "StalineNormalMode" },
  ["niI"] = { "󰛡", "StalineNormalMode" },
  ["niR"] = { "󰛡", "StalineNormalMode" },
  ["niV"] = { "󰛡", "StalineNormalMode" },
  ["no"] = { "󰛡", "StalineNormalMode" },
  ["i"] = { "󰛡", "StalineInsertMode" },
  ["ic"] = { "󰛡", "StalineInsertMode" },
  ["ix"] = { "󰛡", "StalineInsertMode" },
  ["t"] = { "󰛡", "StalineTerminalMode" },
  ["nt"] = { "󰛡", "StalineNTerminalMode" },
  ["v"] = { "󰛡", "StalineVisualMode" },
  ["V"] = { "󰛡", "StalineVisualMode" },
  ["Vs"] = { "󰛡", "StalineVisualMode" },
  [""] = { "󰛡", "StalineVisualMode" },
  ["R"] = { "󰛡", "StalineReplaceMode" },
  ["Rv"] = { "󰛡", "StalineReplaceMode" },
  ["s"] = { "󰛡", "StalineSelectMode" },
  ["S"] = { "󰛡", "StalineSelectMode" },
  [""] = { "󰛡", "StalineSelectMode" },
  ["c"] = { "󰛡", "StalineCommandMode" },
  ["cv"] = { "󰛡", "StalineCommandMode" },
  ["ce"] = { "󰛡", "StalineCommandMode" },
  ["r"] = { "󰛡", "StalineConfirmMode" },
  ["rm"] = { "󰛡", "StalineConfirmMode" },
  ["r?"] = { "󰛡", "StalineConfirmMode" },
  ["!"] = { "󰛡", "StalineTerminalMode" },
}


local M = function()
  local mode = api.nvim_get_mode().mode
  return "%#" .. modes[mode][2] .. "#" .. " " .. modes[mode][1] .. " ";
end

return M
