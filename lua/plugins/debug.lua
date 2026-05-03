return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      ui.setup()

      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config = function() ui.close() end

      dap.adapters["probe-rs"] = {
        type = "server",
        port = "${port}",
        executable = {
          command = "probe-rs",
          args = { "dap-server", "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Probe-rs Debug",
          type = "probe-rs",
          request = "launch",
          chip = "STM32F407VETx", 
          cwd = "${workspaceFolder}",

          program = function()
            return vim.fn.input("Path to elf: ", vim.fn.getcwd() .. "/target/thumbv7em-none-eabihf/debug/", "file")
          end,

          runtimeExecutable = "probe-rs",
          runtimeArgs = { "dap-server" },

          flashingConfig = {
            enabled = true,
            haltAfterReset = true,
          },
        },
      }

    end,
  },
}
