return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "qwen"
      },
      inline = {
        adapter = "qwen"
      },
      cmd = {
        adapter = "qwen"
      },
    },
    adapters = {
      http = {
        qwen = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen",
            schema = {
              model = {
                default = "qwen2.5-coder:7b",
              },
              num_ctx = {
                default = 16384,
              },
              think = {
                default = false,
              },
              keep_alive = {
                default = "5m",
              },
            },
          })
        end,
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          make_vars = true,
          make_slash_commands = true,
          show_result_in_chat = true
        }
      }
    },
    opts = {
      log_level = "DEBUG",
    },
  }
}
