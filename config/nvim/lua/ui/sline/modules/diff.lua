local M = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict
  local t = tonumber

  local added = (git_status.added and git_status.added ~= 0)
    and (" + " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0)
    and (" ~ " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0)
    and (" - " .. git_status.removed) or ""

  if (t(git_status.added) and t(git_status.added) > 0) or
    (t(git_status.changed) and t(git_status.changed)) > 0 or
    (t(git_status.removed) and t(git_status.removed) > 0) then
    return "%#StalineDiffAdd#" .. added ..
      "%#StalineDiffChange#" .. changed ..
      "%#StalineDiffRemove#" .. removed ..
      " %#StalineEmptySpace#"
  else
    return ""
  end
end

return M
