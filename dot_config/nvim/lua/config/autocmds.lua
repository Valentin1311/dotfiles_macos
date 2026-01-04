-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.opt_local.makeprg = "npm run build"
    vim.opt_local.errorformat = "%f(%l\\,%c): %m"
  end,
})

-- Set undofile = false on /tmp/ files to avoid leaking creds
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname:match("^/tmp/") then
      vim.opt_local.undofile = false
    end
  end,
})
