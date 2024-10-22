local options = {
    formatters_by_ft = {
        lua = { "stylua" },

        -- web
        -- Pettier
        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },

        -- golang
        go = { "gofumpt", "golines" },
        gomod = { "gofumpt", "goimports-reviser" },
        gowork = { "gofumpt", "goimports-reviser" },
        gotmpl = { "prettier" },

        -- python
        python = { "isort", "black" },

        -- nix
        nix = { "alejandra" },
    },
    formatters = {

        -- golang
        ["goimports-reviser"] = {
            prepend_args = { "-rm-unused" },
        },
        golines = {
            prepend_args = { "--max-len=80" },
        },

        -- python
        black = {
            prepend_args = {
                "--fast",
            },
        },
        isort = {
            prepend_args = {
                "--profile",
                "black",
            },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
    },
}

return options
