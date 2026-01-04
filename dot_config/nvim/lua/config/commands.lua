vim.api.nvim_create_user_command("NpxTsc", function()
  vim.opt.makeprg = "npx tsc --pretty false"
  vim.opt.errorformat = "%f(%l\\,%c): %m"

  vim.cmd("Make")
end, { desc = "Run tsc async and populate quickfix" })

vim.api.nvim_create_user_command("NpxESlint", function()
  vim.opt.makeprg = "npx eslint -f unix . --fix"
  vim.opt.errorformat = "%f:%l:%c: %m"

  vim.cmd("Make")
end, { desc = "Run ESLint async and populate quickfix" })

vim.api.nvim_create_user_command("NpxPrettier", function()
  vim.opt.makeprg = "npx prettier --write ."
  vim.opt.errorformat = "%f:%l:%c: %m"

  vim.cmd("Make")
end, { desc = "Run Prettier async and populate quickfix" })

vim.api.nvim_create_user_command("FileNpxPrettier", function()
  local filepath = vim.fn.expand("%:p")
  vim.opt.makeprg = "npx prettier --write " .. filepath
  vim.opt.errorformat = "%f:%l:%c: %m"

  vim.cmd("Make")
end, { desc = "Run Prettier async and populate quickfix on current file" })

vim.api.nvim_create_user_command("FileNpxEsLint", function()
  local filepath = vim.fn.expand("%:p")
  vim.opt.makeprg = "npx eslint -f unix --fix" .. filepath
  vim.opt.errorformat = "%f:%l:%c: %m"

  vim.cmd("Make")
end, { desc = "Run EsLint async and populate quickfix on current file" })

vim.api.nvim_create_user_command("FileYarnWsServerJest", function()
  local filepath = vim.fn.expand("%:p")
  vim.opt.makeprg = "yarn w server test --testPathPattern " .. filepath
  vim.opt.errorformat = "%f:%l:%c:%t: %m"

  vim.cmd("Make")
end, { desc = "Run Jest async inside the workspace server and populate quickfix on current file" })

vim.api.nvim_create_user_command("FileNpxJest", function()
  local filepath = vim.fn.expand("%:p")
  vim.opt.makeprg = "npx jest --testPathPattern " .. filepath
  vim.opt.errorformat = "%f:%l:%c:%t: %m"

  vim.cmd("Make")
end, { desc = "Run Jest async and populate quickfix on current file" })

vim.api.nvim_create_user_command("CopyFileAbsolutePath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("CopyFileName", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify('Copied "' .. filename .. '" to the clipboard!')
end, {})
