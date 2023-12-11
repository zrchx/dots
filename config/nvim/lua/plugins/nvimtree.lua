require("nvim-tree").setup({
  hijack_cursor = true,
  filters = { custom = { "^.git$" } },
  system_open = {cmd = " "},
  view = {
    adaptive_size = true,
    side = "left",
    signcolumn = "no",
  },
  renderer = {
    full_name = true,
    root_folder_label = false,
    highlight_git = true,
    icons = {
			git_placement = "after",
      glyphs = {
        default = "",
        symlink = "->",
        bookmark = "",
        modified = "x",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = " ->",
          symlink_open = " ->",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          untracked = "!",
          unstaged = "~",
          staged = "+",
          unmerged = "%",
          renamed = "*!",
          deleted = "-",
          ignored = "#",
        },
      },
    },
  },
})
