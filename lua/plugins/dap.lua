return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dab")
      dap.adapters.c = {
        type = "executable",
        command = "lldb-dap",
      }
    end,
    enabled = false,
  },
}
