local M = {}
local config = require("spring_boot.config")

M.get_jdtls_client = function()
  return require("spring_boot.util").get_client(config.jdtls_name)
end

M.execute_command = function(command, param)
  local err, resp = require("jdtls.util").execute_command({
    command = command,
    arguments = param,
  })
  if err then
    vim.notify("Error executeCommand: " .. command, vim.log.levels.ERROR)
  end
  return resp
end

return M
