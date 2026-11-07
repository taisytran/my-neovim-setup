-- Snacks.nvim configuration
-- Dashboard with Recent Projects and Keybindings

require("snacks").setup({
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { title = "Recent Projects", section = "projects", indent = 2, padding = 1 },
      { title = "Quick Actions", section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    },
    formats = {
      key = function(item)
        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
      end,
    },
    preset = {
      header = [[
   ███╗   ███╗ █████╗ ███╗   ██╗ ██████╗  ██████╗  ██████╗ 
   ████╗ ████║██╔══██╗████╗  ██║██╔════╝ ██╔═══██╗██╔═══██╗
   ██╔████╔██║███████║██╔██╗ ██║██║  ███╗██║   ██║██║   ██║
   ██║╚██╔╝██║██╔══██║██║╚██╗██║██║   ██║██║   ██║██║   ██║
   ██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╔╝╚██████╔╝╚██████╔╝
   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝  ╚═════╝ 
      ]],
      keys = {
        { icon = " ", key = "p", desc = "Find Files", action = ":Telescope find_files" },
        { icon = " ", key = "f", desc = "Find Text", action = ":Telescope live_grep" },
        { icon = " ", key = "o", desc = "Recent Files", action = ":Telescope oldfiles" },
        { icon = "󰙅 ", key = "-", desc = "NvimTree", action = ":NvimTreeToggle" },
        { icon = "󰒲 ", key = "l", desc = "Lazy Menu", action = ":Lazy" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
  },
  image = { enabled = require("snacks.image").supports_terminal() },
  indent = { enabled = true },
  notifier = { enabled = true },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
})
