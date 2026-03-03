local helpers = require("codecompanion.adapters.acp.helpers")

---Custom Claude Code adapter that uses AWS Bedrock authentication
---@class CodeCompanion.ACPAdapter.ClaudeBedrock: CodeCompanion.ACPAdapter
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
    ---@param self CodeCompanion.ACPAdapter
    ---@return boolean
    setup = function(self)
      -- Ensure AWS environment variables are set
      if self.env_replaced.AWS_PROFILE then
        vim.env.AWS_PROFILE = self.env_replaced.AWS_PROFILE
      end
      if self.env_replaced.AWS_REGION then
        vim.env.AWS_REGION = self.env_replaced.AWS_REGION
      end
      if self.env_replaced.CLAUDE_CODE_USE_BEDROCK then
        vim.env.CLAUDE_CODE_USE_BEDROCK = self.env_replaced.CLAUDE_CODE_USE_BEDROCK
      end
      return true
    end,

    ---Skip OAuth authentication for AWS Bedrock
    ---@param self CodeCompanion.ACPAdapter
    ---@return boolean
    auth = function(self)
      -- AWS Bedrock handles authentication via AWS SDK
      -- No OAuth token needed
      return true
    end,

    ---@param self CodeCompanion.ACPAdapter
    ---@param messages table
    ---@param capabilities table
    ---@return table
    form_messages = function(self, messages, capabilities)
      return helpers.form_messages(self, messages, capabilities)
    end,

    ---@param self CodeCompanion.ACPAdapter
    ---@param code number
    ---@return nil
    on_exit = function(self, code)
      if code ~= 0 then
        vim.notify(
          string.format("Claude agent exited with code %d. Check AWS credentials: aws sso login --profile claude", code),
          vim.log.levels.ERROR
        )
      end
    end,
  },
}
