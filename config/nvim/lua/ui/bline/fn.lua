local get_name = vim.api.nvim_buf_get_name
local listbuff = vim.api.nvim_list_bufs
local validbuff = vim.api.nvim_buf_is_valid
local loadbuff = vim.api.nvim_buf_is_loaded

local M = {}
M.bufilter = function()
  local bufs = listbuff() or nil

  if not bufs then
    return {}
  end

  for i = #bufs, 1, -1 do
    local filename = (#get_name(bufs[i]) ~= 0) and
        vim.fn.fnamemodify(get_name(bufs[i]), ":t") or
        ""
    if not validbuff(bufs[i]) or not vim.bo[bufs[i]].buflisted or not loadbuff(bufs[i]) or filename == '' then
      table.remove(bufs, i)
    end
  end

  return bufs
end

M.tabuflinePrev = function()
  local bufs = M.bufilter()
  for i, v in ipairs(bufs) do
    if vim.api.nvim_get_current_buf() == v then
      vim.cmd(i == 1 and "b" .. bufs[#bufs] or "b" .. bufs[i - 1])
      break
    end
  end
end
M.tabuflineNext = function()
  local bufs = M.bufilter()

  for i, v in ipairs(bufs) do
    if vim.api.nvim_get_current_buf() == v then
      vim.cmd(i == #bufs and "b" .. bufs[1] or "b" .. bufs[i + 1])
      break
    end
  end
end


M.close_buffer = function(bufnr)
  if vim.bo.buftype == "terminal" then
    vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
  else
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    if bufnr == vim.api.nvim_get_current_buf() then
      require("ui.bline.fn").tabuflinePrev()
    end
    vim.cmd("confirm bd" .. bufnr)
  end
end

return M
