return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ravitemer/mcphub.nvim",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "qwen2_5"
      },
      inline = {
        adapter = "qwen2_5"
      },
      cmd = {
        adapter = "qwen2_5"
      },
    },
    adapters = {
      http = {
        qwen2_5 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen2_5",
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
        qwen3 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen3",
            schema = {
              model = {
                default = "qwen3-coder:30b",
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
    memory = {
      opts = {
        chat = {
          enabled = true,
          default_memory = "default",
        },
      },
    },
    opts = {
      log_level = "DEBUG",
    },
  },
  keys = {
    {
      "<leader>C",
      "<cmd>CodeCompanionChat Toggle<CR>",
      desc = "[C]odeCompanion chat toggle"
    },
    {
      "<leader>ca",
      "<cmd>CodeCompanionActions<CR>",
      desc = "CodeCompanion Actions"
    },
  },
}
