-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.commands")

vim.opt.makeprg = "npx tsc --pretty false"
vim.opt.errorformat = "%f(%l\\,%c): %m"
