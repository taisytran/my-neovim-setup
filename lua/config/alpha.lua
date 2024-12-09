local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  "🚀 Welcome to Neovim 🚀",
  "💻 Happy Coding 💻",
}

dashboard.section.buttons.val = {
  dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
  dashboard.button("b", "  Bookmarks", ":Telescope marks<CR>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

dashboard.section.footer.val = "Enjoy coding with Neovim!"

alpha.setup(dashboard.config)
