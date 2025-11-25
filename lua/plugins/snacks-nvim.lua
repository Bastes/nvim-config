return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        header = [[
<-. (`-')_  (`-')  _                 (`-')  _     <-. (`-')  
   \( OO) ) ( OO).-/     .->        _(OO ) (_)       \(OO )_ 
,--./ ,--/ (,------.(`-')----. ,--.(_/,-.\ ,-(`-'),--./  ,-.)
|   \ |  |  |  .---'( OO).-.  '\   \ / (_/ | ( OO)|   `.'   |
|  . '|  |)(|  '--. ( _) | |  | \   /   /  |  |  )|  |'.'|  |
|  |\    |  |  .--'  \|  |)|  |_ \     /_)(|  |_/ |  |   |  |
|  | \   |  |  `---.  '  '-'  '\-'\   /    |  |'->|  |   |  |
`--'  `--'  `------'   `-----'     `-'     `--'   `--'   `--']],
      },
      sections = {
        { section = "header" },
        {
          footer = [[]],
          padding = 2,      -- Optional padding above/below the footer
          align = "center", -- Optional alignment (left, center, right)
          hl = "comment"
        },
        {
          pane = 2,
          section = "terminal",
          cmd = "cbonsai -l -i -L 30",
          height = 30,
          indent = 0,
          gap = 0,
          padding = 1
        },
        {
          pane = 3,
          section = "keys",
          gap = 0,
          indent = 5,
          padding = 0,
          align = "left",
        },
        {
          pane = 2,
          section = "startup"
        },
      },
    }
  }
}
