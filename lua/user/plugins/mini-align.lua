-- import lualine plugin safely
local status, minialign = pcall(require, "mini.align")
if not status then
  print("fail")
  return
end

minialign.setup()
