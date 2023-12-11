local dashboard = require("alpha.themes.dashboard")

local function date ()
  return os.date(" [%d/%m] ")
end
-- todo: for loop to check date
local ascii = {
  "███▄▄▄▄      ▄████████  ▄████████    ▄████████  ▄██████▄  ▀████    ▐████▀ ",
  "███▀▀▀██▄   ███    ███ ███    ███   ███    ███ ███    ███   ███▌   ████▀  ",
  "███   ███   ███    █▀  ███    █▀    ███    ███ ███    ███    ███  ▐███    ",
  "███   ███  ▄███▄▄▄     ███         ▄███▄▄▄▄██▀ ███    ███    ▀███▄███▀    ",
  "███   ███ ▀▀███▀▀▀     ███        ▀▀███▀▀▀▀▀   ███    ███    ████▀██▄     ",
  "███   ███   ███    █▄  ███    █▄  ▀███████████ ███    ███   ▐███  ▀███    ",
  "███   ███   ███    ███ ███    ███   ███    ███ ███    ███  ▄███     ███▄  ",
  " ▀█   █▀    ██████████ ████████▀    ███    ███  ▀██████▀  ████       ███▄ ",
  "                                    ███    ███                            ",
}

dashboard.section.header.val = ascii

dashboard.section.buttons.val = {
  dashboard.button("f", "File Explorer", ":NvimTreeFocus<CR>"),
  dashboard.button("a", "New File", ":edit"),
  dashboard.button("q", "Exit", ":q<CR>")
}

dashboard.section.footer.val = date()
dashboard.section.footer.opts.hl = "Constant"

require("alpha").setup(dashboard.opts)
