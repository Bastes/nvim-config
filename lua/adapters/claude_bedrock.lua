local helpers = require("codecompanion.adapters.acp.helpers")

---Custom Claude Code adapter that uses AWS Bedrock authentication
---@class CodeCompanion.ACPAdapter.ClaudeBedrock
---@field env table<string, string> Environment variables to set
return {
  name = "claude_bedrock",
  formatted_name = "Claude Code (AWS Bedrock)",
  type = "acp",
  roles = {
    llm = "assistant",
    user = "user",
  },
  opts = {
    vision = true,
  },
  commands = {
    default = {
      "claude-agent-acp",
    },
  },
  defaults = {
    mcpServers = {},
    timeout = 20000, -- 20 seconds
  },
  env = {
    -- AWS Bedrock environment variables
    AWS_PROFILE = "claude",
    AWS_REGION = "eu-west-1",
    CLAUDE_CODE_USE_BEDROCK = "1",
  },
  parameters = {
    protocolVersion = 1,
    clientCapabilities = {
      fs = { readTextFile = true, writeTextFile = true },
    },
    clientInfo = {
      name = "CodeCompanion.nvim",
      version = "1.0.0",
    },
  },
  handlers = {
    ---@param self CodeCompanion.ACPAdapter.ClaudeBedrock
    ---@return boolean
    setup = function(self)
      -- Ensure AWS environment variables are set
      if self.env then
        if self.env.AWS_PROFILE then
          vim.env.AWS_PROFILE = self.env.AWS_PROFILE
        end
        if self.env.AWS_REGION then
          vim.env.AWS_REGION = self.env.AWS_REGION
        end
        if self.env.CLAUDE_CODE_USE_BEDROCK then
          vim.env.CLAUDE_CODE_USE_BEDROCK = self.env.CLAUDE_CODE_USE_BEDROCK
        end
      end
      return true
    end,

    ---Skip OAuth authentication for AWS Bedrock
    ---@param _ CodeCompanion.ACPAdapter.ClaudeBedrock
    ---@return boolean
    auth = function(_)
      -- AWS Bedrock handles authentication via AWS SDK
      -- No OAuth token needed
      return true
    end,

    ---@param self CodeCompanion.ACPAdapter.ClaudeBedrock
    ---@param messages table
    ---@param capabilities table
    ---@return table
    form_messages = function(self, messages, capabilities)
      return helpers.form_messages(self, messages, capabilities)
    end,

    ---@param _ CodeCompanion.ACPAdapter.ClaudeBedrock
    ---@param code number
    ---@return nil
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify(
          string.format("Claude agent exited with code %d. Check AWS credentials: aws sso login --profile claude", code),
          vim.log.levels.ERROR
        )
      end
    end,
  },
}
