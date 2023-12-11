require("mason").setup{
  PATH = "skip",
  max_concurrent_installers = 2,
  ui = {
    icons = {
      package_pending = "*",
      package_installed = "+",
      package_uninstalled = "-",
    },
  },
}
