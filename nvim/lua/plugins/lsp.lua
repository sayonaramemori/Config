return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          -- Web
          "vue_ls",
          "vtsls",
          -- Python
          "pyright",
          -- C/C++
          "clangd",
          -- Rust
          "rust_analyzer",
        },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- ========= Web =========
      vim.lsp.config("vtsls", {
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
        },
      })

      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
      })

      -- ========= Python =========
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- 科研友好
              autoImportCompletions = true,
            },
          },
        },
      })

      -- ========= C / C++ =========
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
      })

      -- ========= Rust =========
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
            check = {
              command = "clippy",
            },
          },
        },
      })
    end,
  },
}

