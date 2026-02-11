-- Check if lspmux socket is available at localhost:27631
-- This is only needed because of Zipline's build system. Do not commit.
local socket_check = vim
  .system({ "bash", "-c", "ss -tuplen 2>/dev/null | grep 27631" }, { text = true })
  :wait()

local cmd = nil
if socket_check.code == 0 then
  cmd = vim.lsp.rpc.connect("127.0.0.1", 27631)
end

if cmd then
  vim.notify("lspmux connected: rust-analyzer via 127.0.0.1:27631", vim.log.levels.INFO)

  local on_attach = require("config.lsp").on_attach
  vim.lsp.config("rust_analyzer", { cmd = cmd, on_attach = on_attach })
  vim.lsp.enable("rust_analyzer")
else
  vim.notify("lspmux socket missing; rust-analyzer not enabled", vim.log.levels.WARN)
end
