for index, data in ipairs(require("astronvim.utils").plugin_opts "lazy.nvim") do
  print(index)

  for key, value in pairs(data) do
    print("\t", key, value)
  end
end

return {
  colorscheme = "catppuccin",
}
