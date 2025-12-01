local function wrap_text(text, width)
  local lines = {}  -- Store the final wrapped lines

  -- Split the string by existing newline characters first
  for paragraph in text:gmatch("([^\n]*)\n?") do
    if paragraph ~= "" then
      local line = ""
      for word in paragraph:gmatch("%S+") do
        -- If adding the word exceeds width, start a new line
        if #line + #word + (#line > 0 and 1 or 0) > width then
          table.insert(lines, line)
          line = word
        else
          if #line > 0 then
            line = line .. " " .. word
          else
            line = word
          end
        end
      end
      if line ~= "" then
        table.insert(lines, line)
      end
    else
      -- Preserve empty lines
      table.insert(lines, "")
    end
  end

  -- Join the lines with newline characters
  return table.concat(lines, "\n")
end

local random_pterry_quote = function()
  local quotes_path = vim.fn.stdpath("config") .. "/quotes/pterry-quotes.json"
  local f = io.open(quotes_path, "r")
  if not f then
    return "No quote file found."
  end
  local content = f:read("*a")
  f:close()

  local ok, quotes = pcall(vim.json.decode, content)
  if not ok or type(quotes) ~= "table" then
    return "Failed to parse quotes."
  end

  math.randomseed(os.time())
  local quote = quotes[math.random(#quotes)]
  return wrap_text(quote.text .. "\n\n" .. quote.author, 70) or ""
end

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
          section = "keys",
          gap = 0,
          padding = 2,
          align = "center",
        },
        {
          section = "startup",
        },
        {
          text = random_pterry_quote(),
          pane = 2,
          padding = 2,      -- Optional padding above/below the footer
          align = "center", -- Optional alignment (left, center, right)
          hl = "comment"
        },
        {
          section = "terminal",
          pane = 2,
          cmd = "cbonsai -l -i -L 30",
          height = 30,
          indent = 0,
          gap = 0,
          padding = 1,
        },
      },
    },
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.5 * 1024 * 1024
    },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  lazy = false,
  keys = {
    {
      "<leader>d",
      function()
        if Snacks.dim.enabled then
          Snacks.dim.disable()
        else
          Snacks.dim.enable()
        end
      end,
      desc = "[d]im toggle"
    },
    {
      "<C-t>",
      function()
        Snacks.terminal.toggle()
      end,
      desc = "[t]erminal toggle"
    },
  },
}
