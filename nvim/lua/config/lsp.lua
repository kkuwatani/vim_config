local M = {}

function M.on_attach(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, opts)
end

function M.setup()
  local group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })

  vim.keymap.set("i", "<C-Space>", function()
    vim.lsp.completion.get()
  end, { silent = true, desc = "Trigger LSP completion" })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.name == "copilot" then
        return
      end

      M.on_attach(client, args.buf)

      if client:supports_method("textDocument/completion", args.buf) then
        vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      end
    end,
  })
end

return M
