local M = {}

M.setup_dap = function()
  local dap = require("dap")

  dap.adapters.lldb = {
    type = "executable",
    -- install using `sudo apt install lldb-13`
    command = "/usr/bin/lldb-vscode-13",
    name = "lldb",
  }

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }

  dap.configurations.rust= {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }


end




return M
