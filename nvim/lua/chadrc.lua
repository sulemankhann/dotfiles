-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",

    -- hl_override = {
    -- 	Comment = { italic = true },
    -- 	["@comment"] = { italic = true },
    -- },
    hl_override = {
        Search = { bg = "#F5E0DC", fg = "#302D41" }, -- Light pink background, dark text
        IncSearch = { bg = "#F28FAD", fg = "#302D41" }, -- Vibrant pinkish-red background, dark text
    },
}

return M
