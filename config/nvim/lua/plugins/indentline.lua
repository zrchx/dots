require("ibl").setup({
  indent = { char = "|" },
  exclude = {
    filetypes = { "help", "man", "lazy", "mason" },
    buftypes = { "terminal" },
  },
})
