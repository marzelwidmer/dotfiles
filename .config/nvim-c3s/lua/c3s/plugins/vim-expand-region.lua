-- import comment plugin safely
local setup, comment = pcall(require, "vim-expand-region")
if not setup then
  return
end

-- enable comment
comment.setup()
