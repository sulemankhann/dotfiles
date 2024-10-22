local lint = require "lint"

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "flake8" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
}

lint.linters.luacheck.args = {
    "--globals",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

lint.linters.eslint_d.args = {
    "--no-ignore",
    "--format",
    "json",
    "--stdin",
    "--stdin-filename",
    function()
        return vim.api.nvim_buf_get_name(0)
    end,
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.keymap.set("n", "<leader>l", function()
    lint.try_lint()
end, { desc = "trigger linting for current file" })
