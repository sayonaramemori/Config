-- ===== Neovim 0.11+ 内置 LSP：Python + C++（clangd） =====

-- 1) 诊断/弹窗 UI
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

-- 2) LSP 附加后：键位 + inlay hints + 内置补全
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if vim.lsp.inlay_hint then pcall(vim.lsp.inlay_hint, bufnr, true) end

    vim.opt.completeopt = { "menuone", "noselect", "popup" }
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end
    map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "K",  vim.lsp.buf.hover, "Hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map({ "n", "x" }, "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
  end,
})

-- 3) Python: pyright
vim.lsp.config('pyright', {
  root_markers = {
    "pyproject.toml","setup.py","setup.cfg","requirements.txt","Pipfile",
    "pyrightconfig.json",".git",
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
          callArgumentNames = "all",
        },
      },
    },
  },
})

-- 4) C++: clangd
-- 常用参数说明：
--  * --background-index：后台建索引，加速全局跳转
--  * --clang-tidy：启用 clang-tidy 诊断（需工程里有 .clang-tidy 或默认规则）
--  * --header-insertion=…：自动补全时插入必要头文件（"iwyu"/"never"）
--  * --cross-file-rename：跨文件重命名
--  * --completion-style=detailed：更详细的补全项
vim.lsp.config('clangd', {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    '--cross-file-rename',
  },
  -- 根目录识别：优先 compile_commands.json，其次 CMake/Make 等
  root_markers = {
    'compile_commands.json', 'compile_flags.txt', 'CMakeLists.txt',
    'build/compile_commands.json', '.git', 'Makefile',
  },
  -- 额外初始化设置（可按需打开）
  -- settings = {
  --   clangd = {
  --     fallbackFlags = { "-std=c++20" }, -- 当无法从编译数据库推断时
  --   },
  -- },
})

-- （可选）Ruff 语言服务器（Python 风格/静态检查）
-- vim.lsp.config('ruff', {
--   cmd = { 'ruff-lsp' },
--   root_markers = { "pyproject.toml", "ruff.toml", ".git" },
--   init_options = { settings = { args = {} } },
-- })

-- 5) 启动：按需启用你配置的服务器
vim.lsp.enable({ 'pyright', 'clangd' })
-- 若上面启用了 ruff：
-- vim.lsp.enable({ 'pyright', 'clangd', 'ruff' })

